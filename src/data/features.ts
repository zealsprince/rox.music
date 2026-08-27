/**
 * Which mark the cell wears, by what it means rather than by what the icon is
 * called. FeatureIcon.svelte maps these onto lucide components, the same split
 * PlatformIcon uses, so the data modules stay readable by the node scripts.
 */
export type FeatureIconId
  = | 'library'
    | 'tagging'
    | 'cue'
    | 'gapless'
    | 'equalizer'
    | 'similarity'
    | 'panels'
    | 'themes'
    | 'shaders'
    | 'lyrics'
    | 'playlists'
    | 'binary'

export interface Feature {
  /** Message key. Value is the cell title, `.body` the paragraph under it. */
  key: string
  icon: FeatureIconId
  /**
   * The page that says more about this one. `path` is site-relative and gets
   * its locale at render; `key` is the link text. Not every feature has one,
   * and inventing a page so the grid looks even would be the wrong fix.
   */
  link?: { path: string, key: string }
}

export interface FeatureGroup {
  /** Message key. Rides the grid as a full-width rule, like one of rox's menus. */
  key: string
  features: Feature[]
}

// Condensed from rox's README feature table, and grouped the way that table is,
// because twelve equal cells in a row is a wall rather than an argument. The
// README is the exhaustive list for people already sold; this is the version
// that has to land in one scroll.
//
// Three per group, and it has to stay three: the grid is three columns wide, and
// the rule that fills the hole at two columns keys off the group being that
// length. Titles stay short enough to hold one line next to their icon in a third
// of the content width, bodies land between roughly 120 and 160 characters, and
// that's what keeps the cells from going ragged. A translation that runs long
// costs the same thing, so German is the one to check the grid against.
export const FEATURE_GROUPS: FeatureGroup[] = [
  {
    key: 'features-library',
    features: [
      {
        key: 'feature-library',
        icon: 'library',
        link: { path: '/best-music-player', key: 'feature-library.link' },
      },
      {
        key: 'feature-tagging',
        icon: 'tagging',
        link: { path: '/mp3tag-alternative', key: 'feature-tagging.link' },
      },
      {
        key: 'feature-cue',
        icon: 'cue',
        link: { path: '/cue-sheets', key: 'feature-cue.link' },
      },
    ],
  },
  {
    key: 'features-playback',
    features: [
      { key: 'feature-gapless', icon: 'gapless' },
      {
        key: 'feature-equalizer',
        icon: 'equalizer',
        link: { path: '/replaygain', key: 'feature-equalizer.link' },
      },
      { key: 'feature-similarity', icon: 'similarity' },
    ],
  },
  {
    key: 'features-looks',
    features: [
      {
        key: 'feature-panels',
        icon: 'panels',
        link: { path: '/foobar2000-alternative', key: 'feature-panels.link' },
      },
      {
        key: 'feature-themes',
        icon: 'themes',
        link: { path: '/workspaces', key: 'feature-themes.link' },
      },
      {
        key: 'feature-shaders',
        icon: 'shaders',
        link: { path: '/music-visualizer', key: 'feature-shaders.link' },
      },
    ],
  },
  {
    key: 'features-daily',
    features: [
      { key: 'feature-lyrics', icon: 'lyrics' },
      { key: 'feature-playlists', icon: 'playlists' },
      {
        key: 'feature-binary',
        icon: 'binary',
        link: { path: '/download', key: 'feature-binary.link' },
      },
    ],
  },
]
