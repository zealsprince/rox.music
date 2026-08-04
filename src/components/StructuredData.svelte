<script lang="ts">
  import type { Release } from '$types/release'
  import { page } from '$app/state'
  import { SITE } from '$data/site'

  interface Props {
    /**
     * Present on pages that loaded the release, so the graph can carry the real
     * version and download URL instead of a stale literal.
     */
    release?: Release
    /** What this URL is about. Mirrors the <title> and description in Meta. */
    name: string
    description: string
    /** Path to the page's lead image under static/, for primaryImageOfPage. */
    image?: string
    /**
     * Label for this page in the trail under Home. Home passes nothing, since a
     * breadcrumb whose only entry is the page you're on says nothing.
     */
    breadcrumb?: string
  }

  const {
    release,
    name,
    description,
    image = '/social/default.png',
    breadcrumb,
  }: Props = $props()

  // Same reasoning as Meta's canonical: prerendered, so page.url is the
  // build-time URL. The origin has to come from SITE or every @id in the graph
  // points at localhost.
  const canonical = $derived(new URL(page.url.pathname, SITE.origin).href)
  const imageUrl = $derived(new URL(image, SITE.origin).href)

  // One @graph rather than several loose blocks: it lets the nodes reference
  // each other by @id, so the author on the app is the same entity as the
  // publisher of the site rather than two people who happen to share a name.
  const graph = $derived({
    '@context': 'https://schema.org',
    '@graph': [
      {
        '@type': 'WebSite',
        '@id': `${SITE.origin}/#website`,
        'url': `${SITE.origin}/`,
        'name': SITE.name,
        'description': SITE.description,
        'publisher': { '@id': `${SITE.origin}/#author` },
        'inLanguage': 'en',
      },
      {
        '@type': 'Person',
        '@id': `${SITE.origin}/#author`,
        'name': 'Andrew Lake',
        'url': 'https://zealsprince.com',
        'sameAs': ['https://github.com/zealsprince'],
      },
      {
        '@type': 'SoftwareApplication',
        '@id': `${SITE.origin}/#app`,
        'name': 'rox',
        'url': `${SITE.origin}/`,
        'applicationCategory': 'MultimediaApplication',
        'applicationSubCategory': 'Music player',
        'description': SITE.description,
        'operatingSystem': 'Linux, macOS, Windows',
        'author': { '@id': `${SITE.origin}/#author` },
        'license': 'https://www.gnu.org/licenses/agpl-3.0.html',
        'isAccessibleForFree': true,
        'downloadUrl': `${SITE.origin}/download`,
        'installUrl': `${SITE.origin}/download`,
        'codeRepository': SITE.repo,
        'screenshot': `${SITE.origin}/social/default.png`,
        'softwareHelp': SITE.docs,
        'sameAs': [SITE.repo],
        'featureList': [
          'Composable panel UI with pop-out windows',
          'Shareable workspaces carrying layout, palette and appearance',
          'Deep tag editing with atomic writes and batch edits',
          'Gapless playback',
          'Equalizer, crossfade and ReplayGain',
          'Exclusive bit-perfect output',
          'Synced lyrics',
          'Last.fm scrobbling',
        ],
        // Free software, but the node still needs an Offer for search engines
        // to show it as free rather than as unknown.
        'offers': {
          '@type': 'Offer',
          'price': '0',
          'priceCurrency': 'USD',
        },
        // No aggregateRating: there are no ratings, and inventing them is both
        // a policy violation and a lie.
        ...(release
          ? {
            softwareVersion: release.version,
            releaseNotes: release.url,
            datePublished: release.publishedAt,
          }
          : {}),
      },
      // Until this node existed, all three URLs emitted the same site-level
      // graph, so /workspaces described the app and never itself. This is the
      // node that says what *this* URL is, hangs it off the WebSite, and gives
      // the breadcrumb something to attach to.
      {
        '@type': 'WebPage',
        '@id': `${canonical}#webpage`,
        'url': canonical,
        name,
        description,
        'isPartOf': { '@id': `${SITE.origin}/#website` },
        'about': { '@id': `${SITE.origin}/#app` },
        'primaryImageOfPage': imageUrl,
        'inLanguage': 'en',
        ...(breadcrumb ? { breadcrumb: { '@id': `${canonical}#breadcrumb` } } : {}),
      },
      // The last crumb deliberately carries no `item`. Google reads a trailing
      // self-link as a redundant hop and drops the whole trail over it.
      ...(breadcrumb
        ? [{
          '@type': 'BreadcrumbList',
          '@id': `${canonical}#breadcrumb`,
          'itemListElement': [
            { '@type': 'ListItem', 'position': 1, 'name': 'rox', 'item': `${SITE.origin}/` },
            { '@type': 'ListItem', 'position': 2, 'name': breadcrumb },
          ],
        }]
        : []),
    ],
  })

  // Two separate escapes, for two different parsers.
  //
  // `\\u003c` neutralises every `<` in the JSON payload, so no string value can
  // close the script element early in the browser.
  //
  // `<\/script>` in the tag below is for Svelte's own compiler: an unescaped
  // closing tag inside this block would end the component's script section
  // rather than the string.
  const json = $derived(JSON.stringify(graph).replace(/</g, '\\u003c'))
  const tag = $derived(`<script type="application/ld+json">${json}<\/script>`)
</script>

<svelte:head>
  <!--
    The rule is right in general and wrong here: there is no way to emit a
    ld+json script tag from Svelte markup without it. The payload is
    JSON.stringify of an object built above from site constants and the GitHub
    release API, with every `<` escaped to <, so nothing in it can close the
    element or open another. Rendered at prerender only, never from user input.
  -->
  <!-- eslint-disable-next-line svelte/no-at-html-tags -->
  {@html tag}
</svelte:head>
