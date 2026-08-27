<script lang="ts">
  import { page } from '$app/state'
  import { SITE } from '$data/site'
  import { alternates, SOURCE_LOCALE } from '$lib/i18n'
  import { i18n } from '$lib/i18n/context'

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

  const { t, info, path } = i18n()

  const {
    title,
    description,
    fullTitle,
    image = '/social/default.png',
    imageAlt = t('social-image-alt'),
  }: Props = $props()

  // Prerendered, so page.url is the build-time URL and not the deployed origin.
  // The canonical origin comes from SITE instead. This is also what keeps the
  // http:// copy of the site from competing with https:// in the index.
  //
  // The locale prefix is already in page.url.pathname, so every translation
  // remains its own canonical URL. Pointing them all at the English one would
  // be telling Google the translations are duplicates and to drop them.
  const canonical = $derived(new URL(page.url.pathname, SITE.origin).href)
  const imageUrl = $derived(new URL(image, SITE.origin).href)
  const full = $derived(fullTitle ?? `${title} - ${SITE.name}`)

  // Every language this page exists in, this one included: hreflang is a set of
  // mutual claims, and a page that doesn't list itself is one Google throws the
  // whole cluster out over.
  const languages = alternates(path, SITE.origin)
</script>

<svelte:head>
  <title>{full}</title>
  <meta name="description" content={description} />
  <link rel="canonical" href={canonical} />

  <!--
    x-default goes to the English URL. It is not "the English version", it's
    where a request whose language nobody here speaks should land, and English
    at the site root is the honest answer for a Rust music player.
  -->
  {#each languages as { locale, url } (locale.id)}
    <link rel="alternate" hreflang={locale.htmlLang} href={url} />
    {#if locale.id === SOURCE_LOCALE}
      <link rel="alternate" hreflang="x-default" href={url} />
    {/if}
  {/each}

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
  <meta property="og:locale" content={info.og} />
  {#each languages as { locale } (locale.id)}
    {#if locale.id !== info.id}
      <meta property="og:locale:alternate" content={locale.og} />
    {/if}
  {/each}
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
