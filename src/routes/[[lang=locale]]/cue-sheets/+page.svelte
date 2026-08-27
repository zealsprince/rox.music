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

  const TITLE = t('cue-title')
  const DESCRIPTION = t('cue-title.description')
</script>

<Meta title={t('cue-breadcrumb')} fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb={t('cue-breadcrumb')}
/>

<section class="shell narrow intro">
  <h1>{t('cue-h1')}</h1>
  <p class="prose lede">{t('cue-h1.lede')}</p>
</section>

<section class="shell narrow block">
  <h2>{t('cue-what')}</h2>
  <div class="prose">
    <p><Rich key="cue-what.p1" /></p>
    <p>{t('cue-what.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('cue-rows')}</h2>
    <div class="prose">
      <p>{t('cue-rows.p1')}</p>
      <p><Rich key="cue-rows.p2" /></p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('cue-playing')}</h2>
  <div class="prose">
    <p>{t('cue-playing.p1')}</p>
    <p>{t('cue-playing.p2')}</p>
    <p>{t('cue-playing.p3')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('cue-scanning')}</h2>
    <div class="prose">
      <p>{t('cue-scanning.p1')}</p>
      <p>{t('cue-scanning.p2')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('cue-ratings')}</h2>
  <div class="prose">
    <p>{t('cue-ratings.p1')}</p>
    <p>{t('cue-ratings.p2')}</p>
  </div>

  <div class="callout-wrap">
    <Callout label={t('cue-outstanding')}>
      <p>{t('cue-outstanding.body')}</p>
    </Callout>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('cue-later')}</h2>
    <ul class="limits">
      <li><Rich key="cue-later-m3u" /></li>
      <li>{t('cue-later-scrobble')}</li>
      <li>{t('cue-later-listens')}</li>
      <li>{t('cue-later-replaygain')}</li>
    </ul>
    <p class="aside">{t('cue-later.aside')}</p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>{t('cue-closer')}</h2>
  <p class="prose"><Rich key="cue-closer.body" /></p>
  <DownloadButton release={data.release} />
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

  .callout-wrap {
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
