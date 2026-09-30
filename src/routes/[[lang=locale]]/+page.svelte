<script lang="ts">
  import type { ScreenshotManifest } from '$data/images'
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import BenchmarkTable from '$components/BenchmarkTable.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import FeatureIcon from '$components/FeatureIcon.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { FEATURE_GROUPS } from '$data/features'
  import manifest from '$data/screenshots.generated.json'
  import { SITE } from '$data/site'
  import { WORKSPACE_COUNT } from '$data/workspaces'
  import { i18n } from '$lib/i18n/context'
  import { Compass, FolderInput, ListPlus, ShieldCheck } from '@lucide/svelte'

  const { data }: { data: PageData } = $props()

  const { t, href } = i18n()

  const heroEntry = (manifest as ScreenshotManifest).hero

  /**
   * One recording serves both themes, so there is no pair to swap on the
   * toggle and nothing here can pop in. The poster is the dark still, which is
   * what the loop itself shows.
   *
   * The size is the capture window rather than the stills' 1000x936, and it is
   * here to reserve the box before the video arrives.
   */
  const HERO_VIDEO = { width: 976, height: 912 }
  const heroPoster = `${base}${heroEntry.path}-${heroEntry.widths[heroEntry.widths.length - 1]}.webp`

  const PLUGIN_STEPS = [
    { key: 'home-plugins-step-drop', icon: FolderInput },
    { key: 'home-plugins-step-approve', icon: ShieldCheck },
    { key: 'home-plugins-step-browse', icon: Compass },
    { key: 'home-plugins-step-play', icon: ListPlus },
  ]

  /**
   * Numbered pins over the plugins screenshot, as percentages of the shot so
   * they hold their place at any width. They're measured against the Internet
   * Archive shot at 1268x1430: a new screenshot needs them measured again.
   */
  const PLUGIN_MARKS = [
    { key: 'home-plugins-mark-panel', x: 38, y: 1.4 },
    { key: 'home-plugins-mark-fields', x: 86.5, y: 5.5 },
    { key: 'home-plugins-mark-notice', x: 70, y: 8.4 },
    { key: 'home-plugins-mark-shelf', x: 10.5, y: 23.3 },
  ]
</script>

<Meta
  title={SITE.name}
  fullTitle={t('site-tagline')}
  description={t('site-description')}
/>
<StructuredData
  release={data.release}
  name={t('site-tagline')}
  description={t('site-description')}
/>

<section class="hero shell">
  <div class="pitch">
    <h1>{t('home-hero')}</h1>
    <p class="lede">{t('home-hero.lede')}</p>
    <DownloadButton release={data.release} />
  </div>

  <!--
    preload="auto" alongside autoplay so the loop is fetched with the page
    rather than after it, which is what keeps the poster from sitting there.
  -->
  <video
    class="hero-video"
    poster={heroPoster}
    width={HERO_VIDEO.width}
    height={HERO_VIDEO.height}
    autoplay
    loop
    muted
    playsinline
    preload="auto"
    aria-label={t('home-hero.alt')}
  >
    <source src="{base}/video/hero.webm" type="video/webm" />
  </video>
</section>

<section class="block band">
  <div class="shell">
    <h2>{t('home-speed')}</h2>
    <p class="prose">{t('home-speed.body')}</p>

    <BenchmarkTable deadbeef />
  </div>
</section>

