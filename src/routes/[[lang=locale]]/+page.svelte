<script lang="ts">
  import type { Feature, FeatureGroup } from '$data/features'
  import type { ScreenshotManifest } from '$data/images'
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import BenchmarkTable from '$components/BenchmarkTable.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import FeatureIcon from '$components/FeatureIcon.svelte'
  import Logo from '$components/Logo.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import Equalizer from '$components/rox/Equalizer.svelte'
  import Playback from '$components/rox/Playback.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { BENCHMARKS, memoryLabel, secondsLabel } from '$data/benchmarks'
  import { FEATURE_GROUPS } from '$data/features'
  import manifest from '$data/screenshots.generated.json'
  import { SITE } from '$data/site'
  import { WORKSPACE_COUNT, WORKSPACES } from '$data/workspaces'
  import { i18n } from '$lib/i18n/context'
  import { Compass, FolderInput, ListPlus, ShieldCheck } from '@lucide/svelte'

  const { data }: { data: PageData } = $props()

  const { t, href, locale } = i18n()

  // The hero's proof points come off the same first-party numbers the
  // benchmark table shows, so the two can't drift apart.
  const rox = BENCHMARKS.find(row => row.self)!
  const LIBRARY_TRACKS = 50_000
  const PROOF = [
    { figure: secondsLabel(locale, rox.windowUpSecs!), key: 'home-proof-window' },
    { figure: memoryLabel(locale, rox), key: 'home-proof-memory' },
    { figure: 'AGPL-3.0', key: 'home-proof-license' },
  ]

  /**
   * The hero shot cut along the dock's own seams into the panels it is made
   * of, as percentages of the 1416x876 Default shot: the top bar and search,
   * the art column, the playlist, and the playback stack. Each piece carries
   * the whole picture and shows its own part, so the four pull apart without
   * a second image. A reshoot at another layout needs these measured again.
   */
  const SHOT = { width: 1416, height: 876 }
  const SEAM = { column: 596, search: 71, playback: 595 }
  // The seam is the dock's hairline, one pixel the pieces either side both
  // want. Neither gets it, and the piece after it starts two in, since the
  // shot is resampled on the page and a seam at the edge bleeds half a pixel.
  const SLICES = [
    { x: 0, y: 0, w: SHOT.width, h: SEAM.search, dx: 0, dy: -1 },
    { x: 0, y: SEAM.search + 2, w: SEAM.column, h: SEAM.playback - SEAM.search - 2, dx: -1.25, dy: 0.75 },
    { x: SEAM.column + 2, y: SEAM.search + 2, w: SHOT.width - SEAM.column - 2, h: SEAM.playback - SEAM.search - 2, dx: 1, dy: -0.5 },
    { x: 0, y: SEAM.playback + 2, w: SHOT.width, h: SHOT.height - SEAM.playback - 2, dx: 0.5, dy: 1.25 },
  ].map(r => ({
    ...r,
    left: (100 * r.x) / SHOT.width,
    top: (100 * r.y) / SHOT.height,
    width: (100 * r.w) / SHOT.width,
    height: (100 * r.h) / SHOT.height,
  }))

  /**
   * The feature groups as stories, each with the picture that shows the thing.
   * A wide picture sits over its three features; a tall one sits beside them.
   * Sources and Beyond the window are not here: they are one picture, the
   * signal path, drawn as its own section below.
   */
  type Visual
    = | { kind: 'shot', id: string, alt: string, link: string }
      | { kind: 'grid', ids: string[] }
      | { kind: 'video' }
      | { kind: 'playback' }

  const group = (key: string): FeatureGroup => FEATURE_GROUPS.find(g => g.key === key)!

  /**
   * Where a workspace shot leads. CaTRoX has a page of its own; the rest open
   * their tab on the workspaces page, whose radios are `ws-<id>` and which
   * enhance.js checks off the hash.
   */
  const workspacePath = (id: string): string =>
    id === 'catrox' ? '/catrox' : `/workspaces#ws-${id}`

  const STORIES: { group: FeatureGroup, visual: Visual, wide: boolean }[] = [
    { group: group('features-library'), visual: { kind: 'shot', id: 'foobar', alt: 'workspace-foobar.alt', link: workspacePath('foobar') }, wide: true },
    { group: group('features-playback'), visual: { kind: 'playback' }, wide: false },
    { group: group('features-looks'), visual: { kind: 'grid', ids: ['metro', 'phosphor', 'critters', 'diffuse', 'catrox', 'llama'] }, wide: false },
    { group: group('features-daily'), visual: { kind: 'video' }, wide: false },
  ]

  /**
   * What comes into rox and what goes out of it, on one line through the
   * mark: the sources on the left feeding in, the socket, the MCP proxy and
   * the Icecast source on the right fed from it. Each side is a feature group
   * entire, so the copy is the same six features and nothing is invented.
   */
  const INTO = group('features-sources')
  const OUT_OF = group('features-beyond')

  /**
   * The closer's backdrop: every shipped look drifting past, listed twice so
   * the loop has no seam. Decorative, and gone still under reduced motion.
   */
  const MARQUEE = [...WORKSPACES, ...WORKSPACES]

  /**
   * One recording serves both themes, so there is no pair to swap on the
   * toggle and nothing here can pop in. The poster is the dark still, which is
   * what the loop itself shows, and the size is the capture window so the box
   * is reserved before the video arrives.
   */
  const heroEntry = (manifest as ScreenshotManifest).hero
  const VIDEO = { width: 976, height: 912 }
  const videoPoster = `${base}${heroEntry.path}-${heroEntry.widths[heroEntry.widths.length - 1]}.webp`

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

