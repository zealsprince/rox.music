<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import DownloadButton from '$components/DownloadButton.svelte'
  import FeatureIcon from '$components/FeatureIcon.svelte'
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import {
    BENCHMARK_FOOTNOTE_URL,
    BENCHMARK_METHOD,
    BENCHMARKS,
    loadedPct,
    memoryLabel,
    memoryPct,
  } from '$data/benchmarks'
  import { FEATURE_GROUPS } from '$data/features'
  import { SITE } from '$data/site'
  import { WORKSPACE_COUNT } from '$data/workspaces'

  const { data }: { data: PageData } = $props()
</script>

<Meta title={SITE.name} description={SITE.description} />
<StructuredData
  release={data.release}
  name={SITE.tagline}
  description={SITE.description}
/>

<section class="hero shell">
  <div class="pitch">
    <h1>If Foobar2000 was made in the current year.</h1>
    <p class="lede">
      A desktop music player for people with large, carefully tagged local libraries. You
      build the panels yourself, and a theme is one file you can hand to someone else.
      Native on Linux, macOS and Windows.
    </p>
    <DownloadButton release={data.release} />
  </div>

  <!--
    `sizes` tracks the layout: the hero is the 7fr column of a 5fr/7fr grid with
    a 3.5rem gap, inside .shell's 1116px content width, so (1116 - 56) * 7/12 =
    618px at full width. The grid collapses to one column below 64rem.
  -->
  <Screenshot
    id="hero"
    alt="rox running the NekoRoX-style default workspace, showing the library, cover art, queue and a spectrum panel"
    sizes="(min-width: 1180px) 618px, (min-width: 64rem) calc((100vw - 7.5rem) * 7 / 12), (min-width: 48rem) calc(100vw - 4rem), calc(100vw - 2.5rem)"
    priority
  />
</section>

<section class="block band">
  <div class="shell">
    <h2>Under a second to a window</h2>
    <p class="prose">
      rox ships as one binary and starts before you've let go of the mouse.
    </p>

    <div class="table-scroll">
      <table>
        <caption class="visually-hidden">
          Startup, memory and idle CPU across seven music players on one 50,000-track library
        </caption>
        <thead>
          <tr>
            <th scope="col">Player</th>
            <th scope="col">Window up</th>
            <th scope="col">Fully loaded</th>
            <th scope="col">Memory</th>
            <th scope="col">Idle CPU</th>
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
              <td>{row.windowUp ?? '-'}</td>
              <td class="bar-cell">
                <span class="value" class:unsettled={row.loadedSecs === null}>
                  {row.loadedLabel}
                </span>
                <!-- Presentation only: the number above it is the accessible
                   value, so a screen reader gets one figure, not two. -->
                <span class="track" aria-hidden="true">
                  <span class="bar" style="--pct: {loadedPct(row)}%"></span>
                </span>
              </td>
              <td class="bar-cell">
                <span class="value">{memoryLabel(row)}</span>
                <span class="track" aria-hidden="true">
                  <span class="bar" style="--pct: {memoryPct(row)}%"></span>
                </span>
              </td>
              <td>{row.idleCpu}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>

    <p class="method">
      {BENCHMARK_METHOD}
      <a class="plain" href={BENCHMARK_FOOTNOTE_URL} rel="noreferrer">DeaDBeeF</a> would have
      sat at 44 MB and won on memory, but it never got a row: its MP3 parser segfaults
      partway through importing this library, every attempt. rox indexes all 50,000 tracks,
      including the truncated files that trip it.
    </p>
  </div>
</section>

