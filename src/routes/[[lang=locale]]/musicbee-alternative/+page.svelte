<script lang="ts">
  import type { PageData } from './$types'
  import BenchmarkTable from '$components/BenchmarkTable.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { YEAR } from '$data/site'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('musicbee-title', { year: YEAR })
  const DESCRIPTION = t('musicbee-title.description')
</script>

<Meta title={t('musicbee-breadcrumb')} fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb={t('musicbee-breadcrumb')}
/>

<section class="shell narrow intro">
  <h1>{t('musicbee-h1')}</h1>
  <p class="prose lede">{t('musicbee-h1.lede')}</p>
  <DownloadButton release={data.release} />
</section>

<section class="shell narrow block">
  <h2>{t('musicbee-good')}</h2>
  <div class="prose">
    <p><Rich key="musicbee-good.p1" /></p>
    <p><Rich key="musicbee-good.p2" /></p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('musicbee-gaps')}</h2>
    <p class="prose intro-line">{t('musicbee-gaps.body')}</p>
    <ul class="limits">
      <li><Rich key="musicbee-gap-sync" /></li>
      <li><Rich key="musicbee-gap-radio" /></li>
      <li><Rich key="musicbee-gap-plugins" /></li>
      <li><Rich key="musicbee-gap-ffmpeg" /></li>
    </ul>
    <p class="method">{t('musicbee-gaps.close')}</p>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('musicbee-transfers')}</h2>
  <div class="prose">
    <p><Rich key="musicbee-transfers.p1" /></p>
    <p><Rich key="musicbee-transfers.p2" /></p>
    <p><Rich key="musicbee-transfers.p3" /></p>
    <p><Rich key="musicbee-transfers.p4" /></p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('musicbee-size')}</h2>
    <p class="prose">{t('musicbee-size.body')}</p>

    <BenchmarkTable spaced />
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('musicbee-split')}</h2>
  <div class="prose">
    <p>{t('musicbee-split.p1')}</p>
    <p>{t('musicbee-split.p2')}</p>
    <p class="aside">{t('musicbee-split.aside')}</p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('musicbee-closer')}</h2>
    <p class="prose"><Rich key="musicbee-closer.body" /></p>
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

  .intro-line {
    margin-bottom: var(--space-lg);
  }

  .limits {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: var(--space-sm);
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  /* :global, because the bold run comes out of a message through {@html} and
     Svelte's scoping class never lands on it. */
  .limits :global(strong) {
    color: var(--text-bright);
    font-weight: 600;
  }

  .method {
    margin-top: var(--space-md);
    color: var(--text-muted);
    font-size: var(--step--1);
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
