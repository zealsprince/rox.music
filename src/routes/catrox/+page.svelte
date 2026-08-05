<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'

  const { data }: { data: PageData } = $props()

  const TITLE = 'CaTRoX, rebuilt as a native player'
  const DESCRIPTION
    = 'The CaTRoX foobar2000 theme, who built it, and what it took to get that '
      + 'look running natively on Linux and macOS without Windows or Wine '
      + 'underneath it.'
</script>

<Meta title="CaTRoX" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="CaTRoX"
/>

<section class="shell narrow intro">
  <h1>CaTRoX, without Windows underneath it</h1>
  <p class="prose lede">
    rox ships a CaTRoX workspace in the box. This is the page about why, and about the
    people whose work it's standing on.
  </p>

  <!--
    Attribution above the fold, not in a footnote. The whole page trades on a
    name other people made, and burying the credit under the pitch would be the
    version of this that deserves the criticism.
  -->
  <div class="credit">
    <Callout label="Credit where it belongs">
      <p>
        CaTRoX is a foobar2000 theme. The original design and colour scheme are
        eXtremeHunter1972's, and the edition most people have actually run is
        <a href="https://theqwertiest.github.io/CaTRoX_QWR/" rel="noreferrer">
          CaTRoX_QWR
        </a>, rebuilt and maintained by TheQwertiest. rox is not affiliated with either,
        and nothing here is their code. The workspace below is a recreation of a look
        they made.
      </p>
    </Callout>
  </div>
</section>

<section class="shell narrow block">
  <h2>What CaTRoX was</h2>
  <div class="prose">
    <p>
      A dense, dark, information-first layout for foobar2000: cover art rendered as a CD,
      a metadata field list down one side, album-grouped tracks with rating dots, and a
      menubar exactly where a menubar goes. It's the thing people mean when they say
      foobar2000 can look good, and it's most of the reason anyone put up with configuring
      foobar2000 in the first place.
    </p>
    <p>
      It was never a skin in the sense a music player usually means. CaTRoX is a stack of
      components, panel scripts and configuration, assembled. That's what made it powerful,
      and it's also what makes it hard to move, hard to share, and easy to break.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Where NekoRoX came in</h2>
    <div class="prose">
      <p>
        rox's author ran a fork of it for years.
        <a href="https://github.com/catlinman/foobar2000" rel="noreferrer">NekoRoX</a> was
        CaTRoX with a pile of custom panels, plugins and quality-of-life modules on top:
        tree and filter navigation, mini and micro player modes, a synced lyric panel, a
        cover flow, Discord presence, Last.fm tools. It has a note at the top of its README
        now saying it's no longer maintained, and pointing here.
      </p>
      <p>
        The reason for that note is the honest content of this page. Moving to Linux full
        time meant running the whole assembly through Wine, and a stack held together by
        stacked workarounds, in places rendering Internet Explorer inside panels, does not
        take kindly to a translation layer. It ran. It also felt one update away from
        stopping, permanently, with a decade of configuration inside it.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>The recreation</h2>
  <div class="prose">
    <p>
      The CaTRoX workspace in rox is that layout rebuilt out of native panels: the circular
      cover render, the metadata field list, the album-grouped track list with its rating
      dots, the menubar. It's a look, reproduced, not a port of anything. None of
      CaTRoX's code exists in rox and none of it could, since rox is Rust on
      <a href="https://gpui.rs" rel="noreferrer">gpui</a> and CaTRoX is panel scripts
      running inside foobar2000. The wider argument with foobar2000, including the rows
      where it's still ahead, is on
      <a href="{base}/foobar2000-alternative">its own page</a>.
    </p>
  </div>

  <!--
    `sizes` matches the reading column measured at 787px; see the comparison
    page for the derivation.
  -->
  <div class="shot">
    <Screenshot
      id="catrox"
      alt="The CaTRoX workspace in rox: a circular CD render of the cover art, a metadata field list down the left with title, artist, album, codec and bitrate, and album-grouped tracks with rating dots on the right."
      sizes="(min-width: 827px) 787px, calc(100vw - 2.5rem)"
    />
  </div>

  <div class="prose after-shot">
    <p>
      The part that changed is what it takes to have it. In rox a whole look is a single
      file holding layout, palette and appearance together, so the CaTRoX workspace is one
      click on the welcome window, and the thing you build from it is one file you can hand
      to someone else. No component list, no install order, no configuration that only
      reassembles on the machine it was built on.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>What you don't get back</h2>
    <ul class="limits">
      <li>
        Not every CaTRoX panel has an equivalent. rox has forty panel types and they're
        not the same forty.
      </li>
      <li>
        No YouTube playback. CaTRoX and NekoRoX both had it through components; rox plays
        what's on your disk.
      </li>
      <li>
        No plugin API, so anything you'd have solved with a foobar2000 component has to
        already exist in rox or not exist at all.
      </li>
      <li>
        It's a recreation working from the outside. Details differ, and a pixel-exact
        match was never the goal.
      </li>
    </ul>
    <p class="aside">
      What you get instead is a layout that opens on Linux and macOS without Wine anywhere
      near it, survives an OS update, and travels as one file. After a decade of
      maintaining the original, that trade is the entire reason rox exists.
    </p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>Try it</h2>
  <p class="prose">
    The CaTRoX workspace ships in the box, one click away on the welcome window. Five
    others do too, including a
    <a href="{base}/workspaces">Foobar layout and a WinAmp-shaped one</a>.
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
