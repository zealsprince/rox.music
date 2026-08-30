import type { PageServerLoad } from './$types'
import { loadDownloads } from '$lib/server/downloads'
import { loadRelease } from '$lib/server/release'

export const load: PageServerLoad = async () => {
  return {
    release: await loadRelease(),
    downloads: await loadDownloads(),
  }
}
