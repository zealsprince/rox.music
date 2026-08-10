/**
 * The pages that live off the main nav.
 *
 * One list feeding three consumers: the hub at /more, the footer link that
 * makes the hub reachable, and the sitemap. A page added here shows up in all
 * three, which is the only way an unlinked page ever gets crawled. Orphan pages
 * that exist in sitemap.xml and nowhere else do not get indexed, so "hidden"
 * here means out of the header, never out of the link graph.
 */
export interface SidePage {
  path: string
  /** Link text on the hub and in the trail. */
  name: string
  /** One line on the hub, saying who the page is for. */
  blurb: string
  /**
   * Screenshot id this page shows, for the sitemap's image entries. Declared
   * here rather than matched on path in the sitemap, which was one `if` away
   * from silently missing every page added after it.
   */
  image?: string
}

export const SIDE_PAGES: SidePage[] = [
  {
    path: '/foobar2000-alternative',
    name: 'The Foobar2000 alternative',
    blurb: 'What Foobar2000 got right, where it leaves you, and what rox does about it. Includes where Foobar2000 is still ahead.',
    image: 'catrox',
  },
  {
    path: '/catrox',
    name: 'CaTRoX, rebuilt native',
    blurb: 'The foobar2000 theme that started this, who made it, and what it took to get the look running without Windows underneath.',
    image: 'catrox',
  },
  {
    path: '/nekorox',
    name: 'NekoRoX, and where it went',
    blurb: 'The CaTRoX fork I maintained for a decade, why it stopped, and which of its panels exist in rox today. Includes AlphaRoX, the light one.',
    image: 'nekorox',
  },
  {
    path: '/music-visualizer',
    name: 'The visualizer, and the layer under it',
    blurb: 'Spectrum and waveform panels, WGSL shaders over any panel or the whole window, and the named signals off the audio that drive them.',
    image: 'critters',
  },
  {
    path: '/cue-sheets',
    name: 'FLAC and CUE rips',
    blurb: 'A whole-disc image and its sheet, indexed as real tracks that seek, sort, scrobble and run gaplessly into each other.',
  },
  {
    path: '/mp3tag-alternative',
    name: 'An Mp3tag alternative for Linux',
    blurb: 'Batch edits, a per-file grid, and a write path that copies, verifies and renames rather than editing your files in place.',
  },
  {
    path: '/musicbee-alternative',
    name: 'A MusicBee alternative',
    blurb: 'What MusicBee does that rox does not, what rox does that MusicBee cannot, and why the honest answer depends on your OS.',
  },
  {
    path: '/replaygain',
    name: 'ReplayGain, and what it costs',
    blurb: 'What ReplayGain actually does, track versus album gain, measuring the files nobody tagged, and why turning it on means giving up bit-perfect.',
  },
  {
    path: '/best-music-player',
    name: 'The best music player for a local library',
    blurb: 'What actually separates players once your library is real, and how the field measures up on a 50,000-track collection.',
  },
  {
    path: '/linux',
    name: 'rox on Linux',
    blurb: 'AUR and Nix, Wayland and X11, ALSA exclusive output, MPRIS media keys, and the benchmark table that is all Linux players.',
  },
  {
    path: '/windows',
    name: 'rox on Windows',
    blurb: 'A zip with no installer, portable mode, WASAPI exclusive output, and an honest read on competing with Foobar2000 on its home turf.',
  },
  {
    path: '/macos',
    name: 'rox on macOS',
    blurb: 'Apple Silicon, signed and notarized, menus in the system bar, CoreAudio exclusive output.',
  },
]

/** The hub itself. Kept separate: it's the thing the footer points at. */
export const HUB = {
  path: '/more',
  name: 'More',
} as const
