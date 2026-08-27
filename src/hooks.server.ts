import type { Handle } from '@sveltejs/kit'
import { localeFromPath, localeInfo } from '$lib/i18n/registry'

/**
 * Stamps `<html lang>` with the locale the URL asked for.
 *
 * It has to happen here rather than in the layout: `lang` is an attribute of
 * the document element, which lives in app.html and is outside every component.
 * Getting it wrong is not cosmetic - a screen reader picks its voice off this
 * attribute, and a German page announced as English is unlistenable.
 *
 * Prerender runs the server hooks, so the attribute is baked into the static
 * file and nothing has to run in the browser to correct it.
 */
export const handle: Handle = async ({ event, resolve }) => {
  const { htmlLang } = localeInfo(localeFromPath(event.url.pathname))
  return resolve(event, {
    transformPageChunk: ({ html }) => html.replace('%lang%', htmlLang),
  })
}
