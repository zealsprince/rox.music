import type { LayoutServerLoad } from './$types'
import { localeFromPath, sourcePath } from '$lib/i18n'
import { loadRepo } from '$lib/server/repo'

// Runs once per page at prerender. The header badge is part of the layout, so
// the number has to come from here rather than from any single page's load.
//
// The locale comes off the URL rather than off `params.lang`, because /404 has
// no `[[lang]]` in its route and still renders the header and footer. One
// function answers for every path either way.
export const load: LayoutServerLoad = async ({ url }) => {
  return {
    repo: await loadRepo(),
    locale: localeFromPath(url.pathname),
    path: pageInEveryLocale(url.pathname),
  }
}

/**
 * The path the language picker and the hreflang tags point at.
 *
 * Normally it's this page, stripped of its locale prefix. /404 is the one
 * exception: GitHub Pages serves a single 404.html for every unmatched path on
 * the domain, so there is no /de/404 to translate to and asking for one is a
 * prerender error. The picker sends you to the locale's home instead, which is
 * the useful destination from a page that exists to say you're lost.
 */
function pageInEveryLocale(pathname: string): string {
  const path = sourcePath(pathname)
  return path === '/404' ? '/' : path
}
