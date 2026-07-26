export const SITE = {
  name: 'rox',
  // The search-facing title, not the voice line. "If Foobar2000 was made in the
  // current year" is the better sentence and it stays as the h1 and on the
  // social card, where a human reads it. Nobody types it into Google.
  //
  // This targets "foobar2000 alternative", which is a real query rox can win.
  // "linux music player" is not winnable against twenty years of listicles, and
  // chasing it would cost the one term that actually converts. 59 characters, so
  // it survives Google's display width intact.
  tagline: 'rox - a Foobar2000 alternative for Linux, macOS and Windows',
  origin: 'https://rox.music',
  repo: 'https://github.com/zealsprince/rox',
  issues: 'https://github.com/zealsprince/rox/issues/new/choose',
  releases: 'https://github.com/zealsprince/rox/releases',
  docs: 'https://github.com/zealsprince/rox/tree/main/docs',
  // Kept under 160 characters so Google shows the whole thing instead of cutting
  // it mid-clause. The old one ran to 230 and lost its last two sentences. This
  // one carries "music player", which the title had to give up for "Foobar2000".
  // The platforms are already in the title, so they come out of here to buy the
  // room for what the title cannot say.
  description:
    'A native music player for large, carefully tagged local libraries. '
    + 'Compose your own panels, share themes as files, and stay fast at '
    + '50,000 tracks.',
} as const
