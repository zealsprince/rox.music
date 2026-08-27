/**
 * The shipped locales.
 *
 * Deliberately the same set rox itself ships, and the same source locale, so a
 * string that exists in both places can carry the same key and the same words.
 * The app's registry is `LOCALES` in crates/rox-i18n/src/lib.rs; when a locale
 * lands there it should land here.
 *
 * No imports on purpose. scripts/check-locales.ts reads this under tsx with no
 * Vite around it, so anything pulling in `?raw` or `$app/*` has to live in
 * index.ts instead.
 */

export interface LocaleInfo {
  /** Catalog id, and the folder under src/locales. Matches rox's registry. */
  id: string
  /**
   * URL segment. Empty for the source locale, which lives at the site root:
   * /download and /de/download are the same page, and the English one keeps the
   * URLs that are already indexed and linked to.
   */
  prefix: string
  flag: string
  /**
   * The language's name in its own language. A German speaker hunting for
   * theirs scans for "Deutsch", not for whatever the current page calls it.
   */
  native: string
  /**
   * `<html lang>` and `hreflang`. Region-less for English on purpose: the copy
   * is Canadian-spelled, but `hreflang="en-CA"` would tell Google to show it to
   * Canadians and nobody else, which is the opposite of what it's for.
   */
  htmlLang: string
  /** og:locale, which wants the underscored form. */
  og: string
}

/** The locale every key exists in and the end of every fallback chain. */
export const SOURCE_LOCALE = 'en-CA'

/** Registry order is picker order. */
export const LOCALES: LocaleInfo[] = [
  { id: 'en-CA', prefix: '', flag: '🇨🇦', native: 'English', htmlLang: 'en', og: 'en_CA' },
  { id: 'de', prefix: 'de', flag: '🇩🇪', native: 'Deutsch', htmlLang: 'de', og: 'de_DE' },
  { id: 'fr', prefix: 'fr', flag: '🇫🇷', native: 'Français', htmlLang: 'fr', og: 'fr_FR' },
  { id: 'it', prefix: 'it', flag: '🇮🇹', native: 'Italiano', htmlLang: 'it', og: 'it_IT' },
  // Region-less for the same reason English is: es-ES would tell Google to show
  // this to Spain and skip the Latin American half of the audience. og:locale
  // wants a territory regardless, so it carries one.
  { id: 'es', prefix: 'es', flag: '🇪🇸', native: 'Español', htmlLang: 'es', og: 'es_ES' },
  // Region-ful on purpose, the opposite call: pt-PT differs enough in vocabulary
  // that pointing European Portuguese speakers here would be the wrong result.
  { id: 'pt-BR', prefix: 'pt-br', flag: '🇧🇷', native: 'Português', htmlLang: 'pt-BR', og: 'pt_BR' },
  { id: 'ru', prefix: 'ru', flag: '🇷🇺', native: 'Русский', htmlLang: 'ru', og: 'ru_RU' },
  { id: 'uk', prefix: 'uk', flag: '🇺🇦', native: 'Українська', htmlLang: 'uk', og: 'uk_UA' },
  { id: 'ja', prefix: 'ja', flag: '🇯🇵', native: '日本語', htmlLang: 'ja', og: 'ja_JP' },
  // Script subtag rather than a region: Simplified vs Traditional is the split
  // that matters, and zh-CN would scope this to the mainland. The prefix carries
  // the script too, so zh-Hant can land later without moving an indexed URL.
  { id: 'zh-Hans', prefix: 'zh-hans', flag: '🇨🇳', native: '简体中文', htmlLang: 'zh-Hans', og: 'zh_CN' },
]

export const LOCALE_IDS: string[] = LOCALES.map(locale => locale.id)

/** The URL segments that mean "this is a translated page", source locale aside. */
export const LOCALE_PREFIXES: string[] = LOCALES
  .map(locale => locale.prefix)
  .filter(prefix => prefix !== '')

export function localeInfo(id: string): LocaleInfo {
  const found = LOCALES.find(locale => locale.id === id)
  if (!found)
    throw new Error(`no locale "${id}" in the registry`)
  return found
}

/**
 * The locale a pathname is asking for. Every route lives under an optional
 * `[[lang]]`, so this is the one place that decides what a leading segment
 * means, and hooks.server.ts can answer before SvelteKit has matched a route.
 */
export function localeFromPath(pathname: string): string {
  const first = pathname.split('/').filter(Boolean)[0]
  const match = LOCALES.find(locale => locale.prefix !== '' && locale.prefix === first)
  return match ? match.id : SOURCE_LOCALE
}

/**
 * A site path in a given locale. Paths are written once, in their source form
 * (`/download`), and prefixed here; nothing in the catalogs or the templates
 * carries a locale in a URL.
 *
 * The root is the one case worth spelling out: `/de/` and `/de` are different
 * URLs to a crawler, and `trailingSlash: 'never'` means the second one is ours.
 */
export function localePath(locale: string, path: string, base = ''): string {
  const { prefix } = localeInfo(locale)
  if (!prefix)
    return `${base}${path}`
  if (path === '/')
    return `${base}/${prefix}`
  return `${base}/${prefix}${path}`
}
