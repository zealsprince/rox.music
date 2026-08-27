export interface Workspace {
  id: string
  /**
   * The name rox itself gives the workspace. Not a key: these are what the
   * welcome window says, and a German reader told to click "Standard" would be
   * looking for a button that says "Default".
   */
  name: string
  /**
   * Message key. Value is the one-line blurb, `.alt` is the alt text.
   *
   * The alt is written per workspace rather than templated off the name,
   * because six images sharing one sentence describe nothing to a screen reader
   * and rank for nothing in image search. These are the shots the sitemap
   * points Google at, so the alt is the only text it gets about them.
   */
  key: string
}

// The workspaces rox ships in the box, one click away on the welcome window.
// Screenshots come from crates/rox/assets/workspaces in the rox repo and are
// re-encoded by scripts/optimize-images.ts.
//
// Anything that needs the count says WORKSPACE_COUNT rather than a number in a
// sentence. Critters arriving as the seventh turned up "six" in five places
// across three files, which is five chances to leave one wrong, and four
// languages would have made it twenty.
export const WORKSPACES: Workspace[] = [
  { id: 'default', name: 'Default', key: 'workspace-default' },
  { id: 'foobar', name: 'Foobar', key: 'workspace-foobar' },
  { id: 'catrox', name: 'CaTRoX', key: 'workspace-catrox' },
  { id: 'llama', name: 'Llama', key: 'workspace-llama' },
  { id: 'metro', name: 'Metro', key: 'workspace-metro' },
  { id: 'phosphor', name: 'Phosphor', key: 'workspace-phosphor' },
  { id: 'critters', name: 'Critters', key: 'workspace-critters' },
  { id: 'diffuse', name: 'Diffuse', key: 'workspace-diffuse' },
]

/**
 * The count, as a number, handed to any message that mentions it as `$count`.
 *
 * It used to be spelled out here, because a numeral under ten reads as a spec
 * sheet in prose. Spelling it out is a per-language job, so the catalogs do it:
 * `workspace-count` selects the word, and every sentence that needs it says
 * `{ workspace-count }` and inherits the argument.
 */
export const WORKSPACE_COUNT: number = WORKSPACES.length
