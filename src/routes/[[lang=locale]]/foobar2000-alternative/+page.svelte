<script lang="ts">
  import type { PageData } from './$types'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { YEAR } from '$data/site'
  import { WORKSPACE_COUNT } from '$data/workspaces'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('fb-title', { year: YEAR })
  const DESCRIPTION = t('fb-title.description')

  // Rows are claims about both players, so each one has to survive being read
  // by someone who uses Foobar2000 daily. Where it still wins, the row says so.
  // The key carries the area; `.fb` and `.rox` are the two cells.
  const ROWS = [
    { key: 'fb-row-linux', win: 'rox' },
    { key: 'fb-row-macos', win: 'even' },
    { key: 'fb-row-windows', win: 'even' },
    { key: 'fb-row-panels', win: 'even' },
    { key: 'fb-row-sharing', win: 'rox' },
    { key: 'fb-row-source', win: 'rox' },
    { key: 'fb-row-components', win: 'foobar2000' },
    { key: 'fb-row-maturity', win: 'foobar2000' },
    { key: 'fb-row-footprint', win: 'foobar2000' },
  ]
</script>

<Meta
  title={t('fb-breadcrumb')}
  fullTitle={TITLE}
  description={DESCRIPTION}
/>
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb={t('fb-breadcrumb')}
/>

<section class="shell narrow intro">
  <h1>{t('fb-h1')}</h1>
  <p class="prose lede">{t('fb-h1.lede')}</p>
  <DownloadButton release={data.release} />
</section>

<section class="shell narrow block">
  <h2>{t('fb-right')}</h2>
  <div class="prose">
    <p><Rich key="fb-right.p1" /></p>
    <p>{t('fb-right.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('fb-leaves')}</h2>
    <div class="prose">
      <p>{t('fb-leaves.p1')}</p>
      <p>{t('fb-leaves.p2')}</p>
      <p>{t('fb-leaves.p3')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('fb-does')}</h2>
  <div class="prose">
    <p><Rich key="fb-does.p1" /></p>
    <p><Rich key="fb-does.p2" args={{ count: WORKSPACE_COUNT }} /></p>
  </div>

  <!--
    `sizes` tracks the reading column, not the wide shell: .shell.narrow caps at
    --reading plus its own padding, which measures 787px. Past an 827px viewport
    the column stops growing, so the image is a flat 787px from there up; below
    it, the shell's padding is all that comes off the viewport. Measured in the
    browser rather than derived, so re-check it if --reading moves.
  -->
  <div class="shot">
    <Screenshot
      id="catrox"
      alt={t('fb-shot-alt')}
      sizes="(min-width: 827px) 787px, calc(100vw - 2.5rem)"
    />
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('fb-table')}</h2>
    <div class="table-scroll">
      <table>
        <caption class="visually-hidden">{t('fb-table.caption')}</caption>
        <thead>
          <tr>
            <th scope="col">{t('fb-table.area')}</th>
            <th scope="col">Foobar2000</th>
            <th scope="col">rox</th>
          </tr>
        </thead>
        <tbody>
          {#each ROWS as row (row.key)}
            <tr>
              <th scope="row">{t(row.key)}</th>
              <td class:loses={row.win === 'rox'}>{t(`${row.key}.fb`)}</td>
              <td class:loses={row.win === 'foobar2000'}>{t(`${row.key}.rox`)}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
    <p class="method">{t('fb-table.method')}</p>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('fb-not')}</h2>
  <div class="prose">
    <p>{t('fb-not.p1')}</p>
    <p>{t('fb-not.p2')}</p>
    <!-- The counterweight to the three rows Foobar2000 wins. Not a walk-back:
         the concessions above stay exactly as strong. Arriving late is a real
         cost and it buys a real thing, and a comparison that only prices the
         cost is as lopsided as one that only prices the win. -->
    <p>{t('fb-not.p3')}</p>
    <!-- Deliberately last. Three paragraphs of concession have to land before a
         line like this reads as a fact rather than as the sales pitch the
         reader was bracing for. The two examples are picked because they have
         no counterpart to name, so it stays a claim about what rox does rather
         than a guess about what twenty years of components can't. -->
    <p class="aside">{t('fb-not.aside')}</p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('fb-closer')}</h2>
    <p class="prose">{t('fb-closer.body')}</p>
    <DownloadButton release={data.release} />
    <p class="prose fine"><Rich key="fb-closer.fine" /></p>
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

  .shot {
    margin-top: var(--space-lg);
  }

  .table-scroll {
    margin-block: var(--space-lg) var(--space-sm);
    overflow-x: auto;
    border: var(--hairline) solid var(--border);
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-size: var(--step--1);
  }

  th,
  td {
    text-align: left;
    padding: 0.6rem var(--space-md);
    border-bottom: var(--hairline) solid var(--border);
    vertical-align: top;
  }

  thead th {
    color: var(--text-muted);
    font-weight: 500;
    background: var(--bg-toolbar);
    white-space: nowrap;
  }

  tbody th[scope='row'] {
    color: var(--text-bright);
    font-weight: 500;
    white-space: nowrap;
  }

  /* Dims the side that comes off worse on a row rather than accenting the
     winner. Accenting rox in nine rows would read as a scorecard it wrote
     about itself. */
  .loses {
    color: var(--text-faint);
  }

  tbody tr:last-child th,
  tbody tr:last-child td {
    border-bottom: 0;
  }

  .method,
  .fine {
    color: var(--text-muted);
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

  .fine {
    margin-top: var(--space-md);
  }
</style>
