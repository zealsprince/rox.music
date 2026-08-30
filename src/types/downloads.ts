import type { PlatformId } from './release'

/**
 * One column of a strip.
 *
 * A release and a week are the same shape deliberately, so one component draws
 * both and the two views can't drift into looking like different features.
 */
export interface Bucket {
  /** Stable key, and what the tooltip names: a version, or a week's start date. */
  key: string
  /** ISO timestamp, formatted per locale in the tooltip. */
  at: string
  byPlatform: Record<PlatformId, number>
  total: number
}

export interface PlatformDownloads {
  platform: PlatformId
  /**
   * Summed across this strip's buckets, so it means "all time" only on the
   * release strip, where the buckets are every release there has ever been.
   */
  total: number
  /** The busiest single bucket, which this row's shading scales to. */
  peak: number
}

export interface Strip {
  /** Which tooltip and heading the view uses. */
  kind: 'release' | 'week'
  /** Oldest first, which is the order the strip draws left to right. */
  buckets: Bucket[]
  platforms: PlatformDownloads[]
  total: number
}

export interface Downloads {
  byRelease: Strip
  /** Null until enough weekly snapshots have accumulated to be worth drawing. */
  byWeek: Strip | null
  /**
   * Whether the weekly view is the one the switcher opens on. Separate from
   * `byWeek` being present: a strip can be worth offering long before it's worth
   * leading with.
   */
  weekLeads: boolean
  /** True when the counts came from the checked-in fallback, not the API. */
  stale: boolean
  /** True when the weekly strip is synthetic. Dev only, never set in a build. */
  mocked: boolean
}
