<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { WORKSPACE_COUNT } from '$data/workspaces'

  const { data }: { data: PageData } = $props()

  const TITLE = 'NekoRoX, the foobar2000 theme, rebuilt native'
  const DESCRIPTION
    = 'NekoRoX was a CaTRoX fork for foobar2000: custom panels, synced lyrics, '
      + 'Discord presence, Last.fm tools. It\'s archived now, and rox is the '
      + 'native player its author built instead.'

  // Straight off the NekoRoX README, in its order, answered against what rox
  // actually ships. Two of them are misses and they stay in the list: someone
  // arriving from a decade of NekoRoX deserves to find that out here rather
  // than after the download.
  const CARRIED = [
    { had: 'Tree and filter based navigation', now: 'Folder Tree panel, plus a cascading Filter panel over artist, album, genre and year.', kept: true },
    { had: 'Mini and micro player modes', now: 'One mini layout per workspace, toggled from the transport, with its own window size.', kept: true },
    { had: 'Always on top', now: 'Nothing yet. The window is a normal window.', kept: false },
    { had: 'Rating and play count views', now: 'Five-star or ten-point ratings, written to POPM and FMPS, and a sortable plays column.', kept: true },
    { had: 'YouTube audio search and playback', now: 'Nothing. rox plays files off your disk.', kept: false },
    { had: 'Cover art viewer and cover flow', now: 'A Cover Art panel and an Album Carousel that scales and dims its neighbours toward the edges.', kept: true },
    { had: 'Real time synced lyrics', now: 'LRC sheets highlighted on the playhead, click a line to seek, fetched from lrclib.', kept: true },
    { had: 'Visualization and amplitude seek bar', now: 'A whole-track waveform you can scrub, an FFT spectrum, a VU meter.', kept: true },
    { had: 'Discord rich presence', now: 'Now playing, play state and elapsed time over Discord IPC.', kept: true },
    { had: 'Live biography lookup', now: 'Artist biography with fanart, tags, listener counts and similar artists.', kept: true },
    { had: 'Last.fm integration', now: 'Scrobbling, now-playing, hearts mirrored as loves, and a loved-tracks import.', kept: true },
  ]
</script>

<Meta title="NekoRoX" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="NekoRoX"
/>

<section class="shell narrow intro">
  <h1>NekoRoX, the foobar2000 theme, and where it went</h1>
  <p class="prose lede">
    NekoRoX was a foobar2000 theme: a fork of CaTRoX with a decade of panels, plugins and
    fixes piled on top. I maintained it as
    <a href="https://github.com/catlinman" rel="noreferrer">catlinman</a> until it stopped
    being maintainable. rox is what I built instead, and its default look is that layout
    rebuilt from scratch.
  </p>

  <div class="shot portrait">
    <Screenshot
      id="nekorox"
      alt="The NekoRoX foobar2000 theme: a dark layout with INF, BIO, LYR, ART and LIB tabs, a cover art wall on the left, album-grouped tracks with star ratings on the right, and an amber waveform with a spectrum analyzer across the bottom."
      sizes="(min-width: 640px) 560px, calc(100vw - 2.5rem)"
    />
    <p class="caption">NekoRoX running in foobar2000, on Windows, in 2022.</p>
  </div>
</section>

