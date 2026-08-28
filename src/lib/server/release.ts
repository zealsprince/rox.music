import type { Platform, Release, ReleaseAsset } from '$types/release'
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { PLATFORMS } from '$data/platforms'

// The download page is prerendered, so this runs at build time and the visitor
// never talks to GitHub. rox's release workflow pings this repo with a
// repository_dispatch on publish, which rebuilds the site and refreshes it.
//
// Two layers of insurance: a local cache so `npm run dev` doesn't hit the API on
// every restart, and a checked-in fallback so a GitHub outage or a rate limit
// degrades the page to the last known release instead of failing the build.

const API = 'https://api.github.com/repos/zealsprince/rox/releases/latest'
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
  assets: ApiAsset[]
}

/**
 * Picks the assets a platform can claim out of a release: the archive, plus
 * the alt artifact (the .deb, the Windows installer) where the platform
 * declares one. Matched on suffix rather than substring: the installer's name
 * carries the same `windows-x86_64` slug as the zip, so a substring match
 * would hand whichever GitHub lists first to both slots. A platform with no
 * matching asset is dropped rather than rendered as a dead link.
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

function normalize(api: ApiRelease, stale: boolean): Release {
  return {
    version: api.tag_name.replace(/^v/, ''),
    tag: api.tag_name,
    url: api.html_url,
    publishedAt: api.published_at,
    assets: PLATFORMS.flatMap(p =>
      bySuffix(api.assets, p, `${p.artifact}.${p.archive}`)),
    alts: PLATFORMS.flatMap(p =>
      p.alt ? bySuffix(api.assets, p, p.alt.suffix) : []),
    stale,
  }
}

async function readCache(): Promise<ApiRelease | null> {
  try {
    const stat = await fs.stat(CACHE)
    if (Date.now() - stat.mtimeMs > CACHE_TTL_MS)
      return null
    return JSON.parse(await fs.readFile(CACHE, 'utf-8')) as ApiRelease
  }
  catch {
    return null
  }
}

async function fetchLatest(): Promise<ApiRelease> {
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
  return await res.json() as ApiRelease
}

export async function loadRelease(): Promise<Release> {
  const cached = await readCache()
  if (cached)
    return normalize(cached, false)

  try {
    const fresh = await fetchLatest()
    await fs.writeFile(CACHE, `${JSON.stringify(fresh, null, 2)}\n`)
    return normalize(fresh, false)
  }
  catch (error) {
    // Loud, because a build that silently ships a stale version number is worse
    // than one that tells you why.
    console.warn(`[release] live fetch failed, falling back: ${(error as Error).message}`)
    const raw = await fs.readFile(FALLBACK, 'utf-8')
    return normalize(JSON.parse(raw) as ApiRelease, true)
  }
}