<!--
  Full bleed, centred, with the real window under the words. The glow and the
  dot field are the section's own background so nothing here needs a wrapper
  that the content shell would cap.
-->
<section class="hero" style:--wave-tile="url({base}/hero-wave.png)">
  <!-- Half a waveform along each edge, its centre line on the edge: hanging
       off the header, and standing on the rule into the next band. Decoration,
       so hidden from assistive tech. -->
  <div class="wave top" aria-hidden="true"></div>
  <div class="wave bottom" aria-hidden="true"></div>

  <div class="shell pitch">
    <h1>{t('home-hero')}</h1>
    <p class="lede">{t('home-hero.lede')}</p>
    <DownloadButton release={data.release} centered />

    <ul class="proof">
      {#each PROOF as point (point.key)}
        <li>
          <strong>{point.figure}</strong>
          <span>{t(point.key, { tracks: LIBRARY_TRACKS })}</span>
        </li>
      {/each}
    </ul>
  </div>

  <!--
    The window, pulled apart at its seams and put back together on hover. One
    link to assistive tech, named for the picture; the slices are presentation.
  -->
  <div class="shell showcase">
    <a class="shot" href={href('/download')} aria-label={t('workspace-default.alt')}>
      {#each SLICES as slice, i (i)}
        <div
          class="slice"
          style:left="{slice.left}%"
          style:top="{slice.top}%"
          style:width="{slice.width}%"
          style:height="{slice.height}%"
          style:--dx="{slice.dx}rem"
          style:--dy="{slice.dy}rem"
          aria-hidden="true"
        >
          <div
            class="whole"
            style:width="{(100 * SHOT.width) / slice.w}%"
            style:left="{(-100 * slice.x) / slice.w}%"
            style:top="{(-100 * slice.y) / slice.h}%"
          >
            <Screenshot
              id="default"
              alt=""
              sizes="(min-width: 1180px) 1116px, (min-width: 48rem) calc(100vw - 4rem), calc(100vw - 2.5rem)"
              priority
            />
          </div>
        </div>
      {/each}
    </a>
  </div>
</section>

<section class="block band">
  <div class="shell">
    <h2>{t('home-speed')}</h2>
    <p class="prose">{t('home-speed.body')}</p>

    <BenchmarkTable deadbeef />
  </div>
</section>

<!--
  One story per group, the picture on one side and the three features on the
  other, sides alternating down the page. The group name is the heading, so the
  page's outline is the same six headings the grid had.
-->
{#each STORIES as story, i (story.group.key)}
  <section class="story-band" class:alt={i % 2 === 1}>
    <article class="shell story" class:wide={story.wide} class:flip={i % 2 === 1}>
      {#if story.wide}
        <h2>{t(story.group.key)}</h2>
      {/if}

      <div class="visual">
        {#if story.visual.kind === 'shot'}
          <a class="frame" href={href(story.visual.link)}>
            <Screenshot
              id={story.visual.id}
              alt={t(story.visual.alt)}
              sizes="(min-width: 64rem) 38rem, (min-width: 48rem) calc(100vw - 4rem), calc(100vw - 2.5rem)"
            />
          </a>
        {:else if story.visual.kind === 'grid'}
          <!-- Two columns, the second a step down, so four windows read as a
               spread on a desk rather than a contact sheet. -->
          <div class="collage">
            {#each story.visual.ids as id (id)}
              <a class="frame" href={href(workspacePath(id))}>
                <Screenshot {id} alt={t(`workspace-${id}.alt`)} sizes="(min-width: 64rem) 19rem, 50vw" />
              </a>
            {/each}
          </div>
        {:else if story.visual.kind === 'video'}
          <div class="frame">
            <video
              class="loop"
              poster={videoPoster}
              width={VIDEO.width}
              height={VIDEO.height}
              autoplay
              loop
              muted
              playsinline
              preload="metadata"
              aria-label={t('home-hero.alt')}
            >
              <source src="{base}/video/hero.webm" type="video/webm" />
            </video>
          </div>
        {:else if story.visual.kind === 'playback'}
          <!-- The equalizer over the playback stack, the two panels the
               copy beside them is about. Drawn live; the copy says the rest. -->
          <div class="frame live" data-live>
            <Equalizer />
            <Playback />
          </div>
        {/if}
      </div>

      <div class="copy">
        {#if !story.wide}
          <h2>{t(story.group.key)}</h2>
        {/if}
        <ul class="features">
          {#each story.group.features as feature (feature.key)}
            <li class="feature">
              <FeatureIcon icon={feature.icon} size={22} />
              <div>
                <h3>{t(feature.key)}</h3>
                <p>{t(`${feature.key}.body`)}</p>
                <!-- The workspace link's text carries the count, and passing
                     it to every one is cheaper than a table of which need
                     arguments. -->
                {#if feature.link}
                  <a href={href(feature.link.path)}>
                    {t(feature.link.key, { count: WORKSPACE_COUNT })}
                  </a>
                {/if}
              </div>
            </li>
          {/each}
        </ul>
      </div>
    </article>
  </section>
{/each}

<!--
  The signal path. Sources on the left, the socket and what hangs off it on
  the right, each side a bus line the cards tap into and one trunk to the
  mark in the middle; the pulse runs along the bus into the mark on the left
  and out from it on the right. Straight lines only, a wiring diagram rather
  than a drawing. Below 64rem the lines go and it stacks as in, rox, out.
-->
<section class="block path-block">
  <div class="shell path">
    {#snippet card(feature: Feature)}
      <article class="card">
        <FeatureIcon icon={feature.icon} size={22} />
        <div>
          <h3>{t(feature.key)}</h3>
          <p>{t(`${feature.key}.body`)}</p>
          {#if feature.link}
            <a href={href(feature.link.path)}>{t(feature.link.key, { count: WORKSPACE_COUNT })}</a>
          {/if}
        </div>
      </article>
    {/snippet}

    <h2 class="head into">{t(INTO.key)}</h2>
    <h2 class="head outof">{t(OUT_OF.key)}</h2>

    <div class="side into">
      {#each INTO.features as feature (feature.key)}
        {@render card(feature)}
      {/each}
    </div>

    <svg class="wires into" viewBox="0 0 100 300" preserveAspectRatio="none" aria-hidden="true">
      <g class="wire">
        <path d="M0 50 H50 V250 H0" />
        <path d="M0 150 H100" />
      </g>
      <g class="pulse">
        <path d="M0 50 H50 V150 H100" />
        <path d="M0 250 H50 V150" />
        <path d="M0 150 H50" />
      </g>
    </svg>

    <div class="hub" aria-hidden="true">
      <span class="mark"><Logo size="2.5rem" /></span>
    </div>

    <svg class="wires outof" viewBox="0 0 100 300" preserveAspectRatio="none" aria-hidden="true">
      <g class="wire">
        <path d="M100 50 H50 V250 H100" />
        <path d="M0 150 H100" />
      </g>
      <g class="pulse">
        <path d="M0 150 H50 V50 H100" />
        <path d="M50 150 V250 H100" />
        <path d="M50 150 H100" />
      </g>
    </svg>

    <div class="side outof">
      {#each OUT_OF.features as feature (feature.key)}
        {@render card(feature)}
      {/each}
    </div>
  </div>
</section>

<section class="block band plugins-block">
  <div class="shell plugins">
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
      <a class="pinned" href={href('/plugins')}>
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
      </a>
      <figcaption>
        <ol class="marks" aria-label={t('home-plugins-marks')}>
          {#each PLUGIN_MARKS as mark, i (mark.key)}
            <li><span class="pin" aria-hidden="true">{i + 1}</span>{t(mark.key)}</li>
          {/each}
        </ol>
        <p class="caption"><Rich key="home-plugins-caption" /></p>
      </figcaption>
    </figure>
  </div>
</section>

<section class="block closer">
  <div class="marquee" aria-hidden="true">
    <div class="belt">
      {#each MARQUEE as workspace, i (`${workspace.id}-${i}`)}
        <span class="slide">
          <Screenshot id={workspace.id} alt="" sizes="18rem" eager />
        </span>
      {/each}
    </div>
  </div>
  <div class="shell closer-copy">
    <h2>{t('home-closer')}</h2>
    <p class="prose">
      <Rich key="home-closer.body" args={{ count: WORKSPACE_COUNT }} />
    </p>
  </div>
</section>

<style>
  /* ── Hero ── */

  /* The glow sits behind the window, so it is placed off the bottom of the
     pitch rather than the top of the section, and the dot field fades out
     before it reaches the content below. */
  /* The glow sits behind the window, so it is placed off the bottom of the
     pitch rather than the top of the section, and the dot field fades out
     before it reaches the content below. */
  .hero {
    position: relative;
    padding-block: var(--space-2xl) var(--space-2xl);
    overflow: hidden;
    background: radial-gradient(ellipse 60% 45% at 50% 62%, color-mix(in srgb, var(--accent) 16%, transparent), transparent 70%);
  }

  /* The dot field on an 8px grid, on its own layer so it can be faded out
     under the waveform strips at both edges: the strips' dots sit on their
     own rhythm, and two grids meeting would show it. */
  .hero::before {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(color-mix(in srgb, var(--border) 45%, transparent) 1px, transparent 1px) 0 0 / 8px 8px;
    mask-image: linear-gradient(to bottom, transparent 3rem, black 9rem, black calc(100% - 9rem), transparent calc(100% - 3rem));
    pointer-events: none;
  }

  .hero::after {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(to bottom, transparent 55%, var(--bg-root));
    pointer-events: none;
  }

  /* Half a row of the waveform tile along an edge, the border colour
     through its mask, cut at the row's centre line so it sits flush on the
     edge: the lower half of the tile's first row hangs off the header, the
     upper half of its last row stands on the rule into the next band. The
     tile is a bitmap drawn by scripts/build-wave.ts at 576x288 CSS pixels
     with rows 96 tall, so the size and offsets here have to match it. */
  .hero > .wave {
    position: absolute;
    left: 0;
    right: 0;
    height: 48px;
    background: var(--border);
    mask-image: var(--wave-tile);
    mask-size: 576px 288px;
    mask-repeat: repeat-x;
    pointer-events: none;
    z-index: 1;
  }

  /* Each strip steps one tile width and loops, the top to the left and the
     bottom to the right. Stepped rather than slid: the tile's columns are
     8px apart and the tile is 576 wide, so 72 steps move every dot exactly
     one column at a time, the way a meter's dots jump. The tile repeats along
     the strip, so the loop has no seam. */
  .wave.top {
    top: 0;
    mask-position: 0 -48px;
    animation: drift-left 4.5s steps(72) infinite;
  }

  .wave.bottom {
    bottom: 0;
    mask-position: 0 -192px;
    animation: drift-right 4.5s steps(72) infinite;
  }

  @keyframes drift-left {
    to {
      mask-position: -576px -48px;
    }
  }

  @keyframes drift-right {
    to {
      mask-position: 576px -192px;
    }
  }

  .hero > * {
    position: relative;
    z-index: 1;
  }

  .pitch {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  h1 {
    max-width: 18ch;
    font-size: var(--step-4);
    letter-spacing: -0.035em;
  }

  .lede {
    margin-block: var(--space-md) var(--space-lg);
    max-width: 52ch;
    font-size: var(--step-1);
    color: var(--text-secondary);
  }

  /* Three figures in a row at every width. On a phone they sit close with
     the figure a step smaller, and the rules between them stay, since a row
     with no rules reads as three unrelated lines. */
  .proof {
    display: flex;
    justify-content: center;
    width: 100%;
    margin: var(--space-xl) 0 0;
    padding: 0;
    list-style: none;
  }

  .proof li {
    display: flex;
    flex: 1 1 0;
    flex-direction: column;
    gap: 0.2rem;
    min-width: 0;
    padding-inline: var(--space-sm);
    border-left: var(--hairline) solid var(--border);
  }

  .proof li:first-child {
    border-left: 0;
  }

  .proof strong {
    font-size: var(--step-1);
    font-weight: 600;
    letter-spacing: -0.02em;
    color: var(--text-bright);
    line-height: 1.1;
    white-space: nowrap;
  }

  .proof span {
    font-size: var(--step--1);
    color: var(--text-muted);
    text-wrap: balance;
  }

  @media (min-width: 48rem) {
    .proof {
      width: auto;
    }

    .proof li {
      flex: none;
      padding-inline: var(--space-lg);
    }

    .proof strong {
      font-size: var(--step-2);
    }
  }

  .showcase {
    position: relative;
    margin-top: var(--space-xl);
  }

  @media (min-width: 48rem) {
    .showcase {
      margin-top: var(--space-2xl);
    }
  }

  /* The box the slices are laid in. Its aspect is the shot's, so the slices'
     percentages land on the seams, and a little room at the sides lets the
     pulled-out pieces breathe without clipping. */
  /* On a phone the whole window would be a postage stamp, so the shot runs
     wider than the screen, cropped at the right, with the pieces pushed back
     together: pulled apart at that size they only read as broken. */
  .shot {
    display: block;
    position: relative;
    aspect-ratio: 1416 / 876;
    width: 150%;
  }

  @media (min-width: 48rem) {
    .shot {
      width: auto;
      margin-inline: 1.5rem;
    }
  }

  @media (max-width: 47.99rem) {
    .slice {
      transform: none;
    }
  }

  /* No border on the box itself: the offsets inside are percentages of it,
     and a border would shrink the box by two pixels and shift every slice's
     picture off its seam. The hairline is an outline, which takes no space. */
  .slice {
    position: absolute;
    overflow: hidden;
    outline: var(--hairline) solid var(--border);
    outline-offset: calc(-1 * var(--hairline));
    background: var(--bg-panel);
    box-shadow: 0 1.5rem 3rem -1rem rgb(0 0 0 / 0.75);
    transform: translate(var(--dx), var(--dy));
    transition: transform 0.45s cubic-bezier(0.2, 0.7, 0.2, 1);
  }

  :global(html.light) .slice {
    box-shadow: 0 1.5rem 3rem -1.5rem rgb(0 0 0 / 0.35);
  }

  /* Back together under the pointer, which is what says the pieces are one
     window and not four pictures. */
  .shot:hover .slice {
    transform: none;
  }

  /* The whole shot, sized to the box and offset so this slice's region lands
     under the slice. The numbers are inline off SLICES. */
  .whole {
    position: absolute;
  }

  .whole :global(img) {
    border: 0;
  }

  @media (min-width: 64rem) {
    .hero {
      padding-top: calc(var(--space-2xl) + var(--space-lg));
    }
  }

  /* ── Bands ── */

  .block {
    padding-block: var(--space-xl);
  }

  .band {
    background: var(--bg-panel);
    border-block: var(--hairline) solid var(--border);
  }

  /* ── Closer ── */

  .closer {
    position: relative;
    padding-block: calc(var(--space-2xl) * 1.5);
    overflow: hidden;
    text-align: center;
  }

  .closer-copy {
    position: relative;
    z-index: 1;
  }

  .closer .prose {
    margin-inline: auto;
  }

  /* Every look drifting by behind the words, dimmed, with the band's own
     colour pooled in the middle so the copy sits on something still. */
  .marquee {
    position: absolute;
    inset: 0;
    display: flex;
    align-items: center;
    opacity: 0.35;
    mask-image: linear-gradient(to right, transparent, black 15%, black 85%, transparent);
  }

  .marquee::after {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(ellipse 45% 80% at 50% 50%, var(--bg-root) 30%, transparent);
  }

  .belt {
    display: flex;
    gap: var(--space-md);
    width: max-content;
    animation: drift 90s linear infinite;
  }

  .slide {
    width: 18rem;
    flex: none;
    box-shadow: 0 1rem 2rem -0.75rem rgb(0 0 0 / 0.6);
  }

  /* Two copies of the row, so half a belt is one full lap. */
  @keyframes drift {
    to {
      transform: translateX(calc(-50% - var(--space-md) / 2));
    }
  }

  .block h2 {
    font-size: var(--step-3);
    margin-bottom: var(--space-md);
  }

  /* ── Stories ── */

  /* One band per story, the surface alternating with its neighbour and a
     hairline between, so the page steps down through them rather than
     running them together. */
  .story-band {
    padding-block: var(--space-xl);
  }

  @media (min-width: 48rem) {
    .story-band {
      padding-block: var(--space-2xl);
    }
  }

  .story-band.alt {
    background: var(--bg-panel);
    border-block: var(--hairline) solid var(--border);
  }

  .story {
    display: grid;
    gap: var(--space-xl);
    align-items: center;
  }

  /* Side by side only when the picture is tall enough to hold its own next
     to three features. A wide one goes over them, with the features in a row
     beneath, so neither side is left with air.

     Staggered, not just stacked: the picture rides up past the top of its
     band, across the hairline into the band before, and hangs out past the
     column edge on its own side, so each story steps off the last. */
  @media (min-width: 64rem) {
    .story:not(.wide) {
      grid-template-columns: minmax(0, 1fr) minmax(0, 1fr);
      gap: var(--space-2xl);
    }

    .story:not(.wide) .visual {
      margin-top: calc(-1 * var(--space-2xl) - 2rem);
      margin-left: -3rem;
    }

    .story:not(.wide).flip .visual {
      order: 2;
      margin-left: 0;
      margin-right: -3rem;
    }

    .story-band:has(.story:not(.wide)) {
      padding-top: calc(var(--space-2xl) + 2rem);
    }
  }

  .story.wide h2 {
    font-size: var(--step-3);
  }

  @media (min-width: 48rem) {
    .story.wide .features {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: var(--space-xl);
    }

    .story.wide .feature {
      flex-direction: column;
      gap: var(--space-sm);
    }
  }

  .frame {
    display: block;
    border: var(--hairline) solid var(--border);
    box-shadow: 0 1.5rem 3rem -1.5rem rgb(0 0 0 / 0.7);
  }

  .frame :global(img) {
    border: 0;
  }

  /* The two panels stacked on a hairline, at app size, the spectrum and
     waveform given the height a bottom dock has rather than a strip's. */
  .live {
    --spectrum-h: 9em;
    --waveform-h: 7em;

    display: flex;
    flex-direction: column;
    gap: var(--hairline);
    background: var(--border);
    /* App size where there is room, scaled down with the column so the
       ninety-two bars still fit a phone. */
    font-size: clamp(0.7rem, 2.6vw, 1rem);
  }

  .collage {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: var(--space-md);
    align-items: start;
    padding-bottom: 3.5rem;
  }

  .collage .frame:nth-child(even) {
    transform: translateY(3.5rem);
  }

  .collage .frame {
    transition: transform 0.25s ease;
  }

  .collage .frame:hover {
    transform: translateY(-0.25rem) scale(1.03);
    z-index: 1;
  }

  .collage .frame:nth-child(even):hover {
    transform: translateY(3.25rem) scale(1.03);
  }

  .loop {
    display: block;
    width: 100%;
    height: auto;
    background: var(--bg-panel);
  }

  .copy h2 {
    font-size: var(--step-3);
    margin-bottom: var(--space-lg);
  }

  .features {
    display: flex;
    flex-direction: column;
    gap: var(--space-md);
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .feature {
    display: flex;
    align-items: flex-start;
    gap: 0.75rem;
  }

  /* The mark sits against a step-1 title, so it takes the title's ink and a
     little more top offset than it has beside body text. */
  .feature :global(.wrap) {
    margin-top: 0.3em;
    color: var(--text);
  }

  .feature div {
    min-width: 0;
  }

  .feature h3 {
    font-size: var(--step-1);
    font-weight: 600;
    line-height: 1.25;
    margin-bottom: var(--space-xs);
  }

  .feature p {
    color: var(--text-secondary);
  }

  .feature a {
    display: inline-block;
    margin-top: var(--space-xs);
    font-size: var(--step--1);
  }

  /* ── The signal path ── */

  .path-block {
    padding-block: var(--space-2xl);
  }

  /* Two rows: the headings, then the sides with the wiring between. The
     sides stretch to one height, and the cards split it three ways, which is
     what puts each card's centre on a wire. */
  /* Stacked, it reads top to bottom as in, rox, out: each heading right
     over its own cards, the mark between. The order is set by hand because
     the markup is in grid order for the wide layout. */
  .path {
    display: flex;
    flex-direction: column;
    gap: var(--space-md);
  }

  .head {
    font-size: var(--step-2);
  }

  .head.into {
    order: 1;
  }

  .side.into {
    order: 2;
  }

  .hub {
    order: 3;
  }

  .head.outof {
    order: 4;
    margin-top: var(--space-lg);
  }

  .side.outof {
    order: 5;
  }

  .side {
    display: flex;
    flex-direction: column;
    gap: var(--space-md);
  }

  .card {
    display: flex;
    flex: 1;
    align-items: flex-start;
    gap: 0.75rem;
    padding: var(--space-md);
    border: var(--hairline) solid var(--border);
    background: var(--bg-panel);
  }

  .card :global(.wrap) {
    margin-top: 0.15em;
    color: var(--text);
  }

  .card h3 {
    font-size: var(--step-0);
    font-weight: 600;
    margin-bottom: var(--space-xs);
  }

  .card p {
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .card a {
    display: inline-block;
    margin-top: var(--space-xs);
    font-size: var(--step--1);
  }

  .hub {
    display: flex;
    justify-content: center;
    align-items: center;
    padding-block: var(--space-md);
  }

  .mark {
    display: grid;
    place-items: center;
    width: 4.5rem;
    height: 4.5rem;
    border: var(--hairline) solid var(--border);
    background: var(--bg-panel);
    color: var(--accent);
  }

  .wires {
    display: none;
  }

  @media (min-width: 64rem) {
    .path {
      display: grid;
      grid-template-columns: minmax(0, 1fr) 5rem auto 5rem minmax(0, 1fr);
      grid-template-rows: auto 1fr;
      column-gap: 0;
      row-gap: var(--space-lg);
      align-items: stretch;
    }

    .head {
      margin: 0;
      text-align: center;
    }

    /* Every piece placed by hand. Auto-placement would fill row one's empty
       cells first and put the cards in the wire columns. */
    .head.into {
      grid-area: 1 / 1;
    }

    .path .head.outof {
      grid-area: 1 / 5;
      margin-top: 0;
    }

    .side.into {
      grid-area: 2 / 1;
    }

    .wires.into {
      grid-area: 2 / 2;
    }

    .hub {
      grid-area: 2 / 3;
      padding: 0;
    }

    .wires.outof {
      grid-area: 2 / 4;
    }

    .side.outof {
      grid-area: 2 / 5;
    }

    /* One SVG per side stretched to the sides' height, so the three taps
       meet the three cards' centres. The wire is the border colour; the
       pulse is the accent sliding along it, toward the mark on the way in and
       away on the way out. */
    .wires {
      display: block;
      width: 100%;
      height: 100%;
      overflow: visible;
    }

    .wires path {
      fill: none;
      stroke: var(--border);
      stroke-width: 1;
      vector-effect: non-scaling-stroke;
    }

    .wires .pulse path {
      stroke: var(--accent);
      stroke-dasharray: 14 34;
      animation: flow 2.4s linear infinite;
    }

    .wires.outof .pulse path {
      animation-direction: reverse;
    }

    @keyframes flow {
      to {
        stroke-dashoffset: -48;
      }
    }
  }

  /* ── Plugins ── */

  .plugins-block {
    padding-block: var(--space-2xl);
  }

  .plugins {
    display: grid;
    gap: var(--space-xl);
  }

  @media (min-width: 64rem) {
    .plugins {
      grid-template-columns: minmax(0, 1fr) minmax(0, 34rem);
      align-items: start;
    }
  }

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
    display: block;
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
