import type { RequestHandler } from './$types'
import { SITE } from '$data/site'

export const prerender = true

// Hand-listed rather than crawled: three pages, and an explicit list can't
// accidentally publish a route that was meant to stay unlinked.
const PATHS = ['/', '/download', '/workspaces']

export const GET: RequestHandler = async () => {
  const urls = PATHS.map(
    p => `  <url><loc>${new URL(p, SITE.origin).href}</loc></url>`,
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
