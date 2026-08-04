import type { PageServerLoad } from './$types'
import { loadRelease } from '$lib/server/release'

export const load: PageServerLoad = async () => {
  return { release: await loadRelease() }
}
