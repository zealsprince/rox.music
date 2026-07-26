<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import {
    BENCHMARK_FOOTNOTE_URL,
    BENCHMARK_METHOD,
    BENCHMARKS,
    loadedPct,
    memoryLabel,
    memoryPct,
  } from '$data/benchmarks'
  import { FEATURES } from '$data/features'
  import { SITE } from '$data/site'

  const { data }: { data: PageData } = $props()
</script>

<Meta title={SITE.name} description={SITE.description} />

<section class="hero shell">
  <div class="pitch">
    <h1>If Foobar2000 was made in the current year.</h1>
    <p class="lede">
      A desktop music player for people with large, carefully tagged local libraries.
      Panels you compose yourself, themes you can share, and a library that stays fast at
      tens of thousands of tracks. Native on Linux, macOS and Windows.
    </p>
    <DownloadButton release={data.release} />
  </div>

  <Screenshot
    id="hero"
    alt="rox running the NekoRoX-style default workspace, showing the library, cover art, queue and a spectrum panel"
    sizes="(min-width: 64rem) 60vw, 100vw"
    priority
  />
</section>

<section class="block band">
  <div class="shell">
    <h2>Under a second to a window</h2>
    <p class="prose">
      rox ships as one binary and starts before you have let go of the mouse. The numbers
      below are the same machine, the same 50,000-track library, and the same harness for
      every player.
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
  <ul class="features">
    {#each FEATURES as feature (feature.title)}
      <li>
        <h3>{feature.title}</h3>
        <p>{feature.body}</p>
      </li>
    {/each}
  </ul>
</section>

<section class="block band closer">
  <div class="shell">
    <h2>Make it yours</h2>
    <p class="prose">
      A workspace is a whole look in one shareable file: layout, palette, appearance. Five
      ship in the box, one click away on the welcome window.
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
    max-width: var(--measure);
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

  .features {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: var(--space-lg);
    grid-template-columns: repeat(auto-fit, minmax(min(100%, 17rem), 1fr));
  }

  .features h3 {
    font-size: var(--step-1);
    margin-bottom: var(--space-xs);
  }

  .features p {
    color: var(--text-secondary);
    font-size: var(--step--1);
  }
</style>
