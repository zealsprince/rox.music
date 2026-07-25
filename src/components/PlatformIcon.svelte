<script lang="ts">
  import type { PlatformId } from '$types/release'
  import SiApple from './icons/SiApple.svelte'
  import SiLinux from './icons/SiLinux.svelte'
  import SiWindows from './icons/SiWindows.svelte'

  interface Props {
    platform: PlatformId
    size?: number
  }

  const { platform, size = 20 }: Props = $props()

  // Kept here rather than in $data/platforms.ts so the data modules stay free of
  // Svelte imports and can be read by the node scripts.
  const ICONS = {
    linux: SiLinux,
    macos: SiApple,
    windows: SiWindows,
  }

  const Icon = $derived(ICONS[platform])
</script>

<!-- Decorative: every platform icon on this site sits next to its own name. -->
<span class="wrap" aria-hidden="true">
  <Icon {size} title="" />
</span>

<style>
  .wrap {
    display: inline-flex;
    color: var(--text-secondary);
  }
</style>
