<script lang="ts">
  import { page } from '$app/state'
  import { SITE } from '$data/site'

  interface Props {
    title: string
    description: string
    /**
     * The exact <title>, bypassing the "<title> - rox" suffix. For pages where
     * front-loading the words people search beats a tidy naming pattern:
     * "Download rox for Linux, macOS or Windows" earns its length in a result
     * list, "Download - rox" does not.
     */
    fullTitle?: string
    /** Path to an OG image under static/, or the default social card. */
    image?: string
    /** Alt text for the social card, read out by screen readers on X and Mastodon. */
    imageAlt?: string
  }

  const {
    title,
    description,
    fullTitle,
    image = '/social/default.png',
    imageAlt = 'The rox logo above the words: if Foobar2000 was made in the current year',
  }: Props = $props()

  // Prerendered, so page.url is the build-time URL and not the deployed origin.
  // The canonical origin comes from SITE instead. This is also what keeps the
  // http:// copy of the site from competing with https:// in the index.
  const canonical = $derived(new URL(page.url.pathname, SITE.origin).href)
  const imageUrl = $derived(new URL(image, SITE.origin).href)
  const full = $derived(
    fullTitle ?? (title === SITE.name ? SITE.tagline : `${title} - ${SITE.name}`),
  )
</script>

<svelte:head>
  <title>{full}</title>
  <meta name="description" content={description} />
  <link rel="canonical" href={canonical} />

  <!--
    `index, follow` is already the default, so it's the two limits after it that
    earn this tag. Without `max-image-preview:large` Google caps the thumbnail
    next to a result at a postage stamp, and this site's whole argument is what
    it looks like: the screenshot is the pitch, and a large preview is the
    difference between showing it and describing it. It's also the gate on
    appearing in Discover at all.

    `max-snippet:-1` lifts the description cap so the full sentence can show
    rather than a truncated clause.
  -->
  <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1" />

  <meta property="og:type" content="website" />
  <meta property="og:site_name" content={SITE.name} />
  <meta property="og:locale" content="en" />
  <meta property="og:title" content={full} />
  <meta property="og:description" content={description} />
  <meta property="og:url" content={canonical} />
  <meta property="og:image" content={imageUrl} />
  <!-- Dimensions let a card render at the right size before the image lands,
       which is the difference between a large card and a cropped one. -->
  <meta property="og:image:width" content="1200" />
  <meta property="og:image:height" content="630" />
  <meta property="og:image:type" content="image/png" />
  <meta property="og:image:alt" content={imageAlt} />

  <meta name="twitter:card" content="summary_large_image" />
  <meta name="twitter:title" content={full} />
  <meta name="twitter:description" content={description} />
  <meta name="twitter:image" content={imageUrl} />
  <meta name="twitter:image:alt" content={imageAlt} />
</svelte:head>
