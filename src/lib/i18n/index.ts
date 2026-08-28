/**
 * Site-wide localization: Fluent messages resolved against the locale in the
 * URL. Same stack as the app (rox ADR 27), for the same reason the tokens file
 * mirrors the palette: two surfaces saying the same words should say them from
 * the same kind of file, so a string moved between them keeps its key.
 *
 * The one thing that differs is where the locale comes from. rox holds a
 * process-global that a settings row swaps; here every page is prerendered at
 * a known URL, so the locale is a route parameter and `translate` takes it as
 * an argument. Nothing is global, and nothing can leak from one prerendered
 * page into the next.
 *
 * en-CA is the source locale: every key exists there, and every lookup falls
 * back to it, so a hole in a translation shows English rather than a bare key.
 */

import type { LocaleInfo } from './registry'
import { base } from '$app/paths'
import { SITE } from '$data/site'
import { FluentBundle, FluentResource } from '@fluent/bundle'
import { localeInfo, localePath, LOCALES, SOURCE_LOCALE } from './registry'

export type MessageArgs = Record<string, string | number>

export { LOCALE_IDS, LOCALE_PREFIXES, localeFromPath, localeInfo, LOCALES, SOURCE_LOCALE } from './registry'
export type { LocaleInfo }

/**
 * Catalogs are read through a glob rather than an import list, so adding a
 * locale stays what it is in rox: one registry row and one ftl file.
 */
const SOURCES = import.meta.glob('/src/locales/*/rox.ftl', {
  query: '?raw',
  import: 'default',
  eager: true,
}) as Record<string, string>

/** Parsed once per process, which for a prerender is once per build. */
const BUNDLES: Map<string, FluentBundle> = new Map()

function bundle(locale: string): FluentBundle {
  const existing = BUNDLES.get(locale)
  if (existing)
    return existing

  const source = SOURCES[`/src/locales/${locale}/rox.ftl`]
  if (source === undefined)
    throw new Error(`no catalog at src/locales/${locale}/rox.ftl`)

  // Fluent wraps every placeable in FSI/PDI bidi isolate marks by default.
  // None of the shipped locales are bidi and the marks survive into the HTML as
  // invisible characters that break a `grep` of the built pages, so they stay
  // off until an RTL locale forces the question. Same call rox makes.
  const created = new FluentBundle(localeInfo(locale).htmlLang, { useIsolating: false })
  const errors = created.addResource(new FluentResource(source))
  for (const error of errors)
    console.warn(`[i18n] ${locale}: ${error.message}`)

  BUNDLES.set(locale, created)
  return created
}

/** Warned about once. A key resolved in a loop would otherwise fill the log. */
const MISSING = new Set<string>()

function warnMissing(key: string): void {
  if (MISSING.has(key))
    return
  MISSING.add(key)
  console.warn(`[i18n] no locale carries ${key}`)
}

/**
 * Resolve a message. A `.` reaches into an attribute, mirroring ftl syntax and
 * the app's `t!`: `"nav-download.title"` is the title attribute of
 * `nav-download`.
 */
export function translate(locale: string, key: string, args?: MessageArgs): string {
  const [id, attr] = splitKey(key)

  for (const candidate of [locale, SOURCE_LOCALE]) {
    const message = bundle(candidate).getMessage(id)
    if (!message)
      continue
    const pattern = attr ? message.attributes[attr] : message.value
    if (!pattern)
      continue

    const errors: Error[] = []
    const text = bundle(candidate).formatPattern(pattern, args, errors)
    for (const error of errors)
      console.warn(`[i18n] formatting ${key} in ${candidate}: ${error.message}`)
    return decorate(text)
  }

  warnMissing(key)
  return `⟦${key}⟧`
}

function splitKey(key: string): [string, string | null] {
  const dot = key.indexOf('.')
  return dot === -1 ? [key, null] : [key.slice(0, dot), key.slice(dot + 1)]
}

