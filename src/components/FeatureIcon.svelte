<script lang="ts">
  import type { FeatureIconId } from '$data/features'
  import {
    AudioLines,
    Blend,
    Cable,
    Disc3,
    Heart,
    LayoutDashboard,
    Link,
    ListMusic,
    Mic,
    Package,
    Palette,
    Play,
    Radio,
    RadioTower,
    Tag,
  } from '@lucide/svelte'

  interface Props {
    icon: FeatureIconId
    size?: number
  }

  const { icon, size = 18 }: Props = $props()

  // The marks rox wears for these things, borrowed role for role: Blend is the
  // Shader panel's icon in the app's own Add Panel menu, Palette is the
  // Appearance settings page, AudioLines is the equalizer, Mic is the lyrics
  // panel, Link is the MCP settings page. Someone who has used rox should
  // recognise the row.
  //
  // `satisfies` rather than a type annotation, so a new id in features.ts fails
  // the typecheck here instead of rendering nothing.
  const ICONS = {
    library: ListMusic,
    tagging: Tag,
    cue: Disc3,
    gapless: Play,
    equalizer: AudioLines,
    similarity: Radio,
    panels: LayoutDashboard,
    themes: Palette,
    shaders: Blend,
    lyrics: Mic,
    playlists: Heart,
    binary: Package,
    ipc: Cable,
    mcp: Link,
    broadcast: RadioTower,
  } satisfies Record<FeatureIconId, unknown>

  const Icon = $derived(ICONS[icon])
</script>

<!-- Decorative. Every one of these sits beside a heading that says the same
     thing in words, so announcing it twice helps nobody. -->
<span class="wrap" aria-hidden="true">
  <Icon {size} strokeWidth={2} absoluteStrokeWidth title="" />
</span>

<style>
  .wrap {
    display: inline-flex;
    /* Optical, not metric: flex-start puts the icon's box at the top of the
       line box, which is above the cap height of the words next to it. */
    margin-top: 0.2em;
    color: var(--text-secondary);
  }
</style>
