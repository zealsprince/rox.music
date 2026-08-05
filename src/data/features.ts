export interface Feature {
  title: string
  body: string
  /**
   * The page that says more about this one. Site-relative, prefixed with `base`
   * at render. Not every feature has one, and inventing a page so the grid looks
   * even would be the wrong fix.
   */
  link?: { path: string, name: string }
}

// Condensed from rox's README feature table. The README is the exhaustive list
// for people already sold; this is the version that has to land in one scroll.
//
// Nine entries, and it should stay nine or twelve: the grid is three columns
// wide and an odd count leaves a hole in the last row. Titles stay short enough
// to hold one line in a third of the content width, bodies land between roughly
// 120 and 160 characters, and that's what keeps the cells from going ragged.
export const FEATURES: Feature[] = [
  {
    title: 'Panels you compose',
    body: 'Forty panel types, from library and queue to artist grids, spectrum and VU. Duplicate one with its own config, or pop it out into a real OS window.',
    link: { path: '/foobar2000-alternative', name: 'Next to Foobar2000' },
  },
  {
    title: 'A library that holds up',
    body: 'A parallel scanner reads full tags, true durations and each file\'s own codec, not a header skim. Folder watching survives renames, and nothing drops silently.',
    link: { path: '/best-music-player', name: 'What breaks at 50,000 tracks' },
  },
  {
    title: 'Tagging you can trust',
    body: 'A full editor with atomic writes and batch edits. Ratings live in the files themselves via FMPS and POPM. Lookup through MusicBrainz, iTunes and Deezer.',
    link: { path: '/mp3tag-alternative', name: 'Next to Mp3tag' },
  },
  {
    title: 'Themes as shareable files',
    body: 'A workspace is one file carrying layout, palette and appearance. Palettes can tint from the playing cover, going light or dark with the art.',
    link: { path: '/workspaces', name: 'The six in the box' },
  },
  {
    title: 'Gapless playback',
    body: 'One stream, with shuffle, repeat and play-next. It recovers when an audio device disappears, and media keys and now-playing work on all three platforms.',
  },
  {
    title: 'Ten bands and bit-perfect',
    body: 'An equalizer in a window of its own, crossfade that leaves an album\'s own splices alone, and exclusive output that says what the hardware agreed to.',
    link: { path: '/replaygain', name: 'ReplayGain and bit-perfect' },
  },
  {
    title: 'Sorted by how it sounds',
    body: 'rox describes your tracks off their own audio and orders what\'s next by resemblance. It runs on your machine against your files, with no service in the loop.',
  },
  {
    title: 'Lyrics and history',
    body: 'Synced or plain, from sidecar files, tags or lrclib, with an editor that writes back where it read. A listen log drives the history panel, stats and scrobbling.',
  },
  {
    title: 'Playlists that survive',
    body: 'Favourites, drag reorder across lists, m3u in and out. Entries keep their place when a file leaves the library and comes back later.',
  },
]