/**
 * The pseudo-locale pass, on when ROX_PSEUDOLOCALE is set: every resolved
 * string gains brackets and a third of padding, so a literal that dodged
 * extraction is the one thing on the page without brackets, and a layout that
 * can't absorb German-length text shows it before German does.
 *
 * `npm run dev` with the variable set is the way to look at it; a build with it
 * set would ship the brackets, which is why nothing sets it in CI.
 */
function decorate(text: string): string {
  if (!import.meta.env.ROX_PSEUDOLOCALE)
    return text
  const pad = '~'.repeat(Math.ceil([...text].length / 3))
  return `⟦${text}${pad}⟧`
}

/**
 * A translator bound to one locale. Components take this from context rather
 * than passing the locale down, so a call site is `t('key')` and reads the way
 * the app's `t!` does.
 */
export interface Translator {
  locale: string
  info: LocaleInfo
  /** Message lookup. */
  t: (key: string, args?: MessageArgs) => string
  /**
   * Message lookup, inline markup rendered. Use the `<Rich>` component rather
   * than calling this and reaching for `{@html}` yourself.
   */
  rich: (key: string, args?: MessageArgs) => string
  /** A site path in this locale: `href('/download')`. */
  href: (path: string) => string
  /** The same page in another locale, for the picker and the hreflang tags. */
  alternate: (locale: string, path: string) => string
}

export function translator(locale: string): Translator {
  return {
    locale,
    info: localeInfo(locale),
    t: (key, args) => translate(locale, key, args),
    rich: (key, args) => renderRich(locale, translate(locale, key, args)),
    href: path => localePath(locale, path, base),
    alternate: (other, path) => localePath(other, path, base),
  }
}

/**
 * Named destinations for links inside messages: `[the source](@repo)`.
 *
 * A URL written into a catalog is a URL written four times, and the day it
 * moves, three of the copies are somebody else's language to go find. This
 * keeps every address the site links to more than once in one place, and it's
 * where a link that means something beyond "elsewhere" says so - `rel="me"` is
 * what makes the author link usable for identity verification, and it would
 * otherwise have to be split out of its sentence to survive.
 */
const ALIASES: Record<string, { href: string, rel?: string, plain?: boolean }> = {
  '@repo': { href: SITE.repo },
  '@issues': { href: SITE.issues },
  '@releases': { href: SITE.releases },
  '@docs': { href: SITE.docs },
  '@readme-dev': { href: `${SITE.repo}#development` },
  '@chat': { href: SITE.chat },
  '@chat-direct': { href: SITE.chatDirect },
  '@author': { href: 'https://zealsprince.com', rel: 'me' },
  '@license': { href: 'https://www.gnu.org/licenses/agpl-3.0.html', rel: 'license noreferrer' },
  '@gpui': { href: 'https://gpui.rs' },
  '@zed': { href: 'https://zed.dev' },
  '@aur': { href: 'https://aur.archlinux.org/packages/rox-player' },
  '@flake': { href: 'https://github.com/zealsprince/rox/blob/main/flake.nix' },
  '@lrclib': { href: 'https://lrclib.net' },
  '@musicbrainz': { href: 'https://musicbrainz.org' },
  '@lastfm': { href: 'https://www.last.fm' },
  '@foobar': { href: 'https://www.foobar2000.org' },
  '@musicbee': { href: 'https://getmusicbee.com' },
  '@mp3tag': { href: 'https://www.mp3tag.de/en/' },
  '@icecast': { href: 'https://icecast.org' },
  '@mcp-spec': { href: 'https://modelcontextprotocol.io' },
  // Plain, because it sits in the method note under a table whose own player
  // column already suppresses its arrows: one arrow down there would read as a
  // different kind of link rather than as the same one.
  '@deadbeef': { href: 'https://github.com/DeaDBeeF-Player/deadbeef', plain: true },
}

