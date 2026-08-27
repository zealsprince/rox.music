<script lang="ts">
  import type { PageData } from './$types'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { WORKSPACE_COUNT } from '$data/workspaces'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('catrox-title')
  const DESCRIPTION = t('catrox-title.description')
</script>

<Meta title="CaTRoX" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="CaTRoX"
/>

<section class="shell narrow intro">
  <h1>{t('catrox-h1')}</h1>
  <p class="prose lede">{t('catrox-h1.lede')}</p>

  <!--
    Attribution above the fold, not in a footnote. The whole page trades on a
    name other people made, and burying the credit under the pitch would be the
    version of this that deserves the criticism.
  -->
  <div class="credit">
    <Callout label={t('catrox-credit')}>
      <p><Rich key="catrox-credit.body" /></p>
    </Callout>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('catrox-was')}</h2>
  <div class="prose">
    <p>{t('catrox-was.p1')}</p>
    <p>{t('catrox-was.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('catrox-nekorox')}</h2>
    <div class="prose">
      <p><Rich key="catrox-nekorox.p1" /></p>
      <p>{t('catrox-nekorox.p2')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('catrox-recreation')}</h2>
  <div class="prose">
    <p><Rich key="catrox-recreation.body" /></p>
  </div>

  <!--
    `sizes` matches the reading column measured at 787px; see the comparison
    page for the derivation.
  -->
  <div class="shot">
    <Screenshot
      id="catrox"
      alt={t('catrox-shot-alt')}
      sizes="(min-width: 827px) 787px, calc(100vw - 2.5rem)"
    />
  </div>

  <div class="prose after-shot">
    <p>{t('catrox-recreation.after')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('catrox-limits')}</h2>
    <ul class="limits">
      <li>{t('catrox-limit-panels')}</li>
      <li>{t('catrox-limit-youtube')}</li>
      <li>{t('catrox-limit-plugins')}</li>
      <li>{t('catrox-limit-fidelity')}</li>
    </ul>
    <p class="aside">{t('catrox-limits.aside')}</p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>{t('catrox-closer')}</h2>
  <p class="prose">
    <Rich key="catrox-closer.body" args={{ others: WORKSPACE_COUNT - 1 }} />
  </p>
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

  .credit {
    margin-top: var(--space-lg);
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

  .shot {
    margin-top: var(--space-lg);
  }

  .after-shot {
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
