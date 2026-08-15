import { WORKSPACE_COUNT } from './workspaces'

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
  title: string
  body: string
  icon: FeatureIconId
  /**
   * The page that says more about this one. Site-relative, prefixed with `base`
   * at render. Not every feature has one, and inventing a page so the grid looks
   * even would be the wrong fix.
   */
  link?: { path: string, name: string }
}

export interface FeatureGroup {
  /** Rides the grid as a full-width rule, so it reads as one of rox's own menus. */
  name: string
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
// that's what keeps the cells from going ragged.
export const FEATURE_GROUPS: FeatureGroup[] = [
  {
    name: 'Library',
    features: [
      {
        title: 'A library that holds up',
        icon: 'library',
        body: 'A parallel scanner reads full tags, true durations and each file\'s own codec, not a header skim. Folder watching survives renames, and nothing drops silently.',
        link: { path: '/best-music-player', name: 'What breaks at 50,000 tracks' },
      },
      {
        title: 'Tagging you can trust',
        icon: 'tagging',
        body: 'A full editor with atomic writes and batch edits. Ratings live in the files themselves via FMPS and POPM. Lookup through MusicBrainz, iTunes and Deezer.',
        link: { path: '/mp3tag-alternative', name: 'Next to Mp3tag' },
      },
      {
        title: 'Cue rips play like tracks',
        icon: 'cue',
        body: 'A whole-disc FLAC beside its cue sheet indexes as real rows. Each span seeks, scrobbles, sorts and runs into the next one gaplessly, the way a file does.',
        link: { path: '/cue-sheets', name: 'How the spans work' },
      },
    ],
  },
  {
    name: 'Playback',
    features: [
      {
        title: 'Gapless playback',
        icon: 'gapless',
        body: 'One stream, with shuffle, repeat and play-next. It recovers when an audio device disappears, and media keys and now-playing work on all three platforms.',
      },
      {
        title: 'Ten bands and bit-perfect',
        icon: 'equalizer',
        body: 'An equalizer in a window of its own, crossfade that leaves an album\'s own splices alone, and exclusive output that says what the hardware agreed to.',
        link: { path: '/replaygain', name: 'ReplayGain and bit-perfect' },
      },
      {
        title: 'Sorted by how it sounds',
        icon: 'similarity',
        body: 'rox describes your tracks off their own audio, tempo included, and orders what\'s next by resemblance. It runs on your machine against your files, no service in the loop.',
      },
    ],
  },
  {
    name: 'Looks',
    features: [
      {
        title: 'Panels you compose',
        icon: 'panels',
        body: 'Forty-odd panel types, from library and queue to artist grids, spectrum and VU. Duplicate one with its config, save it as a preset, or pop it out into a window.',
        link: { path: '/foobar2000-alternative', name: 'Next to Foobar2000' },
      },
      {
        title: 'Themes as shareable files',
        icon: 'themes',
        body: 'A workspace is one file carrying layout, palette, appearance and shaders. Palettes can tint from the playing cover, going light or dark with the art.',
        link: { path: '/workspaces', name: `The ${WORKSPACE_COUNT} in the box` },
      },
      {
        title: 'Visuals that listen',
        icon: 'shaders',
        body: 'Write a WGSL shader over one panel or the whole window. Named signals off the spectrum ride its inputs, so a kick band drives whichever knob you point it at.',
        link: { path: '/music-visualizer', name: 'Shaders and signals' },
      },
    ],
  },
  {
    name: 'Day to day',
    features: [
      {
        title: 'Lyrics and history',
        icon: 'lyrics',
        body: 'Synced or plain, from sidecar files, tags or lrclib, with an editor that writes back where it read. A listen log drives the history panel, stats and scrobbling.',
      },
      {
        title: 'Playlists that survive',
        icon: 'playlists',
        body: 'Favourites, drag reorder, m3u in and out, and smart playlists that re-run a saved query rather than hold a snapshot. Entries survive a file leaving and returning.',
      },
      {
        title: 'One binary, no installer',
        icon: 'binary',
        body: 'A tarball, a DMG or a zip, plus the AUR and a Nix flake. Portable mode keeps the library and settings in a folder beside the executable.',
        link: { path: '/download', name: 'Get it' },
      },
    ],
  },
]
