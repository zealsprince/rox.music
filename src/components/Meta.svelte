<script lang="ts">
  import { page } from '$app/state'
  import { SITE } from '$data/site'

  interface Props {
    title: string
    description: string
    /** Path to an OG image under static/, or the default social card. */
    image?: string
  }

  const { title, description, image = '/social/default.png' }: Props = $props()

  // Prerendered, so page.url is the build-time URL and not the deployed origin.
  // The canonical origin comes from SITE instead.
  const canonical = $derived(new URL(page.url.pathname, SITE.origin).href)
  const imageUrl = $derived(new URL(image, SITE.origin).href)
  const full = $derived(title === SITE.name ? SITE.tagline : `${title} - ${SITE.name}`)
</script>

<svelte:head>
  <title>{full}</title>
  <meta name="description" content={description} />
  <link rel="canonical" href={canonical} />

  <meta property="og:type" content="website" />
  <meta property="og:site_name" content={SITE.name} />
  <meta property="og:title" content={full} />
  <meta property="og:description" content={description} />
  <meta property="og:url" content={canonical} />
  <meta property="og:image" content={imageUrl} />

  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content={full} />
  <meta name="twitter:description" content={description} />
  <meta name="twitter:image" content={imageUrl} />
</svelte:head>
