<script lang="ts">
  import type { Platform } from '$types/release'
  import type { PageData } from './$types'
  import Meta from '$components/Meta.svelte'
  import PlatformIcon from '$components/PlatformIcon.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { PACKAGES } from '$data/packages'
  import { PLATFORMS } from '$data/platforms'
  import { i18n } from '$lib/i18n/context'
  import { Download } from '@lucide/svelte'

  const { data }: { data: PageData } = $props()

  const { t, info } = i18n()

  // Shared between the meta description and the WebPage node, so the two can't
  // drift into describing the same URL two different ways.
  const TITLE = t('download-title')
  const DESCRIPTION = t('download-title.description')

  const assetFor = (id: string) => data.release.assets.find(a => a.platform === id)
  const altFor = (id: string) => data.release.alts.find(a => a.platform === id)

  // The card's buttons in display order: the lead artifact takes the accent,
  // the rest render as outlined alternatives. Windows leads with the installer
  // while the zip stays the canonical asset the hero button hands out.
  const buttonsFor = (platform: Platform) => {
    const asset = assetFor(platform.id)
    if (!asset)
      return []
    const main = { ...asset, label: platform.cta ?? 'nav-download' }
    const alt = platform.alt ? altFor(platform.id) : undefined
    if (!platform.alt || !alt)
      return [main]
    const second = { ...alt, label: platform.alt.key }
    return platform.alt.lead ? [second, main] : [main, second]
  }

  const mb = (bytes: number): string =>
    `${new Intl.NumberFormat(info.htmlLang, { maximumFractionDigits: 1 })
      .format(bytes / 1024 / 1024)} MB`

  // The long form, in the reader's language and in the reader's order: "8
  // February 2026" and "8. Februar 2026" are the same date and neither is a
  // format the other one parses.
  const published = $derived(
    new Intl.DateTimeFormat(info.htmlLang, {
      dateStyle: 'long',
      timeZone: 'UTC',
    }).format(new Date(data.release.publishedAt)),
  )
</script>

<Meta
  title={t('nav-download')}
  fullTitle={TITLE}
  description={DESCRIPTION}
  image="/social/download.png"
  imageAlt={t('download-title.image-alt')}
/>
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  image="/social/download.png"
  breadcrumb={t('nav-download')}
/>

<section class="shell intro">
  <h1>{t('download-h1')}</h1>
  <p class="prose lede">{t('download-h1.lede')}</p>
  <p class="version">
    <strong>v{data.release.version}</strong>
    <span>{t('download-released', { date: published })}</span>
    <a href={data.release.url} rel="noreferrer">{t('download-notes')}</a>
  </p>
</section>

<div class="shell cards">
  {#each PLATFORMS as platform (platform.id)}
    {@const buttons = buttonsFor(platform)}
    <article data-platform-card={platform.id}>
      <h2>
        <PlatformIcon platform={platform.id} size={22} />
        {platform.label}
      </h2>

      {#if buttons.length > 0}
        <!--
          The buttons share one wrapper: the subgrid below spans a fixed five
          rows per card, and a sixth child on only some cards would knock the
          rows out of line.
        -->
        <div class="gets">
          {#each buttons as button, index (button.url)}
            <a class="get plain" class:secondary={index > 0} href={button.url}>
              <Download size={17} strokeWidth={2} aria-hidden="true" />
              {t(button.label)}
              <span class="size">{mb(button.size)}</span>
            </a>
          {/each}
        </div>
        <p class="filename">
          {#each buttons as button (button.url)}
            <code>{button.name}</code>
          {/each}
        </p>
      {:else}
        <p class="missing">
          <Rich key="download-missing" args={{ platform: platform.label }} />
        </p>
      {/if}

      <ol>
        {#each platform.steps as step (step)}
          <li><Rich key={step} /></li>
        {/each}
      </ol>

      {#if platform.caveat}
        <p class="caveat">{t(platform.caveat)}</p>
      {/if}
    </article>
  {/each}
</div>

<section id="packages" class="shell block">
  <h2>{t('download-packages')}</h2>
  <p class="prose">{t('download-packages.body')}</p>

  <div class="packages">
    {#each PACKAGES as pkg (pkg.id)}
      <article>
        <h3>{pkg.name} <span class="scope">{t(`${pkg.key}.scope`)}</span></h3>
        <pre><code>{pkg.commands.join('\n')}</code></pre>
        <p><Rich key="{pkg.key}.body" /></p>
        {#if pkg.caveat}
          <p class="caveat">{t(`${pkg.key}.caveat`)}</p>
        {/if}
        <p class="more">
          <a href={pkg.href} rel="noreferrer">{t(`${pkg.key}.link`)}</a>
        </p>
      </article>
    {/each}
  </div>
</section>

<section class="shell block">
  <h2>{t('download-cli')}</h2>
  <div class="prose">
    <p>{t('download-cli.body')}</p>
    <pre><code>rox ~/music/albums/loveless
rox --enqueue track.flac
rox --portable</code></pre>
    <p><Rich key="download-cli.flags" /></p>
  </div>
</section>

<section class="shell block">
  <h2>{t('download-build')}</h2>
  <div class="prose">
    <p><Rich key="download-build.body" /></p>
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

  .gets {
    display: flex;
    flex-direction: column;
    gap: var(--space-xs);
  }

  .get {
    display: flex;
    align-items: center;
    gap: var(--space-sm);
    background: var(--accent);
    color: var(--text-on-accent);
    font-weight: 600;
    padding: 0.6em 1em;
    /* Transparent rather than none, so both buttons come out the same height
       once the secondary paints its outline. */
    border: var(--hairline) solid transparent;
    border-radius: var(--radius);
  }

  .get:hover {
    background: var(--accent-hover);
    color: var(--text-on-accent);
  }

  .get.secondary {
    background: none;
    border-color: var(--border);
    color: var(--text-bright);
  }

  .get.secondary:hover {
    background: none;
    border-color: var(--accent);
    color: var(--text-bright);
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
    /* One filename per line, in the same order as the buttons above. */
    display: block;
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

  .packages {
    display: grid;
    gap: var(--space-md);
    margin-top: var(--space-lg);
    grid-template-columns: repeat(auto-fit, minmax(min(100%, 22rem), 1fr));
  }

  .packages article {
    display: flex;
    flex-direction: column;
    gap: var(--space-sm);
    background: var(--bg-panel);
    border: var(--hairline) solid var(--border);
    padding: var(--space-md);
  }

  .packages h3 {
    display: flex;
    flex-wrap: wrap;
    align-items: baseline;
    gap: 0.5rem;
    font-size: var(--step-1);
  }

  .scope {
    color: var(--text-muted);
    font-size: var(--step--1);
    font-weight: 400;
  }

  .packages pre {
    background: var(--bg-root);
  }

  .packages p {
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  /* Pushes the source link to the bottom so cards of different heights still
     line their links up. */
  .more {
    margin-top: auto;
    padding-top: var(--space-xs);
  }
</style>
