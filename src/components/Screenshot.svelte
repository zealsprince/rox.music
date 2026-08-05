<script lang="ts">
  import type { ScreenshotManifest } from '$data/images'
  import { base } from '$app/paths'
  import manifest from '$data/screenshots.generated.json'

  interface Props {
    /** Matches a key in the generated manifest. */
    id: string
    alt: string
    /** Sizes hint, so the browser picks a width before layout. */
    sizes?: string
    /** Only the hero should be eager. Everything else waits. */
    priority?: boolean
    /**
     * The source shot is light rather than dark. Only matters for shots with no
     * light variant, where it flips which page theme gets the mat.
     */
    lightSource?: boolean
  }

  const {
    id,
    alt,
    sizes = '100vw',
    priority = false,
    lightSource = false,
  }: Props = $props()

  const entry = $derived.by(() => {
    const found = (manifest as ScreenshotManifest)[id]
    if (!found)
      throw new Error(`no screenshot "${id}" in the manifest, run: npm run images`)
    return found
  })

  // Path and widths both come from the manifest, so a srcset only ever lists
  // files the encoder actually wrote, wherever it wrote them.
  const set = (prefix: string, ext: string): string =>
    entry.widths.map(w => `${base}${prefix}-${w}.${ext} ${w}w`).join(', ')

  const fallbackWidth = $derived(entry.widths[entry.widths.length - 1])
</script>

<!--
  Aspect ratio comes off the intrinsic size so the box is reserved before the
  image lands and nothing shifts.

  When a light variant exists its sources come first and carry a media query, so
  a light-mode visitor downloads the light file and only that one, at first
  paint, with no JS involved. The browser takes the first source whose media and
  type both match, hence light-avif, light-webp, dark-avif, dark-webp in order.

  A manual theme toggle cannot re-run a media query, so enhance.js rewrites the
  `media` attribute on the [data-light] sources instead.
-->
<picture>
  {#if entry.lightPath}
    <source
      data-light
      media="(prefers-color-scheme: light)"
      srcset={set(entry.lightPath, 'avif')}
      {sizes}
      type="image/avif"
    />
    <source
      data-light
      media="(prefers-color-scheme: light)"
      srcset={set(entry.lightPath, 'webp')}
      {sizes}
      type="image/webp"
    />
  {/if}
  <source srcset={set(entry.path, 'avif')} {sizes} type="image/avif" />
  <source srcset={set(entry.path, 'webp')} {sizes} type="image/webp" />
  <img
    src="{base}{entry.path}-{fallbackWidth}.webp"
    {sizes}
    {alt}
    width={entry.width}
    height={entry.height}
    class:matted={!entry.lightPath && !lightSource}
    class:matted-light={!entry.lightPath && lightSource}
    loading={priority ? 'eager' : 'lazy'}
    fetchpriority={priority ? 'high' : 'auto'}
    decoding={priority ? 'sync' : 'async'}
  />
</picture>

<style>
  picture,
  img {
    display: block;
    width: 100%;
    height: auto;
  }

  img {
    border: var(--hairline) solid var(--border);
    background: var(--bg-panel);
  }

  /*
    No light variant for this shot, so a light-mode visitor gets a dark
    screenshot on a light page. A dark mat around it makes that read as framing
    rather than as an oversight. Drop in a `-light` source and it goes away.
  */
  :global(html.light) .matted {
    padding: 0.6rem;
    background: #1c1c1c;
    border-color: #2a2a2a;
  }

  /* Same trick the other way up, for a shot that's light to begin with. */
  :global(html.dark) .matted-light {
    padding: 0.6rem;
    background: #e3e3e3;
    border-color: #d5d5d5;
  }
</style>
