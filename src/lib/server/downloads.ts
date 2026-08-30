import type { CountedRelease, History, Sample } from '$lib/downloads'
import type { Bucket, Downloads, PlatformDownloads, Strip } from '$types/downloads'
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { dev } from '$app/environment'
import { channelsFor } from '$data/channels'
import { PLATFORMS } from '$data/platforms'
import { countReleases, fetchReleases, weeklyBuckets } from '$lib/downloads'
import { mockHistory, mockWeeks } from '$lib/server/mock-history'

// Same shape as release.ts and repo.ts: fetched at prerender, baked into the
// HTML, so nobody visiting the site calls the GitHub API.
//
// Two strips come out of here. The release strip needs nothing stored, because a
// release is already a point in time and its `download_count` is its own. The
// weekly strip is the opposite: `download_count` is a running total GitHub keeps
// no history for, so a week only exists if two snapshots a week apart were
// written down. That's downloads.history.json, and until it's deep enough the
// weekly strip is null and the page renders without it.

const CACHE = path.resolve('src/data/downloads.generated.json')
const FALLBACK = path.resolve('src/data/downloads.fallback.json')
const HISTORY = path.resolve('src/data/downloads.history.json')
const CACHE_TTL_MS = 60 * 60 * 1000

/**
 * Complete weeks needed before the weekly view is offered at all.
 *
 * Four is the fewest that reads as a trend rather than as a couple of bars
 * someone forgot to finish. Under it the release strip is the whole story, and
 * a section that says "by week" over two segments is worse than no section.
 */
const MIN_WEEKS_VISIBLE = 4

/**
 * Complete weeks before the weekly view is the one the page opens on.
 *
 * Half a year. Between this and MIN_WEEKS_VISIBLE the weekly strip is there to
 * be picked but doesn't lead, because a short strip of recent weeks says less
 * about the project than every release it has ever shipped. Past it the
 * relationship inverts and recent trend is the more useful default.
 */
const MIN_WEEKS_DEFAULT = 26

async function readCache(): Promise<CountedRelease[] | null> {
  try {
    const stat = await fs.stat(CACHE)
    if (Date.now() - stat.mtimeMs > CACHE_TTL_MS)
      return null
    return JSON.parse(await fs.readFile(CACHE, 'utf-8')) as CountedRelease[]
  }
  catch {
    return null
  }
}

async function counts(): Promise<{ releases: CountedRelease[], stale: boolean }> {
  const cached = await readCache()
  if (cached)
    return { releases: cached, stale: false }

  try {
    const counted = countReleases(await fetchReleases(process.env.GITHUB_TOKEN))
    await fs.writeFile(CACHE, `${JSON.stringify(counted, null, 2)}\n`)
    return { releases: counted, stale: false }
  }
  catch (error) {
    console.warn(`[downloads] live fetch failed, falling back: ${(error as Error).message}`)
    const raw = await fs.readFile(FALLBACK, 'utf-8')
    return { releases: JSON.parse(raw) as CountedRelease[], stale: true }
  }
}

/**
 * The snapshots, or an invented set of them.
 *
 * The mock is gated on `dev` as well as on the variable, so a build with
 * ROX_MOCK_HISTORY set in the environment still reads the real file. There is no
 * path from this to a published page.
 */
async function history(today: string): Promise<{ samples: Sample[], mocked: boolean }> {
  const switched = process.env.ROX_MOCK_HISTORY
  if (dev && switched) {
    const weeks = mockWeeks(switched)
    console.warn(`[downloads] ROX_MOCK_HISTORY is on, inventing ${weeks} weeks`)
    return { samples: mockHistory(today, weeks), mocked: true }
  }

  try {
    const parsed = JSON.parse(await fs.readFile(HISTORY, 'utf-8')) as History
    return { samples: parsed.samples, mocked: false }
  }
  catch {
    // Before the first snapshot lands there is no history, and the release strip
    // carries the page without one.
    return { samples: [], mocked: false }
  }
}

/** The channel ids behind each platform, resolved once rather than per bucket. */
const IDS_BY_PLATFORM = new Map(
  PLATFORMS.map(platform => [
    platform.id,
    channelsFor(platform.id).map(channel => channel.id),
  ]),
)

/** Sums the channels of one platform out of a per-channel record. */
function forPlatform(counts: Record<string, number>, platform: string): number {
  return (IDS_BY_PLATFORM.get(platform as never) ?? [])
    .reduce((sum, id) => sum + (counts[id] ?? 0), 0)
}

function strip(kind: Strip['kind'], buckets: Bucket[]): Strip {
  const platforms: PlatformDownloads[] = PLATFORMS.map(platform => ({
    platform: platform.id,
    total: buckets.reduce((sum, b) => sum + b.byPlatform[platform.id], 0),
    // Floored at 1 so the shading divides by something on a platform that has
    // not been downloaded yet.
    peak: Math.max(1, ...buckets.map(b => b.byPlatform[platform.id])),
  }))

  return {
    kind,
    buckets,
    platforms,
    total: buckets.reduce((sum, b) => sum + b.total, 0),
  }
}

/** Per-channel counts spread across the platforms, plus the bucket's own sum. */
function split(counts: Record<string, number>): Pick<Bucket, 'byPlatform' | 'total'> {
  const byPlatform = Object.fromEntries(
    PLATFORMS.map(platform => [platform.id, forPlatform(counts, platform.id)]),
  ) as Bucket['byPlatform']

  return {
    byPlatform,
    total: Object.values(byPlatform).reduce((sum, n) => sum + n, 0),
  }
}

export async function loadDownloads(): Promise<Downloads> {
  const today = new Date().toISOString().slice(0, 10)
  const { releases: counted, stale } = await counts()
  const { samples, mocked } = await history(today)

  const byRelease = strip('release', counted.map(release => ({
    key: release.tag.replace(/^v/, ''),
    at: release.publishedAt,
    ...split(release.counts),
  })))

  const weeks = weeklyBuckets(samples, today)
  const byWeek = weeks.length < MIN_WEEKS_VISIBLE
    ? null
    : strip('week', weeks.map(week => ({
        key: week.start,
        at: `${week.start}T00:00:00Z`,
        ...split(week.channels),
      })))

  return {
    byRelease,
    byWeek,
    weekLeads: weeks.length >= MIN_WEEKS_DEFAULT,
    stale,
    mocked,
  }
}
