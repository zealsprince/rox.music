<script lang="ts">
  import type { PageData } from './$types'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { YEAR } from '$data/site'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('mp3tag-title', { year: YEAR })
  const DESCRIPTION = t('mp3tag-title.description')
</script>

<Meta title={t('mp3tag-breadcrumb')} fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb={t('mp3tag-breadcrumb')}
/>

<section class="shell narrow intro">
  <h1>{t('mp3tag-h1')}</h1>
  <p class="prose lede">{t('mp3tag-h1.lede')}</p>
  <DownloadButton release={data.release} />
</section>

<section class="shell narrow block">
  <h2>{t('mp3tag-isnt')}</h2>
  <div class="prose">
    <p>{t('mp3tag-isnt.p1')}</p>
    <p>{t('mp3tag-isnt.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('mp3tag-write')}</h2>
    <div class="prose">
      <p>{t('mp3tag-write.p1')}</p>
      <p>{t('mp3tag-write.p2')}</p>
      <p>{t('mp3tag-write.p3')}</p>
    </div>
    <div class="callout-wrap">
      <Callout label={t('mp3tag-cost')}>
        <p>{t('mp3tag-cost.body')}</p>
      </Callout>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('mp3tag-batch')}</h2>
  <div class="prose">
    <p>{t('mp3tag-batch.p1')}</p>
    <p>{t('mp3tag-batch.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('mp3tag-specs')}</h2>
    <ul class="specs">
      <li><Rich key="mp3tag-spec-formats" /></li>
      <li><Rich key="mp3tag-spec-ratings" /></li>
      <li><Rich key="mp3tag-spec-genres" /></li>
      <li><Rich key="mp3tag-spec-art" /></li>
      <li><Rich key="mp3tag-spec-lookup" /></li>
      <li><Rich key="mp3tag-spec-repair" /></li>
      <li><Rich key="mp3tag-spec-patterns" /></li>
    </ul>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('mp3tag-stay')}</h2>
  <div class="prose">
    <p>{t('mp3tag-stay.p1')}</p>
    <p>{t('mp3tag-stay.p2')}</p>
    <p class="aside">{t('mp3tag-stay.aside')}</p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('mp3tag-closer')}</h2>
    <p class="prose"><Rich key="mp3tag-closer.body" /></p>
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

  .callout-wrap {
    margin-top: var(--space-lg);
  }

  .specs {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: var(--space-md);
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  /* :global, because the bold run comes out of a message through {@html} and
     Svelte's scoping class never lands on it. */
  .specs :global(strong) {
    color: var(--text-bright);
    font-weight: 600;
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
