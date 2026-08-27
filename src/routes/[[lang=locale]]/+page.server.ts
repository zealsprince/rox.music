import type { PageServerLoad } from './$types'
import { loadRelease } from '$lib/server/release'

// Runs once at prerender. The visitor gets the version baked into the HTML and
// never talks to the GitHub API.
export const load: PageServerLoad = async () => {
  return { release: await loadRelease() }
}
