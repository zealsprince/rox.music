<script lang="ts">
  import type { ScreenshotManifest } from '$data/images'
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import BenchmarkTable from '$components/BenchmarkTable.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import FeatureIcon from '$components/FeatureIcon.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { FEATURE_GROUPS } from '$data/features'
  import manifest from '$data/screenshots.generated.json'
  import { SITE } from '$data/site'
  import { WORKSPACE_COUNT } from '$data/workspaces'
  import { i18n } from '$lib/i18n/context'

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
</style>
