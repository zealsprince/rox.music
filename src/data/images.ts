// The widths the screenshot encoder tries. What it actually emitted per image
// lives in screenshots.generated.json, because a source narrower than a target
// produces no file at that width and the srcset must not claim otherwise.
export const SCREENSHOT_WIDTHS = [640, 1024, 1440] as const

export interface ScreenshotEntry {
  /** Intrinsic size of the source, for reserving the box before load. */
  width: number
  height: number
  /** Widths that exist on disk for this image. */
  widths: number[]
  /**
   * Whether `<id>-light-<w>.<ext>` was written alongside `<id>-dark-<w>.<ext>`.
   * False means the site shows the dark shot in both themes, on a dark mat so
   * it reads as deliberate.
   */
  hasLight: boolean
}

export type ScreenshotManifest = Record<string, ScreenshotEntry>
