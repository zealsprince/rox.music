<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { SITE, YEAR } from '$data/site'

  const { data }: { data: PageData } = $props()

  const TITLE = `A Foobar2000 alternative for Linux, macOS and Windows in ${YEAR}`
  const DESCRIPTION
    = 'Foobar2000 got panel layouts, deep tagging and a theme community right, '
      + 'and stranded most of it on Windows. rox is a native, open source player '
      + 'that carries all three to Linux and macOS.'

  // Rows are claims about both players, so each one has to survive being read
  // by someone who uses Foobar2000 daily. Where it still wins, the row says so.
  const ROWS = [
    {
      area: 'Native on Linux',
      fb: 'No official build. Wine only.',
      rox: 'First-class, x86_64.',
      win: 'rox',
    },
    {
      area: 'Native on macOS',
      fb: 'Official build since v2.',
      rox: 'First-class, Apple Silicon.',
      win: 'even',
    },
    {
      area: 'Native on Windows',
      fb: 'Its home. Twenty-plus years of it.',
      rox: 'First-class, x86_64.',
      win: 'even',
    },
    {
      area: 'Panels you compose',
      fb: 'Yes, through Columns UI and friends.',
      rox: 'Forty panel types, built in, no components to install.',
      win: 'even',
    },
    {
      area: 'Sharing a look',
      fb: 'A skin is components, configs and scripts. Famously fiddly.',
      rox: 'One file carrying layout, palette and appearance.',
      win: 'rox',
    },
    {
      area: 'Source available',
      fb: 'Closed source freeware.',
      rox: 'AGPL-3.0, all of it.',
      win: 'rox',
    },
    {
      area: 'Component ecosystem',
      fb: 'Two decades deep. Anything you can think of.',
      rox: 'No plugin API.',
      win: 'foobar2000',
    },
    {
      area: 'Maturity',
      fb: 'Since 2002. It does not surprise you.',
      rox: 'Since 2026. It will, occasionally.',
      win: 'foobar2000',
    },
    {
      area: 'Footprint',
      fb: 'Famously tiny.',
      rox: 'One 62 MB binary, 134 MB resident at 50k tracks.',
      win: 'foobar2000',
    },
  ]
</script>

<Meta
  title="Foobar2000 alternative"
  fullTitle={TITLE}
  description={DESCRIPTION}
/>
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="Foobar2000 alternative"
/>

<section class="shell narrow intro">
  <h1>A Foobar2000 alternative that runs everywhere</h1>
  <p class="prose lede">
    Foobar2000 got three things right that almost nothing else does at once, and stranded
    two of them on Windows. rox is the attempt to carry all three across.
  </p>
  <DownloadButton release={data.release} />
</section>

