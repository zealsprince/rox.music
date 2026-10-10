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

  const rows = PLATFORMS.flatMap((platform) => {
    const stats = strip.platforms.find(p => p.platform === platform.id)
    return stats ? [{ platform, stats }] : []
  })
</script>

<!--
  Names, strips and totals are three columns rather than three rows, so all the
  strips sit in one scroller and move together. Every cell is the strip's
  height, which keeps the columns lined up without the rows sharing a box.
-->
<div class="chart">
  <div class="names">
    {#each rows as row (row.platform.id)}
      <span class="name">
        <PlatformIcon platform={row.platform.id} size={17} />
        {row.platform.label}
      </span>
    {/each}
  </div>

  <!-- Reversed so the scroller opens on its far end, where the newest bucket
       is. That's the end anyone looks at first, and it needs no script. -->
  <div class="scroller">
    <div class="strips" aria-hidden="true">
      {#each rows as row (row.platform.id)}
        <div class="strip">
          {#each strip.buckets as bucket (bucket.key)}
            {@const count = bucket.byPlatform[row.platform.id]}
            <span
              class="seg"
              style="--fill: {fill(count, row.stats.peak)}%"
              title={strip.kind === 'week'
                ? t('stats-tip-week', { date: date(bucket.at), count })
                : t('stats-tip', { version: bucket.key, date: date(bucket.at), count })}
            ></span>
          {/each}
        </div>
      {/each}
    </div>
  </div>

  <!-- Bare number. Three rows repeating the word "downloads" under a heading
       that already says it is three chances to read the same word instead of
       the three numbers. -->
  <div class="totals">
    {#each rows as row (row.platform.id)}
      <span class="total">{number(row.stats.total)}</span>
    {/each}
  </div>
</div>

<style>
  .chart {
    --row: 1.6rem;

    display: grid;
    grid-template-columns: auto minmax(0, 1fr) auto;
    column-gap: var(--space-md);
    align-items: start;
  }

  .names,
  .totals,
  .strips {
    display: grid;
    grid-auto-rows: var(--row);
    row-gap: var(--space-sm);
  }

  @media (min-width: 40rem) {
    .chart {
      grid-template-columns: 7.5rem minmax(0, 1fr) auto;
    }
  }

  .name {
    display: flex;
    align-items: center;
    gap: 0.45rem;
    font-size: var(--step--1);
    color: var(--text-bright);
    white-space: nowrap;
  }

  .scroller {
    display: flex;
    flex-direction: row-reverse;
    overflow-x: auto;
  }

  /* As wide as the segments need, and never narrower than the scroller, so a
     strip with few buckets still spans the whole column. */
  .strips {
    flex: none;
    width: max-content;
    min-width: 100%;
  }

  /* Each segment gets at least a hover target's width. Past that the strip
     scrolls rather than thinning every release down to a hairline. */
  .strip {
    display: grid;
    grid-auto-flow: column;
    grid-auto-columns: minmax(0.75rem, 1fr);
    gap: 1px;
  }

  .seg {
    background: color-mix(in srgb, var(--accent) var(--fill), var(--bg-root));
  }

  .seg:hover {
    background: var(--accent-hover);
  }

  /* Right-aligned so the three end flush against the same edge. */
  .total {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    font-size: var(--step--1);
    font-variant-numeric: tabular-nums;
    color: var(--text-secondary);
    white-space: nowrap;
  }
</style>
