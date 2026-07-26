<script lang="ts">
  import type { PageData } from './$types'
  import Meta from '$components/Meta.svelte'
  import PlatformIcon from '$components/PlatformIcon.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { PLATFORMS } from '$data/platforms'
  import { SITE } from '$data/site'
  import { Download } from '@lucide/svelte'

  const { data }: { data: PageData } = $props()

  const assetFor = (id: string) => data.release.assets.find(a => a.platform === id)

  const mb = (bytes: number): string => `${(bytes / 1024 / 1024).toFixed(1)} MB`

  const published = $derived(
    new Intl.DateTimeFormat('en', {
      dateStyle: 'long',
      timeZone: 'UTC',
    }).format(new Date(data.release.publishedAt)),
  )
</script>

<Meta
  title="Download"
  fullTitle="Download rox for Linux, macOS or Windows"
  description="Download rox free for Linux, macOS or Windows. One binary per platform, no installer and no account. Open source under the AGPL."
  image="/social/download.png"
  imageAlt="The rox logo above the words: download for Linux, macOS and Windows"
/>
<StructuredData release={data.release} />

<section class="shell intro">
  <h1>Download rox</h1>
  <p class="prose lede">
    One binary per platform. No installer, no account, nothing running in the background
    when it's closed.
  </p>
  <p class="version">
    <strong>v{data.release.version}</strong>
    <span>released {published}</span>
    <a href={data.release.url} rel="noreferrer">release notes</a>
  </p>
</section>

<div class="shell cards">
  {#each PLATFORMS as platform (platform.id)}
    {@const asset = assetFor(platform.id)}
    <article data-platform-card={platform.id}>
      <h2>
        <PlatformIcon platform={platform.id} size={22} />
        {platform.label}
      </h2>

      {#if asset}
        <a class="get plain" href={asset.url}>
          <Download size={17} strokeWidth={2} aria-hidden="true" />
          Download
          <span class="size">{mb(asset.size)}</span>
        </a>
        <p class="filename"><code>{asset.name}</code></p>
      {:else}
        <p class="missing">
          No {platform.label} build in this release.
          <a href={SITE.releases} rel="noreferrer">Check the releases page</a>.
        </p>
      {/if}

      <ol>
        {#each platform.steps as step (step)}
          <li>{step}</li>
        {/each}
      </ol>

      {#if platform.caveat}
        <p class="caveat">{platform.caveat}</p>
      {/if}
    </article>
  {/each}
</div>

<section class="shell block">
  <h2>Running it from a terminal</h2>
  <div class="prose">
    <p>
      Pass rox files or folders and it plays them now, replacing what's loaded. Folders
      expand to the audio files directly inside them.
    </p>
    <pre><code>rox ~/music/albums/loveless
rox --enqueue track.flac
rox --portable</code></pre>
    <p>
      <code>--enqueue</code> (or <code>-e</code>) appends to the up-next queue instead of
      playing. <code>--portable</code> keeps the library, settings and caches in a
      <code>rox-data</code> folder beside the executable for that run. To stay portable
      across launches, drop an empty file named <code>portable</code> next to the
      executable, or flip the toggle in the Behavior settings.
    </p>
  </div>
</section>

<section class="shell block">
  <h2>Building it yourself</h2>
  <div class="prose">
    <p>
      With Nix, <code>nix develop</code> then
      <code>cargo run</code> gets you a dev shell carrying the Rust toolchain and the
      libraries gpui loads at runtime. Without Nix you need stable Rust and gpui's system
      libraries from your distro. The
      <a href="{SITE.repo}#development" rel="noreferrer">development section of the README</a>
      has the full list.
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
    margin-top: var(--space-md);
    font-size: var(--step-1);
    color: var(--text-secondary);
  }

  .version {
    margin-top: var(--space-md);
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-sm);
    align-items: baseline;
    font-size: var(--step--1);
    color: var(--text-muted);
  }

  .version strong {
    color: var(--text-bright);
    font-variant-numeric: tabular-nums;
  }

  .cards {
    display: grid;
    gap: var(--space-md);
    grid-template-columns: repeat(auto-fit, minmax(min(100%, 18rem), 1fr));
  }

  article {
    display: flex;
    flex-direction: column;
    gap: var(--space-sm);
    background: var(--bg-panel);
    border: var(--hairline) solid var(--border);
    padding: var(--space-md);
  }

  /* enhance.js puts the detected OS on the root, and the matching card lifts. */
  :global(html[data-platform='linux']) article[data-platform-card='linux'],
  :global(html[data-platform='macos']) article[data-platform-card='macos'],
  :global(html[data-platform='windows']) article[data-platform-card='windows'] {
    border-color: var(--accent);
    background: color-mix(in srgb, var(--accent) 7%, var(--bg-panel));
  }

  h2 {
    display: flex;
    align-items: center;
    gap: 0.55rem;
    font-size: var(--step-1);
  }

  /* The card is the detected platform: its mark takes the accent too. */
  :global(html[data-platform='linux']) article[data-platform-card='linux'] :global(.wrap),
  :global(html[data-platform='macos']) article[data-platform-card='macos'] :global(.wrap),
  :global(html[data-platform='windows'])
    article[data-platform-card='windows']
    :global(.wrap) {
    color: var(--accent-text);
  }

  .get {
    display: flex;
    align-items: center;
    gap: var(--space-sm);
    background: var(--accent);
    color: var(--text-on-accent);
    font-weight: 600;
    padding: 0.6em 1em;
    border-radius: var(--radius);
  }

  .get:hover {
    background: var(--accent-hover);
    color: var(--text-on-accent);
  }

  .size {
    /* Icon and label sit left, the size pushes to the right edge. */
    margin-left: auto;
    font-size: var(--step--1);
    font-weight: 500;
    font-variant-numeric: tabular-nums;
    opacity: 0.75;
  }

  .filename code {
    font-size: 0.75rem;
    color: var(--text-muted);
    background: none;
    border: 0;
    padding: 0;
    overflow-wrap: anywhere;
  }

  ol {
    margin: 0;
    padding-left: 1.2rem;
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .caveat,
  .missing {
    margin-top: auto;
    padding-top: var(--space-sm);
    border-top: var(--hairline) solid var(--border);
    color: var(--text-faint);
    font-size: var(--step--1);
  }

  /* Side by side, each card's sections should sit on the same rows: one line
     for the buttons, one for the filenames, one for the steps, one for the
     caveats. Subgrid shares the row tracks across cards, and cards that wrap
     to their own line get their own tracks, so mobile is unaffected. Kept
     after the base rules above, since the margin-top reset ties on
     specificity and has to win on order. */
  @supports (grid-template-rows: subgrid) {
    article {
      display: grid;
      grid-template-rows: subgrid;
      grid-row: span 5;
      row-gap: var(--space-sm);
    }

    .missing {
      /* Stands in for the button and filename rows when a build is absent. */
      grid-row: span 2;
    }

    .caveat,
    .missing {
      /* The flex bottom-pinning would float short caveats off their shared
         row and misalign the rules. The track already puts them level. */
      margin-top: 0;
    }
  }

  .block {
    padding-block: var(--space-xl) 0;
  }

  .block h2 {
    font-size: var(--step-2);
    margin-bottom: var(--space-md);
  }
</style>
