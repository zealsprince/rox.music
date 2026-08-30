<script lang="ts">
  /**
   * One full-width row per platform, split into a segment per bucket, oldest on
   * the left. Segment shade tracks how that bucket did against the platform's
   * own best, and the native `title` carries what the bucket is and its number.
   *
   * A release strip and a weekly strip are the same component on purpose: the
   * two views answer different questions and should not look like two different
   * features while doing it.
   *
   * Built at prerender like everything else here, so it works with JavaScript
   * off. The strip is shading and a tooltip, neither of which a screen reader or
   * a touch device gets anything from, so it's marked aria-hidden and the
   * numbers that carry the meaning sit beside it as text. Hover is the bonus,
   * not the interface.
   */

  import type { Strip } from '$types/downloads'
  import PlatformIcon from '$components/PlatformIcon.svelte'
  import { PLATFORMS } from '$data/platforms'
  import { i18n } from '$lib/i18n/context'

  interface Props {
    strip: Strip
  }

  const { strip }: Props = $props()

  const { t, info } = i18n()

  const date = (iso: string): string =>
    new Intl.DateTimeFormat(info.htmlLang, { dateStyle: 'medium', timeZone: 'UTC' })
      .format(new Date(iso))

  const number = (n: number): string => new Intl.NumberFormat(info.htmlLang).format(n)

  // A floor under the shading, so a bucket nobody downloaded in still draws as a
  // tick rather than as a gap in the strip. Without it a quiet stretch reads as
  // missing data instead of as a quiet stretch.
  const FLOOR = 8

  const fill = (count: number, peak: number): number =>
    FLOOR + Math.round((count / peak) * (100 - FLOOR))
</script>

<div class="rows">
  {#each PLATFORMS as platform (platform.id)}
    {@const stats = strip.platforms.find(p => p.platform === platform.id)}
    {#if stats}
      <div class="row">
        <span class="name">
          <PlatformIcon platform={platform.id} size={17} />
          {platform.label}
        </span>

        <div class="strip" aria-hidden="true">
          {#each strip.buckets as bucket (bucket.key)}
            {@const count = bucket.byPlatform[platform.id]}
            <span
              class="seg"
              style="--fill: {fill(count, stats.peak)}%"
              title={strip.kind === 'week'
                ? t('stats-tip-week', { date: date(bucket.at), count })
                : t('stats-tip', { version: bucket.key, date: date(bucket.at), count })}
            ></span>
          {/each}
        </div>

        <!-- Bare number. Three rows repeating the word "downloads" under a
             heading that already says it is three chances to read the same
             word instead of the three numbers. -->
        <span class="total">{number(stats.total)}</span>
      </div>
    {/if}
  {/each}
</div>

<style>
  .rows {
    display: grid;
    gap: var(--space-sm);
  }

  .row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) auto;
    gap: 0.4rem var(--space-md);
    align-items: center;
  }

  /* Name over strip on narrow screens, all three on one line once there's room
     for a long strip to still be worth hovering.

     `display: contents` on the row, not a per-row grid: the totals column is
     auto-width, so three independent grids size it three different ways and
     every strip ends somewhere else. Dissolving the row makes the cells direct
     children of one grid, which is what puts the three columns on shared
     tracks. Same job subgrid does in the download cards, without needing the
     @supports guard, since there's nothing to fall back to here. */
  @media (min-width: 40rem) {
    .rows {
      grid-template-columns: 7.5rem minmax(0, 1fr) auto;
      column-gap: var(--space-md);
      align-items: center;
    }

    .row {
      display: contents;
    }
  }

  .name {
    display: flex;
    align-items: center;
    gap: 0.45rem;
    font-size: var(--step--1);
    color: var(--text-bright);
  }

  .strip {
    display: flex;
    gap: 1px;
    height: 1.6rem;
    /* Spans both columns on the stacked layout, its own column once the row
       goes wide. */
    grid-column: 1 / -1;
  }

  @media (min-width: 40rem) {
    .strip {
      grid-column: auto;
    }
  }

  .seg {
    flex: 1;
    min-width: 0;
    background: color-mix(in srgb, var(--accent) var(--fill), var(--bg-root));
  }

  .seg:hover {
    background: var(--accent-hover);
  }

  /* Right-aligned so the three end flush against the same edge. The left edges
     stay ragged because "86 downloads" is shorter than "288 downloads", and
     splitting the number off into its own column isn't available: the count and
     its noun are one translated string, and they don't come in that order in
     every language. */
  .total {
    font-size: var(--step--1);
    font-variant-numeric: tabular-nums;
    color: var(--text-secondary);
    white-space: nowrap;
    text-align: right;
  }
</style>
