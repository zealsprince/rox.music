import type { ScreenshotManifest } from '$data/images'
import type { RequestHandler } from './$types'
import { HUB, SIDE_PAGES } from '$data/pages'
import manifest from '$data/screenshots.generated.json'
import { SITE } from '$data/site'
import { WORKSPACES } from '$data/workspaces'
import { alternates, SOURCE_LOCALE } from '$lib/i18n'
import { loadRelease } from '$lib/server/release'

export const prerender = true

// Widest webp variant for a screenshot id, as an absolute URL.
//
// webp rather than avif on purpose: the page offers both and a browser takes
// the avif, but Google Images is the consumer here and its avif support has
// never been something to bet a listing on. The dark half of a pair, because
// that's what the <img> fallback carries, so the crawler and a JS-less visitor
// resolve the same file.
//
// Reading the path and widths off the manifest rather than rebuilding them from
// the id means an image re-encoded at a different size, or written to a
// different folder, can't leave a 404 in the sitemap.
function shot(id: string): string {
  const entry = (manifest as ScreenshotManifest)[id]
  if (!entry)
    throw new Error(`no screenshot "${id}" in the manifest, run: npm run images`)
  const widest = entry.widths[entry.widths.length - 1]
  return new URL(`${entry.path}-${widest}.webp`, SITE.origin).href
}

// Hand-listed rather than crawled: an explicit list can't accidentally publish
// a route that was meant to stay unlinked.
//
// Paths carry no trailing slash, matching `trailingSlash: 'never'` and the
// canonical tags. A sitemap that disagrees with the canonical is a reliable way
// to get the wrong URL indexed.
//
// `images` is the image sitemap extension. It's the only way to tell Google
// about a picture it would otherwise have to find by parsing a <picture> block,
// and for a player whose whole pitch is how it looks, an image listing is worth
// as much as the page listing. Download carries none: it has no screenshots.
const PATHS = [
  { path: '/', priority: '1.0', changefreq: 'monthly', images: ['hero'] },
  { path: '/download', priority: '0.9', changefreq: 'weekly', images: [] },
  {
    path: '/workspaces',
    priority: '0.7',
    changefreq: 'monthly',
    images: WORKSPACES.map(w => w.id),
  },
  // The hub and the pages under it. Lower priority than the nav pages, which is
  // an accurate statement of what they are: worth indexing, not worth outranking
  // the homepage. The list comes from pages.ts so adding a page there can't
  // leave it out of here.
  { path: HUB.path, priority: '0.4', changefreq: 'monthly', images: [] },
  ...SIDE_PAGES.map(item => ({
    path: item.path,
    priority: '0.6',
    changefreq: 'monthly',
    images: item.image ? [item.image] : [],
  })),
]

export const GET: RequestHandler = async () => {
  // The release date is the only real "last changed" signal the site has: a new
  // rox release is what triggers a rebuild, so it dates every page honestly.
  // Faking a lastmod of "today" on every build teaches crawlers to ignore it.
  const release = await loadRelease()
  const lastmod = release.publishedAt.slice(0, 10)

  // Every page, once per locale, and every entry carrying the full alternate
  // set including itself. That reciprocity is the whole protocol: Google reads
  // the cluster as one page in four languages only if all four agree on who's
  // in it, and drops the lot if one of them doesn't list the others.
  const urls = PATHS.flatMap(({ path, priority, changefreq, images }) => {
    const languages = alternates(path, SITE.origin)
    const links = [
      ...languages.map(({ locale, url }) =>
        `\n    <xhtml:link rel="alternate" hreflang="${locale.htmlLang}" href="${url}"/>`),
      `\n    <xhtml:link rel="alternate" hreflang="x-default" href="${
        languages.find(entry => entry.locale.id === SOURCE_LOCALE)!.url
      }"/>`,
    ].join('')

    // Google dropped image:caption and image:title in 2022 and reads only the
    // loc now, so anything else here would be bytes nobody parses. The shots
    // are the same files in every language, so every locale's entry points at
    // them rather than the English one hoarding the image listing.
    const imageTags = images
      .map(id => `\n    <image:image><image:loc>${shot(id)}</image:loc></image:image>`)
      .join('')

    return languages.map(({ locale, url }) => `  <url>
    <loc>${url}</loc>
    <lastmod>${lastmod}</lastmod>
    <changefreq>${changefreq}</changefreq>
    <priority>${locale.id === SOURCE_LOCALE ? priority : bumpDown(priority)}</priority>${links}${imageTags}
  </url>`)
  }).join('\n')

  const body = `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">
${urls}
</urlset>
`

  return new Response(body, {
    headers: { 'content-type': 'application/xml' },
  })
}

/**
 * Translations sit a notch below their English original.
 *
 * Priority is relative within one sitemap and nothing outside it, so this is
 * only saying which URL to crawl first when the crawler has to choose. English
 * is where the inbound links point and where the traffic is, so it goes first;
 * the ranking of any of these against another site is unaffected either way.
 */
function bumpDown(priority: string): string {
  return Math.max(0.1, Number(priority) - 0.1).toFixed(1)
}
