export interface Workspace {
  id: string
  name: string
  /** What it's evoking, one line. */
  blurb: string
}

// The six workspaces rox ships in the box, one click away on the welcome
// window. Screenshots come from crates/rox/assets/workspaces in the rox repo and
// are re-encoded by scripts/optimize-images.ts.
export const WORKSPACES: Workspace[] = [
  {
    id: 'default',
    name: 'Default',
    blurb: 'What rox looks like out of the box: translucent surfaces, art tinting off.',
  },
  {
    id: 'foobar',
    name: 'Foobar',
    blurb: 'The layout this whole project is an argument with. Opaque, dense, OS decorations on, menubar where it always was.',
  },
  {
    id: 'catrox',
    name: 'CaTRoX',
    blurb: 'The CaTRoX foobar2000 skin you know and love that started it all.',
  },
  {
    id: 'llama',
    name: 'Llama',
    blurb: 'WinAmp, in the way you remember it rather than the way it was. Tahoma, dark, no chrome.',
  },
  {
    id: 'metro',
    name: 'Metro',
    blurb: 'Flat panels and comfortable rows with art theming on, so the palette follows whatever cover is playing.',
  },
  {
    id: 'phosphor',
    name: 'Phosphor',
    blurb: 'Monospace everything. Consolas, no cover in quick play, a terminal that happens to play music.',
  },
]