/**
 * The inline markup catalogs are allowed to carry, and nothing else.
 *
 * Prose on this site has links, code spans and the occasional bold run inside
 * its paragraphs, and Fluent has no markup. The alternative was splitting every
 * such sentence into three keys around its link, which puts word order in the
 * template and hands a translator fragments instead of sentences. So a message
 * can carry `[text](/path)`, `**bold**`, `_italic_` and `` `code` ``, and this
 * turns it into HTML.
 *
 * The message is escaped first, so the only tags that can reach the page are
 * the four written here. The input is a catalog we ship, never a visitor's, and
 * this runs at prerender.
 */
export function renderRich(locale: string, text: string): string {
  const escaped = escapeHtml(text)
  const link = /\[([^\]]+)\]\(([^)\s]+)\)/g

  // Walk the message rather than running the emphasis rules over the finished
  // HTML, because that HTML contains hrefs. `[CaTRoX_QWR](.../CaTRoX_QWR/)`
  // ends up with one underscore in the label and one in the URL, and a pass
  // over the whole string reads the span between them as italics and eats the
  // link. Only text between the links gets marked up; a label gets it on its
  // own, and an href never gets it at all.
  let out = ''
  let cursor = 0

  for (const match of escaped.matchAll(link)) {
    const [whole, label, target] = match
    out += inline(escaped.slice(cursor, match.index))

    const { href, rel, plain } = resolveTarget(locale, target)
    const attrs = `${plain ? ' class="plain"' : ''}${rel ? ` rel="${rel}"` : ''}`
    out += `<a href="${href}"${attrs}>${inline(label)}</a>`

    cursor = match.index + whole.length
  }

  return out + inline(escaped.slice(cursor))
}

interface ResolvedTarget {
  href: string
  rel: string
  /** Suppresses the outbound arrow app.scss puts after every external link. */
  plain: boolean
}

function resolveTarget(locale: string, target: string): ResolvedTarget {
  if (target.startsWith('@')) {
    const alias = ALIASES[target]
    if (!alias)
      throw new Error(`no link alias ${target}`)
    return { href: alias.href, rel: alias.rel ?? 'noreferrer', plain: alias.plain ?? false }
  }
  if (/^[a-z]+:/i.test(target))
    return { href: target, rel: 'noreferrer', plain: false }
  return { href: localePath(locale, target, base), rel: '', plain: false }
}

/**
 * Bold, italics and code spans in one run of plain text.
 *
 * Code comes out first and goes back in last. `R128_TRACK_GAIN` is a real tag
 * name that appears in a code span on the ReplayGain page, and the two
 * underscores in it are not emphasis.
 */
function inline(text: string): string {
  // A private-use codepoint as the placeholder: escapeHtml has already run, so
  // nothing in the message can be mistaken for one.
  const code: string[] = []
  const held = text.replace(/`([^`]+)`/g, (_, inner: string) => {
    code.push(inner)
    return `\uE000${code.length - 1}\uE000`
  })

  return held
    .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')
    .replace(/_([^_]+)_/g, '<em>$1</em>')
    .replace(/\uE000(\d+)\uE000/g, (_, index: string) => `<code>${code[Number(index)]}</code>`)
}

function escapeHtml(text: string): string {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
}

/**
 * Every locale's URL for one path, source locale first. Feeds the hreflang
 * block, the language picker and the sitemap, so the three can't disagree about
 * where a translation lives.
 */
export function alternates(path: string, origin: string): { locale: LocaleInfo, url: string }[] {
  return LOCALES.map(locale => ({
    locale,
    url: new URL(localePath(locale.id, path), origin).href,
  }))
}

/**
 * The source path behind a localized one: `/de/download` -> `/download`. The
 * inverse of `localePath`, for the places that have a URL and need to ask what
 * the same page looks like elsewhere.
 */
export function sourcePath(pathname: string): string {
  const stripped = pathname.replace(/\/$/, '') || '/'
  const segments = stripped.split('/').filter(Boolean)
  const first = segments[0]
  if (LOCALES.some(locale => locale.prefix !== '' && locale.prefix === first))
    segments.shift()
  return segments.length ? `/${segments.join('/')}` : '/'
}

export { localePath }
