import type { Translator } from './index'
import { getContext, setContext } from 'svelte'
import { translator } from './index'

/**
 * The locale, and everything that depends on it, handed down through Svelte
 * context from the root layout.
 *
 * Context rather than props because every component needs it and only some of
 * them take props today: threading a locale through Header, Footer, Meta,
 * Screenshot and back out again would be six signatures widened to say one
 * thing. Context rather than a module-level global because a prerender renders
 * many locales in one process, and a global is how one page's language ends up
 * in another page's markup.
 *
 * Read it at component init, which is where `getContext` is legal:
 *
 * ```svelte
 * const { t, href } = i18n()
 * ```
 */
export interface I18n extends Translator {
  /** This page's path in source form, no locale prefix: `/download`. */
  path: string
}

const KEY = Symbol('rox.i18n')

export function setI18n(locale: string, path: string): I18n {
  const value: I18n = { ...translator(locale), path }
  setContext(KEY, value)
  return value
}

export function i18n(): I18n {
  const value = getContext<I18n | undefined>(KEY)
  if (!value)
    throw new Error('i18n() outside the root layout, or called after init')
  return value
}
