<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import {
    BENCHMARK_METHOD,
    BENCHMARKS,
    loadedPct,
    memoryLabel,
    memoryPct,
  } from '$data/benchmarks'
  import { YEAR } from '$data/site'

  const { data }: { data: PageData } = $props()

  // The year lives here and in the h1, never in the path. deploy.yml rebuilds
  // daily, so both re-date themselves and the URL keeps working forever.
  const TITLE = `The best music player for a local library in ${YEAR}`
  const DESCRIPTION
    = 'Streaming apps and library players are judged on different things. Five '
      + 'criteria that actually separate desktop music players once your '
      + 'collection is real, measured on 50,000 tracks.'

  const CRITERIA = [
    {
      title: 'It has to survive the size of your library',
      body: 'Most players are demoed on a few hundred albums. The interesting failures start in the tens of thousands, where scanning takes an evening, scrolling stutters, and memory climbs until something gives. This is the one criterion you cannot evaluate from a screenshot, and it is the one that decides whether you are still using the thing in a year.',
    },
    {
      title: 'It has to read your tags properly',
      body: 'A header skim gets you a track name and a wrong duration. Reading deep means full tags, true durations, and each file\'s own codec, sample rate and bit depth. It also means files with broken tags get indexed rather than silently dropped, because a library that quietly loses 300 files is worse than one that admits it.',
    },
    {
      title: 'It has to let you write tags back',
      body: 'A collection that has been curated is a collection that gets edited. Batch edits, atomic writes so a crash does not truncate a file, and ratings stored in the files themselves rather than in a database you cannot take with you.',
    },
    {
      title: 'The layout has to be yours',
      body: 'Preference here is genuinely personal, which is the argument for composition over a good default. Panels you arrange, duplicate with their own configs, and pop out into real windows beat any single layout somebody else picked.',
    },
    {
      title: 'It has to be yours to keep',
      body: 'Local libraries are what people fall back to when a service removes an album or changes its terms. A player that answers that with an account, telemetry or a subscription has missed the point of the thing it is playing.',
    },
  ]
</script>

<Meta
  title="Best music player"
  fullTitle={TITLE}
  description={DESCRIPTION}
/>
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="Best music player"
/>

<section class="shell narrow intro">
  <h1>The best music player for a local library in {YEAR}</h1>
  <p class="prose lede">
    Not the best music app. Those are streaming clients and they're judged on catalog and
    price. This is about the smaller question: which desktop player holds up when the
    music is already on your disk and there's a lot of it.
  </p>

  <!-- Kept in the intro rather than given a section of its own. A disclosure
       belongs where the reader decides how to weigh the page, which is before
       the first criterion, not floating in whitespace between two headings. -->
  <div class="disclosure">
    <Callout label="Disclosure">
      <p>
        rox is one of the players in this comparison and this is its own site, so read the
        criteria first and the numbers second. All five hold whether or not you end up
        downloading anything.
      </p>
    </Callout>
  </div>
</section>

<section class="shell narrow block">
  <h2>Five things that actually separate them</h2>
  <ol class="criteria">
    {#each CRITERIA as item (item.title)}
      <li>
        <h3>{item.title}</h3>
        <p>{item.body}</p>
      </li>
    {/each}
  </ol>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>What the first one looks like measured</h2>
    <p class="prose">
      Seven players, one 50,000-track library, one machine, one harness. Startup and idle
      cost are the parts you feel every single day.
    </p>

    <div class="table-scroll">
      <table>
        <caption class="visually-hidden">
          Startup, memory and idle CPU across seven music players on one 50,000-track
          library
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

    <p class="method">{BENCHMARK_METHOD}</p>
  </div>
</section>

<section class="shell narrow block">
  <h2>The honest shortlist</h2>
  <div class="prose">
    <p>
      If you're on Windows and already run
      <a href="{base}/foobar2000-alternative">Foobar2000</a>, you have the answer and have
      had it for twenty years. Nothing on this page beats a working Foobar2000 setup on its
      own platform.
    </p>
    <p>
      If you want something with a large plugin ecosystem and a long track record on Linux,
      Quod Libet and Strawberry are both real answers, and both are slower to load a
      library this size than they are pleasant to use once loaded. If the tagging criterion
      is the one you actually care about, that's written up on its own as an
      <a href="{base}/mp3tag-alternative">Mp3tag alternative</a>, and the loudness side of
      criterion one is covered under <a href="{base}/replaygain">ReplayGain</a>.
    </p>
    <p>
      rox is the answer if you want the Foobar2000 shape natively on Linux or macOS: panels
      you compose, deep tagging, themes as single shareable files, and a player that gets a
      window up in under a second against a library this size. It's new, and it has no
      plugin API. Both of those are real costs.
    </p>
    <!-- Different examples from the ones the platform pages and the Foobar2000
         comparison use, on purpose. These two are the library-ownership
         argument, which is the one this page is actually about. -->
    <p class="aside">
      The five criteria above are the floor, not the ceiling. Ratings go into the files
      themselves through FMPS and POPM rather than a database you can't take with you, and
      multi-value genres merge as a library opinion instead of a rewrite of your tags. If
      that's the kind of thing you've been wanting out of a library, this is the one to
      point at your disk.
    </p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>Measure it against your own collection</h2>
    <p class="prose">
      The benchmark that matters is the one on your disk. Free and open source, no account,
      no installer.
    </p>
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
