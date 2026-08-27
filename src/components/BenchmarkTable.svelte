<script lang="ts">
  import Rich from '$components/Rich.svelte'
  import {
    BENCHMARKS,
    cpuLabel,
    loadedPct,
    memoryLabel,
    memoryPct,
    secondsLabel,
  } from '$data/benchmarks'
  import { i18n } from '$lib/i18n/context'

  interface Props {
    /**
     * Append the DeaDBeeF footnote. Only the homepage carries it: it's the page
     * that presents the table as the argument, so it's the page that owes the
     * reader the row that isn't there.
     */
    deadbeef?: boolean
    /** Extra air above the method note, where the section around it wants it. */
    spaced?: boolean
  }

  const { deadbeef = false, spaced = false }: Props = $props()

  const { t, info } = i18n()

  // Numbers render through Intl against the page's language, so a German
  // reader gets 2,3 s and 0,5 % rather than the shapes English uses.
  const num = info.htmlLang
</script>

<!--
  One table, three pages. It used to be three copies of this markup and three
  copies of the styles below, which was survivable while the cells were literal
  strings and stopped being so the moment every number had to know what language
  it was in.
-->
<div class="table-scroll">
  <table>
    <caption class="visually-hidden">{t('benchmark-caption')}</caption>
    <thead>
      <tr>
        <th scope="col">{t('benchmark-player')}</th>
        <th scope="col">{t('benchmark-window-up')}</th>
        <th scope="col">{t('benchmark-loaded')}</th>
        <th scope="col">{t('benchmark-memory')}</th>
        <th scope="col">{t('benchmark-idle-cpu')}</th>
      </tr>
    </thead>
    <tbody>
      {#each BENCHMARKS as row (row.player)}
        <tr class:self={row.self}>
          <th scope="row">
            {#if row.url}
              <a class="plain player" href={row.url} rel="noreferrer">{row.player}</a>
            {:else}
              {row.player}
            {/if}
          </th>
          <td>{row.windowUpSecs === null ? '-' : secondsLabel(num, row.windowUpSecs)}</td>
          <td class="bar-cell">
            <span class="value" class:unsettled={row.loadedSecs === null}>
              {row.loadedSecs === null
                ? t('benchmark-never-settles')
                : secondsLabel(num, row.loadedSecs)}
            </span>
            <!-- Presentation only: the number above it is the accessible
                 value, so a screen reader gets one figure, not two. -->
            <span class="track" aria-hidden="true">
              <span class="bar" style="--pct: {loadedPct(row)}%"></span>
            </span>
          </td>
          <td class="bar-cell">
            <span class="value">{memoryLabel(num, row)}</span>
            <span class="track" aria-hidden="true">
              <span class="bar" style="--pct: {memoryPct(row)}%"></span>
            </span>
          </td>
          <td>{cpuLabel(num, row)}</td>
        </tr>
      {/each}
    </tbody>
  </table>
</div>

<p class="method" class:spaced>
  <Rich key="benchmark-method" />
  {#if deadbeef}
    <Rich key="benchmark-method.deadbeef" />
  {/if}
</p>

<style>
  .table-scroll {
    margin-block: var(--space-lg) var(--space-sm);
    overflow-x: auto;
    border: var(--hairline) solid var(--border);
  }

  table {
    width: 100%;
    border-collapse: collapse;
    font-variant-numeric: tabular-nums;
    font-size: var(--step--1);
    white-space: nowrap;
  }

  th,
  td {
    text-align: right;
    padding: 0.6rem var(--space-md);
    border-bottom: var(--hairline) solid var(--border);
  }

  thead th {
    color: var(--text-muted);
    font-weight: 500;
    background: var(--bg-toolbar);
  }

  tbody th[scope='row'] {
    text-align: left;
    color: var(--text-bright);
    font-weight: 500;
  }

  /* Competitor names read as text, not as six amber links, so rox's own accented
     row stays the thing the eye lands on. The outbound arrow is suppressed for
     the same reason: a whole column of them is noise. */
  .player {
    color: inherit;
    text-decoration: underline;
    text-decoration-color: var(--gridline);
    text-underline-offset: 0.2em;
  }

  .player:hover {
    color: var(--accent-text);
    text-decoration-color: currentcolor;
  }

  tbody tr:last-child th,
  tbody tr:last-child td {
    border-bottom: 0;
  }

  /* A measure under each number rather than a block behind it: in flow, inside
     the cell's own box, so nothing bleeds into the neighbouring column. Scaled
     linearly against the worst result, because 134 MB against 2.8 GB is the
     entire point of this section and a log axis would hide it. */
  .bar-cell .value {
    display: block;
  }

  .track {
    display: block;
    height: 3px;
    margin-top: 0.35rem;
    background: var(--bg-control);
  }

  .bar {
    display: block;
    height: 100%;
    /* Grows leftward from the right edge, so it starts where the
       right-aligned number it belongs to ends. */
    width: var(--pct);
    margin-left: auto;
    background: var(--gridline);
  }

  tr.self .bar {
    background: var(--accent);
  }

  .unsettled {
    color: var(--text-muted);
    font-style: italic;
  }

  tr.self {
    background: color-mix(in srgb, var(--accent) 12%, transparent);
  }

  tr.self th[scope='row'] {
    color: var(--accent-text);
    font-weight: 700;
  }

  .method {
    color: var(--text-muted);
    font-size: var(--step--1);
  }

  .method.spaced {
    margin-top: var(--space-md);
  }

  /* :global, because these links come out of a message through {@html} and
     Svelte's scoping class never lands on them. Any rule aimed at something
     inside rich text needs this. */
  .method :global(a) {
    color: inherit;
    text-decoration: underline;
    text-decoration-color: var(--gridline);
    text-underline-offset: 0.2em;
  }

  .method :global(a:hover) {
    color: var(--accent-text);
  }
</style>
