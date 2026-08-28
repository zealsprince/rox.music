/**
 * The addresses and identifiers, which are the same in every language.
 *
 * The words that used to live here (the search title and the meta description)
 * are `site-tagline` and `site-description` in the catalogs, because both are
 * copy and both need to be readable to a German visitor arriving from a German
 * search. What's left is the set of strings that would be wrong to translate.
 */
export const SITE = {
  name: 'rox',
  origin: 'https://rox.music',
  repo: 'https://github.com/zealsprince/rox',
  issues: 'https://github.com/zealsprince/rox/issues/new/choose',
  releases: 'https://github.com/zealsprince/rox/releases',
  docs: 'https://github.com/zealsprince/rox/tree/main/docs',
  // The project rather than either component. Both catalogs live under it, and
  // someone arriving from the language picker wants the app translated as much
  // as the pages: a new language that only covers the site is half a language.
  translate: 'https://hosted.weblate.org/projects/rox/',
  // #rox on irc.hivecom.net. Two routes, because the people who want IRC and
  // the people who have never opened a client want opposite things: the first
  // hands the channel to whatever client is already registered for the scheme,
  // the second opens in the tab they are already in.
  //
  // TLS on 6697, which is what ircs:// already implies, but written out because
  // client handling of the bare scheme is not consistent.
  chatDirect: 'ircs://irc.hivecom.net:6697/rox',
  chat: 'https://hivecom.net/chat?channel=rox',
} as const

/**
 * Evaluated once at prerender. deploy.yml already rebuilds on a daily cron, so
 * a heading that reads "in 2026" re-dates itself on January 1 and nobody has to
 * remember it.
 *
 * This is why the year belongs in headings and never in a URL: a title can be
 * rebuilt, a path can't be re-dated without breaking every link pointing at it.
 */
export const YEAR = new Date().getFullYear()
