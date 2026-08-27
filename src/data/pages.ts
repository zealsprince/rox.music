/**
 * The pages that live off the main nav.
 *
 * One list feeding three consumers: the hub at /more, the footer link that
 * makes the hub reachable, and the sitemap. A page added here shows up in all
 * three, which is the only way an unlinked page ever gets crawled. Orphan pages
 * that exist in sitemap.xml and nowhere else do not get indexed, so "hidden"
 * here means out of the header, never out of the link graph.
 *
 * Copy lives in the catalogs, not here: `key` names a message whose value is
 * the link text and whose `.blurb` attribute is the line under it. Writing the
 * key out rather than deriving it from the path keeps it greppable, which is
 * what lets check-locales.ts tell a retired key from a live one.
 */
export interface SidePage {
  path: string
  /** Message key. Value is the link text, `.blurb` the line on the hub. */
  key: string
  /**
   * Screenshot id this page shows, for the sitemap's image entries. Declared
   * here rather than matched on path in the sitemap, which was one `if` away
   * from silently missing every page added after it.
   */
  image?: string
}

export const SIDE_PAGES: SidePage[] = [
  { path: '/foobar2000-alternative', key: 'page-foobar2000-alternative', image: 'catrox' },
  { path: '/catrox', key: 'page-catrox', image: 'catrox' },
  { path: '/nekorox', key: 'page-nekorox', image: 'nekorox' },
  { path: '/music-visualizer', key: 'page-music-visualizer', image: 'critters' },
  { path: '/cue-sheets', key: 'page-cue-sheets' },
  { path: '/mp3tag-alternative', key: 'page-mp3tag-alternative' },
  { path: '/musicbee-alternative', key: 'page-musicbee-alternative' },
  { path: '/replaygain', key: 'page-replaygain' },
  { path: '/best-music-player', key: 'page-best-music-player' },
  { path: '/linux', key: 'page-linux' },
  { path: '/windows', key: 'page-windows' },
  { path: '/macos', key: 'page-macos' },
]

/** The hub itself. Kept separate: it's the thing the footer points at. */
export const HUB = {
  path: '/more',
  key: 'nav-more',
} as const
