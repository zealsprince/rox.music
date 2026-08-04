export interface Feature {
  title: string
  body: string
}

// Condensed from rox's README feature table. The README is the exhaustive list
// for people already sold; this is the version that has to land in one scroll.
export const FEATURES: Feature[] = [
  {
    title: 'Panels you compose',
    body: 'Forty panel types, from library and queue to artist and genre grids, spectrum, waveform and VU. Arrange them how you want, duplicate one with its own config, pop it out into a real OS window.',
  },
  {
    title: 'A library that holds up',
    body: 'A parallel scanner reads full tags, true durations, and each file\'s own codec, sample rate and bit depth, not a header skim. Folder watching survives renames, and files with unreadable tags get indexed by filename so nothing drops silently.',
  },
  {
    title: 'Tagging you can trust',
    body: 'A full editor with atomic writes and batch edits. Ratings live in the files themselves via FMPS and POPM. Tag and cover lookup through MusicBrainz, iTunes and Deezer.',
  },
  {
    title: 'Themes as shareable files',
    body: 'A workspace is one file carrying layout, palette and appearance. Palettes can tint from the playing album cover per window, going light or dark with the art.',
  },
  {
    title: 'Gapless playback',
    body: 'A single-stream engine with shuffle, repeat and play-next. It recovers when an audio device disappears, and media keys and now-playing work on all three platforms.',
  },
  {
    title: 'An audio chain worth opening',
    body: 'A ten-band equalizer in a window of its own, crossfade that leaves an album\'s own splices alone, ReplayGain off the tags with a loudness pass for the files nobody ever measured, and an exclusive output mode that tells you what the hardware agreed to.',
  },
  {
    title: 'Lyrics and history',
    body: 'Synced and plain lyrics from sidecar files, tags or lrclib, with an editor that writes back where it read from. A full listen log drives the history panel, stats and Last.fm scrobbling.',
  },
]
