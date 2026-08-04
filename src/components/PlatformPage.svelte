<script lang="ts">
  import type { PlatformPage } from '$data/platform-pages'
  import type { Release } from '$types/release'
  import { base } from '$app/paths'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import PlatformIcon from '$components/PlatformIcon.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { PLATFORM_PAGES } from '$data/platform-pages'
  import { PLATFORM_BY_ID } from '$data/platforms'

  interface Props {
    page: PlatformPage
    release: Release
  }

  const { page, release }: Props = $props()

  const label = $derived(PLATFORM_BY_ID[page.id].label)

  // The other two platform pages. rox is cross-platform and the people most
  // likely to want it run more than one OS, so this is a real link for a reader
  // as well as the thing that stops each page hanging off a single inbound edge
  // from the hub.
  const siblings = $derived(
    Object.values(PLATFORM_PAGES).filter(other => other.id !== page.id),
  )
</script>

<!--
  The shell for the three platform pages. Only the frame is shared: every word
  comes from the page's own entry in platform-pages.ts, which is what keeps
  these from being three copies of one page with the OS name substituted.
-->

<Meta title={label} fullTitle={page.title} description={page.description} />
<StructuredData
  {release}
  name={page.title}
  description={page.description}
  breadcrumb="rox on {label}"
/>

<section class="shell narrow intro">
  <p class="eyebrow">
    <PlatformIcon platform={page.id} size={18} />
    {label}
  </p>
  <h1>{page.h1}</h1>
  <p class="prose lede">{page.lede}</p>
  <DownloadButton {release} />
</section>

{#each page.sections as section, index (section.heading)}
  <section class="block" class:band={index % 2 === 1}>
    <div class="shell narrow">
      <h2>{section.heading}</h2>
      <div class="prose">
        {#each section.body as paragraph (paragraph)}
          <p>{paragraph}</p>
        {/each}
        {#if section.commands}
          <pre><code>{section.commands.join('\n')}</code></pre>
        {/if}
      </div>
    </div>
  </section>
{/each}

<section class="shell narrow block">
  <h2>What it can't do on {label}</h2>
  <!-- Every page carries this. A platform page with no limits section is a
       brochure, and the first thing it costs is the reader's trust in the
       sections above it. -->
  <ul class="limits">
    {#each page.limits as limit (limit)}
      <li>{limit}</li>
    {/each}
  </ul>
  <!-- The turn, after the limits rather than before them. A page that lists
       what it can't do and stops reads as an apology; one that leads with the
       pitch and buries the limits under it reads as a brochure. This order is
       the one that leaves the reader trusting both halves. -->
  <p class="aside">{page.aside}</p>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>Point it at your library</h2>
    <p class="prose">
      Free and open source under the AGPL. No account, and nothing running in the
      background when it's closed.
    </p>
    <DownloadButton {release} />
    <p class="prose fine">
      More on <a href="{base}/workspaces">what it looks like</a>, the
      <a href="{base}/foobar2000-alternative">full Foobar2000 comparison</a>, or what the
      exclusive output above is actually doing, under
      <a href="{base}/replaygain">ReplayGain and bit-perfect</a>.
      Same player on
      {#each siblings as other, index (other.id)}
        <a href="{base}/{other.id}">{PLATFORM_BY_ID[other.id].label}</a>{index === 0
          ? ' and '
          : '.'}
      {/each}
    </p>
  </div>
</section>

<style>
  .intro {
    padding-block: var(--space-lg) var(--space-lg);
  }

  .eyebrow {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-bottom: var(--space-sm);
    color: var(--text-muted);
    font-size: var(--step--1);
    text-transform: uppercase;
    letter-spacing: 0.08em;
  }

  h1 {
    font-size: var(--step-4);
  }

  .lede {
    margin-block: var(--space-md) var(--space-lg);
    font-size: var(--step-1);
    color: var(--text-secondary);
  }

  .block {
    padding-block: var(--space-xl);
  }

  .band {
    background: var(--bg-panel);
    border-block: var(--hairline) solid var(--border);
  }

  .block h2 {
    font-size: var(--step-3);
    margin-bottom: var(--space-md);
  }

  .limits {
    margin: 0;
    padding-left: 1.1rem;
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .limits li + li {
    margin-top: var(--space-sm);
  }

  /* Italic and brighter than the list above it, so it reads as the line the
     section was walking toward rather than as one more bullet in prose. */
  .aside {
    margin-top: var(--space-lg);
    color: var(--text-bright);
    font-style: italic;
  }

  .closer .prose {
    margin-bottom: var(--space-lg);
  }

  .fine {
    margin-top: var(--space-md);
    color: var(--text-muted);
    font-size: var(--step--1);
  }
</style>
