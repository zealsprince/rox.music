<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
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

  const TITLE = `A MusicBee alternative for Linux and macOS in ${YEAR}`
  const DESCRIPTION
    = 'MusicBee is Windows-only. rox is a native player for large local '
      + 'libraries on Linux, macOS and Windows, with deep tagging and a layout '
      + 'you compose yourself. Includes what MusicBee still does better.'
</script>

<Meta title="MusicBee alternative" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="MusicBee alternative"
/>

<section class="shell narrow intro">
  <h1>A MusicBee alternative that isn't Windows-only</h1>
  <p class="prose lede">
    MusicBee's problem, from a Linux or Mac machine, is that it's excellent and it isn't
    there. This page is about what actually transfers and what doesn't.
  </p>
  <DownloadButton release={data.release} />
</section>

<section class="shell narrow block">
  <h2>What MusicBee is good at</h2>
  <div class="prose">
    <p>
      Breadth. It manages a large library properly, handles auto-playlists and queue
      automation, syncs to portable devices, does podcasts and internet radio, converts
      formats, and skins into something you like looking at. It's free, it's polished, and
      for a lot of people it's the last music player they ever needed to install.
    </p>
    <p>
      It also runs on Windows and nowhere else. Wine gets you a version of it, with the
      usual caveat that it works until an update decides otherwise.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>What rox doesn't do</h2>
    <p class="prose intro-line">
      Taking this first, because it's the part that decides the question for a lot of
      people and burying it would waste your time.
    </p>
    <ul class="limits">
      <li><strong>No device sync.</strong> If you move music onto a phone or a DAP through your player, rox has no answer at all.</li>
      <li><strong>No podcasts or internet radio.</strong> rox plays files on your disk.</li>
      <li><strong>No format conversion.</strong> No transcoding, no converter, no on-sync re-encoding.</li>
      <li><strong>No auto-playlists.</strong> Rule-based playlists that maintain themselves aren't there.</li>
      <li><strong>No plugin API.</strong> Anything you'd have solved with an add-on has to already exist.</li>
    </ul>
    <p class="method">
      That's five real features and the list isn't padded to look honest. If two of them
      are part of how you use a player, stop here.
    </p>
  </div>
</section>

<section class="shell narrow block">
  <h2>What transfers, and what's better</h2>
  <div class="prose">
    <p>
      The library holds up at the size MusicBee users tend to have. A parallel scanner
      reads full tags, true durations and each file's own codec, sample rate and bit depth
      rather than skimming headers, and files with unreadable tags get indexed by filename
      instead of silently disappearing. Tag editing is a real editor with batch edits, a
      per-file grid, and a
      <a href="{base}/mp3tag-alternative">write path that copies and verifies</a> rather
      than modifying originals in place.
    </p>
    <p>
      The interface is the bigger difference. MusicBee gives you a good layout and some
      skinning; rox gives you forty panel types you arrange yourself, duplicate with their
      own configs, and pop out into real OS windows. A whole look is one file carrying
      layout, palette and appearance, which means the arrangement you settle on is
      something you can hand to someone else, or move to your other machine, rather than
      something that lives on one install.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>The size question</h2>
    <p class="prose">
      MusicBee isn't in this table, because the benchmarks were run on Linux where it
      doesn't run. It's here as the answer to "does the alternative fall over at my library
      size", measured on 50,000 tracks.
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
  <h2>The honest split</h2>
  <div class="prose">
    <p>
      Staying on Windows with a MusicBee setup that syncs your phone and maintains your
      auto-playlists? Nothing here replaces that, and switching would cost you two features
      rox has no version of.
    </p>
    <p>
      Moving to Linux or a Mac, or already there and looking at the gap MusicBee left?
      That's the whole reason this exists, and the trade is specific: you give up sync,
      podcasts and conversion, and you get a native player with deeper tagging, a layout
      you build yourself, and a library that stays quick at fifty thousand tracks.
    </p>
    <p class="aside">
      Popping a panel into its own OS window, or handing your entire layout to someone as a
      single file, aren't rows in a feature comparison because there's nothing on the other
      side to compare them to. If that's what you've been after, rox is where it is.
    </p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>Try it against your own library</h2>
    <p class="prose">
      Free and open source under the AGPL, no account and no installer. There's a
      <a href="{base}/foobar2000-alternative">Foobar2000 comparison</a> too, if that's the
      setup you're actually leaving.
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

  .limits strong {
    color: var(--text-bright);
    font-weight: 600;
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
