import type { RequestHandler } from './$types'
import { SITE } from '$data/site'
import { loadRelease } from '$lib/server/release'

export const prerender = true

// Hand-listed rather than crawled: three pages, and an explicit list can't
// accidentally publish a route that was meant to stay unlinked.
//
// Paths carry no trailing slash, matching `trailingSlash: 'never'` and the
// canonical tags. A sitemap that disagrees with the canonical is a reliable way
// to get the wrong URL indexed.
const PATHS = [
  { path: '/', priority: '1.0', changefreq: 'monthly' },
  { path: '/download', priority: '0.9', changefreq: 'weekly' },
  { path: '/workspaces', priority: '0.7', changefreq: 'monthly' },
]

export const GET: RequestHandler = async () => {
  // The release date is the only real "last changed" signal the site has: a new
  // rox release is what triggers a rebuild, so it dates every page honestly.
  // Faking a lastmod of "today" on every build teaches crawlers to ignore it.
  const release = await loadRelease()
  const lastmod = release.publishedAt.slice(0, 10)

  const urls = PATHS.map(
    ({ path, priority, changefreq }) => `  <url>
    <loc>${new URL(path, SITE.origin).href}</loc>
    <lastmod>${lastmod}</lastmod>
    <changefreq>${changefreq}</changefreq>
    <priority>${priority}</priority>
  </url>`,
  ).join('\n')

  const body = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls}
</urlset>
`

  return new Response(body, {
    headers: { 'content-type': 'application/xml' },
  })
}