<section class="shell narrow block">
  <h2>What NekoRoX was</h2>
  <div class="prose">
    <p>
      A ready-made foobar2000 setup you unzipped into <code>%appdata%</code> and had a
      finished player. Dark, dense, tabs for info, biography, lyrics, art and library, a
      cover wall down one side, album-grouped tracks with rating dots, and an amber
      waveform along the bottom with a spectrum under it. Underneath were Columns UI, a
      pile of JScript panels, an <code>.fcl</code> layout file and a fonts folder you had
      to install by hand.
    </p>
    <p>
      It started as <a href="{base}/catrox">CaTRoX</a>, eXtremeHunter1972's theme, later
      carried forward by TheQwertiest. NekoRoX added tree and filter navigation, mini
      player modes, a synced lyric panel, a cover flow, Discord presence and Last.fm
      tools, and merged a lot of TheQwertiest's work back in as it went. None of the
      underlying scripts were mine and the README has always said so.
    </p>
  </div>

  <div class="credit">
    <Callout label="Where to find it">
      <p>
        The repository is still up at
        <a href="https://github.com/catlinman/foobar2000" rel="noreferrer">
          github.com/catlinman/foobar2000
        </a> and the files still work. It's unmaintained, it's Windows only, and several
        of the components it depends on have gone stale or vanished from their original
        hosts. If you want to run it, run it. Just know nobody is fixing it.
      </p>
    </Callout>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>AlphaRoX, the light one</h2>
    <div class="prose">
      <p>
        Same theme with the palette inverted, published under this account as
        <a href="https://github.com/zealsprince/foobar2000" rel="noreferrer">AlphaRoX</a>.
        It's a fork of NekoRoX, which is a fork of CaTRoX, which tells you most of what
        was wrong with distributing a look this way. Same state as NekoRoX now: up,
        working, unmaintained.
      </p>
    </div>

    <div class="shot portrait">
      <Screenshot
        id="alpharox"
        alt="The AlphaRoX foobar2000 theme: the light counterpart to NekoRoX, with a white background, a cover art wall on the left, album-grouped tracks with star ratings, and a blue waveform and spectrum analyzer across the bottom."
        sizes="(min-width: 640px) 560px, calc(100vw - 2.5rem)"
        lightSource
      />
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>Why it stopped</h2>
  <div class="prose">
    <p>
      I moved to Linux full time, which meant the whole assembly went through Wine. It
      ran. It also rendered Internet Explorer inside panels, and a stack held together by
      stacked workarounds does not enjoy a translation layer. Every foobar2000 update, and
      every Wine update, was a coin flip on a decade of configuration.
    </p>
    <p>
      The deeper problem was the format. A NekoRoX install isn't a file, it's a component
      list, an install order and a set of paths that only reassemble on the machine they
      were built on. That's why the README told people to copy four directories into two
      different places. Sharing a look shouldn't take a page of instructions.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>What rox does with it</h2>
    <div class="prose">
      <p>
        rox is a native player written in Rust, on Linux, macOS and Windows, with no
        foobar2000 and no Wine underneath it. Its default workspace is the NekoRoX layout
        rebuilt out of native panels, which is why the two shots look related. There's a
        <a href="{base}/catrox">CaTRoX workspace</a> in the box too, along with four
        others.
      </p>
    </div>

    <div class="shot">
      <Screenshot
        id="default"
        alt="The default rox workspace, a native reconstruction of the NekoRoX layout: a cover art grid beside a playlist with star ratings, an amber waveform seek bar along the bottom, and tabs for biography, lyrics and metadata."
        sizes="(min-width: 827px) 787px, calc(100vw - 2.5rem)"
      />
    </div>

    <h3>The feature list, line by line</h3>
    <ul class="carried">
      {#each CARRIED as row (row.had)}
        <li class:gone={!row.kept}>
          <span class="had">{row.had}</span>
          <span class="now">{row.now}</span>
        </li>
      {/each}
    </ul>

    <p class="prose after-list">
      The thing NekoRoX couldn't do is the one I care about most. In rox a whole look is a
      single file carrying layout, palette and appearance together, so you hand someone a
      workspace and they have your setup. No component list, no install order, no fonts
      directory.
    </p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>Get rox</h2>
  <p class="prose">
    Free, open source, one binary per platform. The
    <a href="{base}/workspaces">workspaces page</a> shows the {WORKSPACE_COUNT} shipped looks, and the
    <a href="{base}/foobar2000-alternative">foobar2000 comparison</a> covers where
    foobar2000 is still ahead.
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

  .block h3 {
    font-size: var(--step-1);
    margin-block: var(--space-xl) var(--space-md);
  }

  .shot {
    margin-top: var(--space-lg);
  }

  /* Both foobar2000 shots are taller than they are wide. At the full reading
     measure they'd run past a laptop viewport on their own, so they get capped
     and centred instead. */
  .portrait {
    max-width: 560px;
    margin-inline: auto;
  }

  .caption {
    margin-top: var(--space-sm);
    font-size: var(--step--1);
    color: var(--text-muted);
    text-align: center;
  }

  .credit {
    margin-top: var(--space-lg);
  }

  .carried {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: var(--space-md);
  }

  .carried li {
    display: grid;
    gap: 0.2rem;
  }

  .had {
    font-size: var(--step--1);
    color: var(--text-muted);
  }

  .now {
    color: var(--text-secondary);
  }

  /*
    The two misses read differently from the nine hits without needing a word to
    say so. Struck through, because that's what happened to them.
  */
  .gone .had {
    text-decoration: line-through;
  }

  .gone .now {
    color: var(--text-muted);
  }

  .after-list {
    margin-top: var(--space-lg);
  }

  .closer .prose {
    margin-bottom: var(--space-lg);
  }
</style>
