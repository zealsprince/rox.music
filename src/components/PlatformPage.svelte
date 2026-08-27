<script lang="ts">
  import type { PlatformPage } from '$data/platform-pages'
  import type { Release } from '$types/release'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import PlatformIcon from '$components/PlatformIcon.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { PLATFORM_BY_ID } from '$data/platforms'
  import { WORKSPACE_COUNT } from '$data/workspaces'
  import { i18n } from '$lib/i18n/context'

  interface Props {
    page: PlatformPage
    release: Release
  }

  const { page, release }: Props = $props()

  const { t } = i18n()

  const label = $derived(PLATFORM_BY_ID[page.id].label)

  // The macOS page counts the shipped workspaces in two of its sentences.
  // Every message on these pages gets the argument rather than the two that
  // need it getting a special case: an unused Fluent argument costs nothing,
  // and a missing one renders the placeable raw.
  const ARGS = { count: WORKSPACE_COUNT }
</script>

<!--
  The shell for the three platform pages. Only the frame is shared: every word
  comes from the page's own entry in platform-pages.ts, which is what keeps
  these from being three copies of one page with the OS name substituted.
-->

<Meta
  title={label}
  fullTitle={t(page.key, ARGS)}
  description={t(`${page.key}.description`, ARGS)}
/>
<StructuredData
  {release}
  name={t(page.key, ARGS)}
  description={t(`${page.key}.description`, ARGS)}
  breadcrumb={t('platform-breadcrumb', { platform: label })}
/>

<section class="shell narrow intro">
  <p class="eyebrow">
    <PlatformIcon platform={page.id} size={18} />
    {label}
  </p>
  <h1>{t(`${page.key}.h1`, ARGS)}</h1>
  <p class="prose lede">{t(`${page.key}.lede`, ARGS)}</p>
  <DownloadButton {release} />
</section>

{#each page.sections as section, index (section.heading)}
  <section class="block" class:band={index % 2 === 1}>
    <div class="shell narrow">
      <h2>{t(section.heading)}</h2>
      <div class="prose">
        {#each section.body as paragraph (paragraph)}
          <p><Rich key={paragraph} args={ARGS} /></p>
        {/each}
        {#if section.commands}
          <pre><code>{section.commands.join('\n')}</code></pre>
        {/if}
      </div>
    </div>
  </section>
{/each}

<section class="shell narrow block">
  <h2>{t('platform-limits', { platform: label })}</h2>
  <!-- Every page carries this. A platform page with no limits section is a
       brochure, and the first thing it costs is the reader's trust in the
       sections above it. -->
  <ul class="limits">
    {#each page.limits as limit (limit)}
      <li><Rich key={limit} args={ARGS} /></li>
    {/each}
  </ul>
  <!-- The turn, after the limits rather than before them. A page that lists
       what it can't do and stops reads as an apology; one that leads with the
       pitch and buries the limits under it reads as a brochure. This order is
       the one that leaves the reader trusting both halves. -->
  <p class="aside">{t(`${page.key}.aside`, ARGS)}</p>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('platform-closer')}</h2>
    <p class="prose">{t('platform-closer.body')}</p>
    <DownloadButton {release} />
    <!-- Two sentences, two messages, both carrying their own links. The second
         differs per page because it names the other two platforms, and word
         order around a pair of links is not something a template can fake in
         four languages. -->
    <p class="prose fine">
      <Rich key="platform-more" />
      <Rich key="{page.key}.siblings" />
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
