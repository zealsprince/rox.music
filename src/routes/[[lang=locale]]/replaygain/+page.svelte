<script lang="ts">
  import type { PageData } from './$types'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('rg-title')
  const DESCRIPTION = t('rg-title.description')
</script>

<Meta title="ReplayGain" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="ReplayGain"
/>

<section class="shell narrow intro">
  <h1>{t('rg-h1')}</h1>
  <p class="prose lede">{t('rg-h1.lede')}</p>
</section>

<section class="shell narrow block">
  <h2>{t('rg-problem')}</h2>
  <div class="prose">
    <p>{t('rg-problem.p1')}</p>
    <p>{t('rg-problem.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('rg-modes')}</h2>
    <div class="prose">
      <p>{t('rg-modes.p1')}</p>
      <p><Rich key="rg-modes.track" /></p>
      <p><Rich key="rg-modes.album" /></p>
      <p>{t('rg-modes.setting')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('rg-peak')}</h2>
  <div class="prose">
    <p>{t('rg-peak.p1')}</p>
    <p>{t('rg-peak.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('rg-unmeasured')}</h2>
    <div class="prose">
      <p>{t('rg-unmeasured.p1')}</p>
      <p>{t('rg-unmeasured.p2')}</p>
      <p>{t('rg-unmeasured.p3')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('rg-skip')}</h2>
  <div class="prose">
    <p>{t('rg-skip.p1')}</p>
    <p>{t('rg-skip.p2')}</p>
  </div>

  <div class="callout-wrap">
    <Callout label={t('rg-bitperfect')}>
      <p>{t('rg-bitperfect.body')}</p>
    </Callout>
  </div>

  <div class="prose after-callout">
    <p>{t('rg-skip.choice')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('rg-exclusive')}</h2>
    <div class="prose">
      <p><Rich key="rg-exclusive.p1" /></p>
      <p>{t('rg-exclusive.p2')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('rg-limits')}</h2>
  <ul class="limits">
    <li><Rich key="rg-limit-opus" /></li>
    <li><Rich key="rg-limit-itunes" /></li>
    <li>{t('rg-limit-rate-switch')}</li>
  </ul>
  <p class="aside">{t('rg-limits.aside')}</p>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('rg-closer')}</h2>
    <p class="prose"><Rich key="rg-closer.body" /></p>
    <DownloadButton release={data.release} />
  </div>
</section>

<style>
  .intro {
    padding-block: var(--space-xl) var(--space-lg);
  }

  h1 {
    font-size: var(--step-4);
  }

  .lede {
    margin-top: var(--space-md);
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

  /* :global, because the bold run comes out of a message through {@html} and
     Svelte's scoping class never lands on it. */
  .prose :global(strong) {
    color: var(--text-bright);
    font-weight: 600;
  }

  .callout-wrap {
    margin-top: var(--space-lg);
  }

  .after-callout {
    margin-top: var(--space-lg);
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

  .aside {
    margin-top: var(--space-lg);
    color: var(--text-bright);
    font-style: italic;
  }

  .closer .prose {
    margin-bottom: var(--space-lg);
  }
</style>
