import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'

// Repo stats for the header badge. Same shape as the release loader: fetched at
// prerender, baked into the HTML, so a visitor never calls the GitHub API and
// the site keeps shipping no client JavaScript for it.
//
// The cost is staleness. A push refreshes it, a rox release refreshes it through
// the repository_dispatch, and the daily cron in deploy.yml catches the rest, so
// the number is at worst a day behind.

const API = 'https://api.github.com/repos/zealsprince/rox'
const CACHE = path.resolve('src/data/repo.generated.json')
const FALLBACK = path.resolve('src/data/repo.fallback.json')
const CACHE_TTL_MS = 60 * 60 * 1000

export interface Repo {
  stars: number
  /** True when the number came from the committed fallback, not the API. */
  stale: boolean
}

interface ApiRepo {
  stargazers_count: number
}

async function readCache(): Promise<ApiRepo | null> {
  try {
    const stat = await fs.stat(CACHE)
    if (Date.now() - stat.mtimeMs > CACHE_TTL_MS)
      return null
    return JSON.parse(await fs.readFile(CACHE, 'utf-8')) as ApiRepo
  }
  catch {
    return null
  }
}

async function fetchRepo(): Promise<ApiRepo> {
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
  return await res.json() as ApiRepo
}

export async function loadRepo(): Promise<Repo> {
  const cached = await readCache()
  if (cached)
    return { stars: cached.stargazers_count, stale: false }

  try {
    const fresh = await fetchRepo()
    await fs.writeFile(
      CACHE,
      `${JSON.stringify({ stargazers_count: fresh.stargazers_count }, null, 2)}\n`,
    )
    return { stars: fresh.stargazers_count, stale: false }
  }
  catch (error) {
    console.warn(`[repo] live fetch failed, falling back: ${(error as Error).message}`)
    const raw = await fs.readFile(FALLBACK, 'utf-8')
    return { stars: (JSON.parse(raw) as ApiRepo).stargazers_count, stale: true }
  }
}