<section class="shell narrow block">
  <h2>What Foobar2000 got right</h2>
  <div class="prose">
    <p>
      A UI you assemble out of panels instead of accepting whatever the developer shipped.
      A theme community on top of that, which is how CaTRoX,
      <a href="{base}/nekorox">NekoRoX</a> and Georgia exist at all. And tag and library
      management that doesn't fall over when the collection is tens of thousands of files
      deep.
    </p>
    <p>
      Plenty of players do one. Very few do two. The stack that does all three has been
      effectively Windows-only for twenty years, and every attempt to move it has meant
      giving one of them up.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Where it leaves you</h2>
    <div class="prose">
      <p>
        On Linux there's no official Foobar2000 build, so the honest options are Wine or
        something else. Wine works right up until it doesn't. A skin like CaTRoX leans on
        stacked workarounds and, in places, Internet Explorer rendering inside panels, and
        running that through a translation layer surfaces exactly how much is held together
        by luck. It's one OS update from breaking, every time.
      </p>
      <p>
        macOS is better than it used to be, since Foobar2000 v2 ships a real Mac build. But
        the part people actually want, the component and skin ecosystem that made the
        Windows version worth configuring for a weekend, is Windows-side. You get the
        player without the reason you wanted the player.
      </p>
      <p>
        And on Windows itself, nothing is wrong. That's worth saying plainly: if you're on
        Windows and your Foobar2000 setup works, rox is not an emergency.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>What rox does about it</h2>
  <div class="prose">
    <p>
      Native on all three platforms, one binary each, written in Rust on
      <a href="https://gpui.rs" rel="noreferrer">gpui</a>. Forty panel types you arrange
      yourself, duplicate with independent configs, and pop out into real OS windows. The
      library scanner reads full tags, true durations and each file's own codec, sample
      rate and bit depth rather than skimming headers, and it holds up at 50,000 tracks.
    </p>
    <p>
      The theming answer is the part that changed most. A workspace is a single file
      carrying layout, palette and appearance together. You edit it, you break it, you hand
      it to someone else and they get exactly what you had. One of the six in the box is a
      <a href="{base}/catrox">CaTRoX recreation</a>, which is the honest statement of
      intent.
    </p>
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
      alt="The CaTRoX workspace in rox: the foobar2000 skin recreated natively, with a circular CD render of the cover, a metadata field list down the left and album-grouped tracks with rating dots."
      sizes="(min-width: 827px) 787px, calc(100vw - 2.5rem)"
    />
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Side by side</h2>
    <div class="table-scroll">
      <table>
        <caption class="visually-hidden">
          Foobar2000 and rox compared across platform support, theming, licensing and
          maturity
        </caption>
        <thead>
          <tr>
            <th scope="col">Area</th>
            <th scope="col">Foobar2000</th>
            <th scope="col">rox</th>
          </tr>
        </thead>
        <tbody>
          {#each ROWS as row (row.area)}
            <tr>
              <th scope="row">{row.area}</th>
              <td class:loses={row.win === 'rox'}>{row.fb}</td>
              <td class:loses={row.win === 'foobar2000'}>{row.rox}</td>
            </tr>
          {/each}
        </tbody>
      </table>
    </div>
    <p class="method">
      Three rows go to Foobar2000, and they're the three that would take years to close.
      A comparison table where one column wins everything is an advert, not a comparison.
    </p>
  </div>
</section>

<section class="shell narrow block">
  <h2>Who should not switch</h2>
  <div class="prose">
    <p>
      If you're on Windows, your components are configured, and the setup has been stable
      for a decade, there is nothing here worth the disruption. If you depend on a specific
      Foobar2000 component, rox has no plugin API and can't replace it. If you want
      software that has already made all its mistakes, rox is four years too young.
    </p>
    <p>
      If you moved to Linux and left the setup behind, or you're on a Mac holding a player
      without the ecosystem that justified it, that's the gap this was built in.
    </p>
    <!-- The counterweight to the three rows Foobar2000 wins. Not a walk-back:
         the concessions above stay exactly as strong. Arriving late is a real
         cost and it buys a real thing, and a comparison that only prices the
         cost is as lopsided as one that only prices the win. -->
    <p>
      The other side of arriving late is worth stating. Nothing in rox has to stay
      compatible with a decision made in 2002, which is how a whole look ends up as one
      shareable file instead of a component graph, how one codebase covers all three
      platforms, and how forty panel types ship in the box rather than getting assembled
      one download at a time. It's also why track identity was never tied to file paths,
      which is the thing that makes merging a local library with anything else possible
      later. Most of that 62 MB is the same story.
    </p>
    <!-- Deliberately last. Three paragraphs of concession have to land before a
         line like this reads as a fact rather than as the sales pitch the
         reader was bracing for. The two examples are picked because they have
         no counterpart to name, so it stays a claim about what rox does rather
         than a guess about what twenty years of components can't. -->
    <p class="aside">
      Panels that pop out into real OS windows, or a palette that retints itself from
      whatever cover is playing, never made the table above. There was nothing to put in
      the other column. If differences like that are what you're after, rox is the place
      to be.
    </p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>Try it against your own library</h2>
    <p class="prose">
      Free, open source under the AGPL, no account and no installer. Point it at the
      collection that breaks other players.
    </p>
    <DownloadButton release={data.release} />
    <p class="prose fine">
      Or read the <a href={SITE.repo} rel="noreferrer">source</a> first. That's a
      reasonable way to evaluate a player that wants your tag write access. Still weighing
      it up? The
      <a href="{base}/best-music-player">criteria that separate library players</a> are
      written out separately, benchmarks included.
    </p>
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
