import type { Platform, Release, ReleaseAsset } from '$types/release'
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { PLATFORMS } from '$data/platforms'
import { compareVersions, isPrerelease } from '$lib/version'

// The download page is prerendered, so this runs at build time and the visitor
// never talks to GitHub. rox's release workflow pings this repo with a
// repository_dispatch on publish, which rebuilds the site and refreshes it.
//
// Two layers of insurance: a local cache so `npm run dev` doesn't hit the API on
// every restart, and a checked-in fallback so a GitHub outage or a rate limit
// degrades the page to the last known release instead of failing the build.
//
// The listing rather than the `latest` endpoint, because `latest` hides
// prereleases and a release candidate is one: the newest few releases come
// back and the page picks the stable one and the candidate above it itself.
// Newest first by creation, so both are inside one page of ten.

const API = 'https://api.github.com/repos/zealsprince/rox/releases?per_page=10'
const CACHE = path.resolve('src/data/release.generated.json')
const FALLBACK = path.resolve('src/data/release.fallback.json')
const CACHE_TTL_MS = 60 * 60 * 1000

interface ApiAsset {
  name: string
  browser_download_url: string
  size: number
}

interface ApiRelease {
  tag_name: string
  html_url: string
  published_at: string
  draft?: boolean
  prerelease?: boolean
  assets: ApiAsset[]
}

/** What the download page shows: the stable build, and a candidate if one is ahead of it. */
export interface Releases {
  stable: Release
  candidate: Release | null
}

/**
 * Picks the assets a platform can claim out of a release: the archive, plus
 * every alt artifact it declares (the .deb, the AppImage, the Flatpak bundle,
 * the Windows installer). Matched on suffix rather than substring: the
 * installer's name carries the same `windows-x86_64` slug as the zip, and so
 * does the AppImage, so a substring match would hand whichever GitHub lists
 * first to both slots. An artifact with no matching asset is dropped rather
 * than rendered as a dead link, which is how a release from before the
 * AppImage and the Flatpak existed still renders its two buttons.
 */
function bySuffix(api: ApiAsset[], platform: Platform, suffix: string): ReleaseAsset[] {
  const match = api.find(a => a.name.endsWith(suffix))
  if (!match)
    return []
  return [{
    platform: platform.id,
    name: match.name,
    url: match.browser_download_url,
    size: match.size,
  }]
}

/**
 * Whether a listed release is a candidate. GitHub's flag and the tag's suffix
 * both count, so a release flagged by hand reads the same as one the workflow
 * tagged.
 */
function candidate(api: ApiRelease): boolean {
  return api.prerelease === true || isPrerelease(api.tag_name)
}

function normalize(api: ApiRelease, stale: boolean): Release {
  return {
    version: api.tag_name.replace(/^v/, ''),
    tag: api.tag_name,
    url: api.html_url,
    publishedAt: api.published_at,
    prerelease: candidate(api),
    assets: PLATFORMS.flatMap(p =>
      bySuffix(api.assets, p, `${p.artifact}.${p.archive}`)),
    alts: PLATFORMS.flatMap(p =>
      p.alts.flatMap(alt => bySuffix(api.assets, p, alt.suffix))),
    stale,
  }
}

/**
 * The stable release and the candidate out of a listing.
 *
 * Drafts are unpublished. The stable build is the highest version among the
 * rest that isn't a candidate; the candidate is the highest one that is, and
 * only if it's ahead of the stable build, so the section drops off the page on
 * its own the day the release it previewed ships.
 */
function pick(listed: ApiRelease[], stale: boolean): Releases {
  const published = listed.filter(release => !release.draft)
  const newest = (releases: ApiRelease[]): ApiRelease | undefined =>
    releases.reduce<ApiRelease | undefined>((best, release) =>
      !best || compareVersions(release.tag_name, best.tag_name) > 0 ? release : best, undefined)

  const stable = newest(published.filter(release => !candidate(release)))
  if (!stable)
    throw new Error('no published release')
  const ahead = newest(published.filter(release =>
    candidate(release) && compareVersions(release.tag_name, stable.tag_name) > 0))

  return {
    stable: normalize(stable, stale),
    candidate: ahead ? normalize(ahead, stale) : null,
  }
}

async function readCache(): Promise<ApiRelease[] | null> {
  try {
    const stat = await fs.stat(CACHE)
    if (Date.now() - stat.mtimeMs > CACHE_TTL_MS)
      return null
    const parsed = JSON.parse(await fs.readFile(CACHE, 'utf-8')) as ApiRelease[]
    // A cache from before the listing held one release; refetch rather than
    // read it as none.
    return Array.isArray(parsed) ? parsed : null
  }
  catch {
    return null
  }
}

async function fetchListing(): Promise<ApiRelease[]> {
  const token = process.env.GITHUB_TOKEN
  const res = await fetch(API, {
    headers: {
      'accept': 'application/vnd.github+json',
      'user-agent': 'rox.music-build',
      ...(token ? { authorization: `Bearer ${token}` } : {}),
    },
  })
  if (!res.ok)
    throw new Error(`GitHub API returned ${res.status} ${res.statusText}`)
  return await res.json() as ApiRelease[]
}

export async function loadReleases(): Promise<Releases> {
  const cached = await readCache()
  if (cached)
    return pick(cached, false)

  try {
    const fresh = await fetchListing()
    await fs.writeFile(CACHE, `${JSON.stringify(fresh, null, 2)}\n`)
    return pick(fresh, false)
  }
  catch (error) {
    // Loud, because a build that silently ships a stale version number is worse
    // than one that tells you why.
    console.warn(`[release] live fetch failed, falling back: ${(error as Error).message}`)
    const raw = await fs.readFile(FALLBACK, 'utf-8')
    return pick(JSON.parse(raw) as ApiRelease[], true)
  }
}

/** The stable release alone, which is all any page but the download page shows. */
export async function loadRelease(): Promise<Release> {
  return (await loadReleases()).stable
}
