import type { LayoutServerLoad } from './$types'
import { loadRepo } from '$lib/server/repo'

// Runs once per page at prerender. The header badge is part of the layout, so
// the number has to come from here rather than from any single page's load.
export const load: LayoutServerLoad = async () => {
  return { repo: await loadRepo() }
}
