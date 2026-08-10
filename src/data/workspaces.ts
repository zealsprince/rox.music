export interface Workspace {
  id: string
  name: string
  /** What it's evoking, one line. */
  blurb: string
  /**
   * What's actually on screen in this workspace's shot. Written per workspace
   * rather than templated off the name, because six images sharing one sentence
   * describe nothing to a screen reader and rank for nothing in image search.
   * These are the shots the sitemap points Google at, so the alt is the only
   * text it gets about them.
   */
  alt: string
}

// The workspaces rox ships in the box, one click away on the welcome window.
// Screenshots come from crates/rox/assets/workspaces in the rox repo and are
// re-encoded by scripts/optimize-images.ts.
//
// Anything that needs the count says WORKSPACES.length rather than a number in
// a sentence. Critters arriving as the seventh turned up "six" in five places
// across three files, which is five chances to leave one wrong.
export const WORKSPACES: Workspace[] = [
  {
    id: 'default',
    name: 'Default',
    blurb: 'What rox looks like out of the box: translucent surfaces, art tinting off.',
    alt: 'The Default rox workspace: a cover art grid beside a playlist with star ratings, an amber waveform seek bar along the bottom and tabs for biography, lyrics and metadata.',
  },
  {
    id: 'foobar',
    name: 'Foobar',
    blurb: 'The layout this whole project is an argument with. Opaque, dense, OS decorations on, menubar where it always was.',
    alt: 'The Foobar rox workspace: a classic foobar2000 layout with a menubar, artist and album filter columns, a dense track table with play counts and ratings, and cover art bottom left.',
  },
  {
    id: 'catrox',
    name: 'CaTRoX',
    blurb: 'The CaTRoX foobar2000 skin you know and love that started it all.',
    alt: 'The CaTRoX rox workspace: the foobar2000 skin recreated, with a circular CD render of the cover, a metadata field list down the left and album-grouped tracks with rating dots.',
  },
  {
    id: 'llama',
    name: 'Llama',
    blurb: 'WinAmp, in the way you remember it rather than the way it was. Tahoma, dark, no chrome.',
    alt: 'The Llama rox workspace: a Winamp-style dotted spectrum analyzer across the top, green transport controls and a dense track list below, with no window chrome.',
  },
  {
    id: 'metro',
    name: 'Metro',
    blurb: 'Flat panels and comfortable rows with art theming on, so the palette follows whatever cover is playing.',
    alt: 'The Metro rox workspace: a full-width grid of album covers with titles beneath, and an artist biography panel on the right carrying a photo, genre tags and listener counts.',
  },
  {
    id: 'phosphor',
    name: 'Phosphor',
    blurb: 'Monospace everything. Consolas, no cover in quick play, a terminal that happens to play music.',
    alt: 'The Phosphor rox workspace: green-on-black monospace throughout, a folder tree beside a track table and a green waveform across the bottom, like a terminal that plays music.',
  },
  {
    id: 'critters',
    name: 'Critters',
    blurb: 'The whole app as a 1-bit print. An ordered dither over every surface, tones crushing with the sub-bass, and a noise wall behind the panels that moves with the song.',
    alt: 'The Critters rox workspace: the entire window rendered in black-and-white ordered dither, with a curved shelf of album covers over a seek bar, transport row, waveform strip and track table, all sitting on a shifting field of noise.',
  },
]

const WORDS = ['no', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

/**
 * The count, spelled out, for the sentences that mention it. A numeral under
 * ten reads as a spec sheet in prose, and every consumer of this needs it
 * inside a sentence.
 */
export const WORKSPACE_COUNT: string = WORDS[WORKSPACES.length] ?? String(WORKSPACES.length)
