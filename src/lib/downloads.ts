/**
 * Download counts from the GitHub releases API, and the shape the site keeps
 * them in.
 *
 * The API hands out `download_count` per asset as a running total with no
 * history behind it. Per release that's enough on its own, because a release is
 * already a point in time and the count beside it is that release's own: the
 * strips on the download page render off a cold build with nothing stored.
 *
 * Anything on a calendar axis is a different matter, and the only way to get one
 * later is to have been writing the totals down since now. `Sample` and
 * `snapshot` are that, used by scripts/snapshot-downloads.ts and by nothing that
 * renders.
 *
 * Alias-free on purpose. scripts/snapshot-downloads.ts imports this under tsx,
 * where `$lib` doesn't resolve.
 */

import { CHANNELS } from '../data/channels'

const API = 'https://api.github.com/repos/zealsprince/rox/releases'
const PER_PAGE = 100
/** rox is at 42 releases. The cap is a runaway guard, not a limit anyone hits. */
const MAX_PAGES = 10

interface ApiAsset {
  name: string
  download_count: number
}

interface ApiRelease {
  tag_name: string
  published_at: string
  draft?: boolean
  assets: ApiAsset[]
}

/** One release, reduced to what it contributes to the counts. */
export interface CountedRelease {
  tag: string
  publishedAt: string
  /** Keyed by channel id. A channel with no asset in this release is absent. */
  counts: Record<string, number>
}

/** One day's totals, as the snapshot workflow writes them. */
export interface Sample {
  date: string
  total: number
  channels: Record<string, number>
}

export interface History {
  samples: Sample[]
}

export async function fetchReleases(token?: string): Promise<ApiRelease[]> {
  const out: ApiRelease[] = []

  for (let page = 1; page <= MAX_PAGES; page++) {
    const res = await fetch(`${API}?per_page=${PER_PAGE}&page=${page}`, {
      headers: {
        'accept': 'application/vnd.github+json',
        'user-agent': 'rox.music-build',
        ...(token ? { authorization: `Bearer ${token}` } : {}),
      },
    })
    if (!res.ok)
      throw new Error(`GitHub API returned ${res.status} ${res.statusText}`)

    const batch = await res.json() as ApiRelease[]
    out.push(...batch)
    if (batch.length < PER_PAGE)
      break
  }

  return out
}

/**
 * Releases reduced to per-channel counts, oldest first.
 *
 * Drafts are dropped, and so is anything the channel suffixes don't claim,
 * which is how SHA256SUMS.txt stays out of a chart about how many people
 * downloaded rox.
 */
export function countReleases(releases: ApiRelease[]): CountedRelease[] {
  return releases
    .filter(release => !release.draft)
    .map(release => ({
      tag: release.tag_name,
      publishedAt: release.published_at,
      counts: Object.fromEntries(
        CHANNELS.flatMap((channel) => {
          const asset = release.assets.find(a => a.name.endsWith(channel.suffix))
          return asset ? [[channel.id, asset.download_count] as const] : []
        }),
      ),
    }))
    .sort((a, b) => a.publishedAt.localeCompare(b.publishedAt))
}

/** What one snapshot row records: the all-time total per channel, plus the sum. */
export function snapshot(counted: CountedRelease[], date: string): Sample {
  const channels: Record<string, number> = {}
  for (const channel of CHANNELS)
    channels[channel.id] = counted.reduce((sum, r) => sum + (r.counts[channel.id] ?? 0), 0)

  return {
    date,
    total: Object.values(channels).reduce((sum, n) => sum + n, 0),
    channels,
  }
}

/** The Monday of the ISO week a date falls in, as its own YYYY-MM-DD. */
export function weekStart(date: string): string {
  const at = new Date(`${date}T00:00:00Z`)
  // getUTCDay puts Sunday at 0. Shift so Monday is 0, since an ISO week starts
  // on Monday and a Sunday-start week would split every release weekend.
  at.setUTCDate(at.getUTCDate() - ((at.getUTCDay() + 6) % 7))
  return at.toISOString().slice(0, 10)
}

export interface Week {
  /** Monday of the week, YYYY-MM-DD. */
  start: string
  /** Downloads during the week, per channel id. */
  channels: Record<string, number>
}

/**
 * Daily cumulative snapshots turned into what each week actually pulled.
 *
 * Snapshots are running totals, so a week is worth the difference between its
 * last sample and the previous week's last sample. Three things fall out of
 * that and all three are deliberate:
 *
 *   The oldest recorded week is dropped. There's no earlier sample to subtract,
 *   so its number would be the all-time total masquerading as one week.
 *
 *   The week in progress is dropped. It's a partial week and would always draw
 *   short, which reads as a collapse in interest rather than as a Tuesday.
 *
 *   A gap in the snapshots lands on the week that ends it. If the workflow is
 *   down for ten days, those downloads are attributed to the week the next
 *   sample falls in rather than lost. Coarser, never wrong in total.
 *
 * Clamped at zero per channel, because `download_count` drops when a release is
 * deleted or an asset re-uploaded, and a negative bar is bookkeeping showing
 * through as data.
 */
export function weeklyBuckets(samples: Sample[], today: string): Week[] {
  // Samples arrive oldest first, so the last write per week wins.
  const lastOfWeek = new Map<string, Sample>()
  for (const sample of samples)
    lastOfWeek.set(weekStart(sample.date), sample)

  const weeks = [...lastOfWeek.entries()].sort((a, b) => a[0].localeCompare(b[0]))
  const current = weekStart(today)
  const out: Week[] = []

  for (let i = 1; i < weeks.length; i++) {
    const [start, sample] = weeks[i]
    if (start === current)
      continue

    const previous = weeks[i - 1][1]
    const channels: Record<string, number> = {}
    for (const id of new Set([...Object.keys(sample.channels), ...Object.keys(previous.channels)]))
      channels[id] = Math.max(0, (sample.channels[id] ?? 0) - (previous.channels[id] ?? 0))

    out.push({ start, channels })
  }

  return out
}