<section class="shell block">
  <h2>What's in it</h2>
  <!--
    One lattice with its groups drawn inside it as full-width rules, the way a
    rox menu draws its own sections, rather than four separate boxes with air
    between them. The group name is a real heading, so the twelve cells hang off
    four h3s instead of sitting under the h2 as one undifferentiated run.
  -->
  <div class="features">
    {#each FEATURE_GROUPS as group (group.name)}
      <h3 class="group">{group.name}</h3>
      {#each group.features as feature (feature.title)}
        <article class="cell">
          <h4 class="head">
            <FeatureIcon icon={feature.icon} />
            <span>{feature.title}</span>
          </h4>
          <p class="body">{feature.body}</p>
          <!-- Pushed to the bottom of the cell rather than left under the copy,
               so the links across a row sit on one line whatever the paragraphs
               above them do. -->
          {#if feature.link}
            <p class="more">
              <a href="{base}{feature.link.path}">{feature.link.name}</a>
            </p>
          {/if}
        </article>
      {/each}
    {/each}
  </div>
</section>

<section class="block band closer">
  <div class="shell">
    <h2>Make it yours</h2>
    <p class="prose">
      There are {WORKSPACE_COUNT} workspaces in the box, one click away on the welcome
      window. Each one is a single file carrying the layout, the palette and the shaders it
      runs, so you can edit it, break it, and hand it to someone else.
      <a href="{base}/workspaces">See them all</a>.
    </p>
  </div>
</section>

<style>
  .hero {
    display: grid;
    gap: var(--space-xl);
    padding-block: var(--space-xl) var(--space-lg);
    align-items: center;
  }

  @media (min-width: 64rem) {
    .hero {
      grid-template-columns: minmax(0, 5fr) minmax(0, 7fr);
      padding-block: var(--space-2xl) var(--space-xl);
    }
  }

  h1 {
    font-size: var(--step-4);
    letter-spacing: -0.035em;
  }

  /* Once the hero goes two-column the pitch column stops growing (the shell
     caps at --page-max) but step-4 keeps scaling with the viewport, and the
     headline ends up wrapping one word per line. Size it to the column it
     actually lives in. */
  @media (min-width: 64rem) {
    h1 {
      font-size: clamp(2.3rem, 1rem + 2.2vw, 3.3rem);
    }
  }

  .lede {
    margin-block: var(--space-md) var(--space-lg);
    font-size: var(--step-1);
    color: var(--text-secondary);
    max-width: 46ch;
  }

  .block {
    padding-block: var(--space-xl);
  }

  /* Sections are already full width, so a band only needs a background. The
     .shell inside keeps the content on the same measure as everything else, so
     the page gains rhythm without the columns drifting. */
  .band {
    background: var(--bg-panel);
    border-block: var(--hairline) solid var(--border);
  }

  .closer {
    padding-block: var(--space-2xl);
    text-align: center;
  }

  .closer .prose {
    margin-inline: auto;
  }

  .block h2 {
    font-size: var(--step-3);
    margin-bottom: var(--space-md);
  }

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

  .method a {
    color: inherit;
    text-decoration: underline;
    text-decoration-color: var(--gridline);
    text-underline-offset: 0.2em;
  }

  .method a:hover {
    color: var(--accent-text);
  }

  /* One hairline grid rather than twelve paragraphs floating in whitespace: the
     gap is the border colour showing through the cells, so they share their
     rules the way rox's own panels do and a short entry next to a long one
     stops reading as a misalignment. */
  .features {
    display: grid;
    gap: var(--hairline);
    background: var(--border);
    border: var(--hairline) solid var(--border);
  }

  /* The group rule. Same treatment as the benchmark table's header row, which
     is the other place on this page where a strip labels the thing under it. */
  .group {
    grid-column: 1 / -1;
    padding: 0.45rem var(--space-md);
    background: var(--bg-toolbar);
    color: var(--text-muted);
    font-size: var(--step--1);
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.08em;
  }

  .cell {
    display: flex;
    flex-direction: column;
    padding: var(--space-md);
    background: var(--bg-panel);
  }

  /* Explicit column counts, not auto-fit: auto-fit picks its own number, and a
     group of three can end up alone in a row of four at some width it chose. */
  @media (min-width: 34rem) {
    .features {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    /*
      Two columns against groups of three leaves a hole at the end of every
      group. The children repeat in fours (a heading, then its three cells), so
      the third cell of each group is every fourth child, and stretching it
      fills the row. This is the rule features.ts means when it says the groups
      have to stay three long.
    */
    .features > :nth-child(4n) {
      grid-column: 1 / -1;
    }
  }

  @media (min-width: 60rem) {
    .features {
      grid-template-columns: repeat(3, minmax(0, 1fr));
    }

    .features > :nth-child(4n) {
      grid-column: auto;
    }
  }

  /* Icon and title on one line, aligned at the top rather than centred, so a
     title that wraps to two lines keeps its mark against the first. */
  .head {
    display: flex;
    align-items: flex-start;
    gap: 0.55rem;
    margin-bottom: var(--space-xs);
    font-size: var(--step-1);
    line-height: 1.25;
  }

  .body {
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .more {
    margin-top: auto;
    padding-top: var(--space-md);
  }

  .more a {
    font-size: var(--step--1);
  }
</style>
