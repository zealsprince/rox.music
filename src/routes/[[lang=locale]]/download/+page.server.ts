import type { PageServerLoad } from './$types'
import { loadDownloads } from '$lib/server/downloads'
import { loadReleases } from '$lib/server/release'

export const load: PageServerLoad = async () => {
  const { stable, candidate } = await loadReleases()
  return {
    release: stable,
    candidate,
    downloads: await loadDownloads(),
  }
}
