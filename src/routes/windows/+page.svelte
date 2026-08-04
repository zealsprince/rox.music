<script lang="ts">
  import type { PageData } from './$types'
  import PlatformPage from '$components/PlatformPage.svelte'
  import { PLATFORM_PAGES } from '$data/platform-pages'

  const { data }: { data: PageData } = $props()
</script>

<PlatformPage page={PLATFORM_PAGES.windows} release={data.release} />
