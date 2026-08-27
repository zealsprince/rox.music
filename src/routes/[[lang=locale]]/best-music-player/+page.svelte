<script lang="ts">
  import type { PageData } from './$types'
  import BenchmarkTable from '$components/BenchmarkTable.svelte'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { YEAR } from '$data/site'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  // The year lives here and in the h1, never in the path. deploy.yml rebuilds
  // daily, so both re-date themselves and the URL keeps working forever.
  const TITLE = t('best-title', { year: YEAR })
  const DESCRIPTION = t('best-title.description')

  const CRITERIA = [
    'best-criterion-size',
    'best-criterion-read',
    'best-criterion-write',
    'best-criterion-layout',
    'best-criterion-yours',
  ]
</script>

<Meta
  title={t('best-breadcrumb')}
  fullTitle={TITLE}
  description={DESCRIPTION}
/>
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb={t('best-breadcrumb')}
/>

<section class="shell narrow intro">
  <h1>{TITLE}</h1>
  <p class="prose lede">{t('best-lede')}</p>

  <!-- Kept in the intro rather than given a section of its own. A disclosure
       belongs where the reader decides how to weigh the page, which is before
       the first criterion, not floating in whitespace between two headings. -->
  <div class="disclosure">
    <Callout label={t('disclosure')}>
      <p>{t('best-disclosure')}</p>
    </Callout>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('best-criteria')}</h2>
  <ol class="criteria">
    {#each CRITERIA as key (key)}
      <li>
        <h3>{t(key)}</h3>
        <p>{t(`${key}.body`)}</p>
      </li>
    {/each}
  </ol>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('best-measured')}</h2>
    <p class="prose">{t('best-measured.body')}</p>

    <BenchmarkTable />
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('best-shortlist')}</h2>
  <div class="prose">
    <p><Rich key="best-shortlist.p1" /></p>
    <p><Rich key="best-shortlist.p2" /></p>
    <p><Rich key="best-shortlist.p3" /></p>
    <!-- Different examples from the ones the platform pages and the Foobar2000
         comparison use, on purpose. These two are the library-ownership
         argument, which is the one this page is actually about. -->
    <p class="aside">{t('best-shortlist.aside')}</p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('best-closer')}</h2>
    <p class="prose">{t('best-closer.body')}</p>
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

  .disclosure {
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

  .criteria {
    list-style: none;
    margin: 0;
    padding: 0;
    counter-reset: criteria;
    display: grid;
    gap: var(--space-lg);
  }

  .criteria li {
    counter-increment: criteria;
  }

  /* The number is decoration for a list that already has semantic order, so it
     is generated rather than typed into the heading. */
  .criteria h3 {
    font-size: var(--step-1);
    margin-bottom: var(--space-xs);
  }

  .criteria h3::before {
    content: counter(criteria) '. ';
    color: var(--accent-text);
    font-variant-numeric: tabular-nums;
  }

  .criteria p {
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  /* Italic and brighter than the prose around it, so it reads as the line the
     section was walking toward rather than as a fourth paragraph. */
  .aside {
    margin-top: var(--space-lg);
    color: var(--text-bright);
    font-style: italic;
  }

  .closer .prose {
    margin-bottom: var(--space-lg);
  }
</style>