<section class="shell block">
  <h2>{t('home-features')}</h2>
  <!--
    One lattice with its groups drawn inside it as full-width rules, the way a
    rox menu draws its own sections, rather than four separate boxes with air
    between them. The group name is a real heading, so the twelve cells hang off
    four h3s instead of sitting under the h2 as one undifferentiated run.
  -->
  <div class="features">
    {#each FEATURE_GROUPS as group (group.key)}
      <h3 class="group">{t(group.key)}</h3>
      {#each group.features as feature (feature.key)}
        <article class="cell">
          <h4 class="head">
            <FeatureIcon icon={feature.icon} />
            <span>{t(feature.key)}</span>
          </h4>
          <p class="body">{t(`${feature.key}.body`)}</p>
          <!-- Pushed to the bottom of the cell rather than left under the copy,
               so the links across a row sit on one line whatever the paragraphs
               above them do. -->
          {#if feature.link}
            <p class="more">
              <!-- The workspace link's text carries the count, and passing it
                   to every cell is cheaper than a table of which ones need
                   arguments. -->
              <a href={href(feature.link.path)}>
                {t(feature.link.key, { count: WORKSPACE_COUNT })}
              </a>
            </p>
          {/if}
        </article>
      {/each}
    {/each}
  </div>
</section>

<section class="shell block plugins">
  <div class="plugins-copy">
    <p class="eyebrow">{t('home-plugins-eyebrow')}</p>
    <h2>{t('home-plugins')}</h2>
    <p class="prose">{t('home-plugins.lede')}</p>

    <!-- The process as a rail: one node per step, joined by a line, so the
         four read as a sequence rather than as four more feature cells. -->
    <ol class="steps">
      {#each PLUGIN_STEPS as step (step.key)}
        <li class="step">
          <span class="node" aria-hidden="true">
            <step.icon size={16} strokeWidth={2} />
          </span>
          <div>
            <h3 class="step-title">{t(step.key)}</h3>
            <p class="step-body">{t(`${step.key}.body`)}</p>
          </div>
        </li>
      {/each}
    </ol>

    <p class="plugins-links">
      <a href={href('/plugins')}>{t('home-plugins-more')}</a>
      <a href={SITE.pluginGuide}>{t('home-plugins-write')}</a>
    </p>
  </div>

  <figure class="plugins-figure">
    <div class="pinned">
      <Screenshot
        id="plugins"
        alt={t('home-plugins-shot')}
        sizes="(min-width: 64rem) 34rem, (min-width: 48rem) 40rem, calc(100vw - 2.5rem)"
      />
      {#each PLUGIN_MARKS as mark, i (mark.key)}
        <span class="pin" style:left="{mark.x}%" style:top="{mark.y}%" aria-hidden="true">
          {i + 1}
        </span>
      {/each}
    </div>
    <figcaption>
      <ol class="marks" aria-label={t('home-plugins-marks')}>
        {#each PLUGIN_MARKS as mark, i (mark.key)}
          <li><span class="pin" aria-hidden="true">{i + 1}</span>{t(mark.key)}</li>
        {/each}
      </ol>
      <p class="caption"><Rich key="home-plugins-caption" /></p>
    </figcaption>
  </figure>
</section>

<section class="block band closer">
  <div class="shell">
    <h2>{t('home-closer')}</h2>
    <p class="prose">
      <Rich key="home-closer.body" args={{ count: WORKSPACE_COUNT }} />
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

  .hero-video {
    display: block;
    width: 100%;
    height: auto;
    border: var(--hairline) solid var(--border);
    background: var(--bg-panel);
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

  .plugins {
    display: grid;
    gap: var(--space-xl);
    padding-block: var(--space-2xl);
  }

  @media (min-width: 64rem) {
    .plugins {
      grid-template-columns: minmax(0, 1fr) minmax(0, 34rem);
      align-items: start;
    }
  }

  /* The same strip lettering as the feature grid's group rules, in the accent,
     since this is the one heading on the page that names a new thing. */
  .eyebrow {
    margin-bottom: var(--space-xs);
    color: var(--accent-text);
    font-size: var(--step--1);
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.08em;
  }

  .plugins .prose {
    color: var(--text-secondary);
  }

  .steps {
    margin: var(--space-lg) 0 0;
    padding: 0;
    list-style: none;
  }

  .step {
    --node: 2.25rem;

    position: relative;
    display: grid;
    grid-template-columns: var(--node) minmax(0, 1fr);
    gap: var(--space-md);
    padding-bottom: var(--space-lg);
  }

  /* The rail: from under one node to the top of the next. The last step has
     no next, so it has no line. */
  .step:not(:last-child)::before {
    content: '';
    position: absolute;
    top: var(--node);
    bottom: 0;
    left: calc(var(--node) / 2);
    width: var(--hairline);
    background: var(--border);
  }

  .node {
    display: grid;
    place-items: center;
    width: var(--node);
    height: var(--node);
    background: var(--bg-panel);
    border: var(--hairline) solid var(--border);
    color: var(--accent-text);
  }

  .step-title {
    font-size: var(--step-1);
    line-height: 1.25;
    margin-top: 0.3rem;
  }

  .step-body {
    margin-top: var(--space-xs);
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .plugins-links {
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-md) var(--space-lg);
  }

  .plugins-figure {
    margin: 0;
    max-width: 40rem;
  }

  .pinned {
    position: relative;
  }

  .pin {
    display: inline-grid;
    place-items: center;
    width: 1.5rem;
    height: 1.5rem;
    flex: none;
    background: var(--accent);
    color: var(--text-on-accent);
    font-size: var(--step--1);
    font-weight: 600;
    line-height: 1;
  }

  /* Over the screenshot the pin centres on its point, and a dark ring keeps it
     legible against a bright cover. */
  .pinned .pin {
    position: absolute;
    transform: translate(-50%, -50%);
    box-shadow: 0 0 0 3px rgb(0 0 0 / 0.55);
  }

  .marks {
    display: grid;
    gap: var(--space-xs) var(--space-md);
    margin: var(--space-md) 0 0;
    padding: 0;
    list-style: none;
    font-size: var(--step--1);
    color: var(--text-secondary);
  }

  @media (min-width: 34rem) {
    .marks {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  .marks li {
    display: flex;
    align-items: flex-start;
    gap: 0.6rem;
  }

  .caption {
    margin-top: var(--space-md);
    color: var(--text-muted);
    font-size: var(--step--1);
  }
</style>
