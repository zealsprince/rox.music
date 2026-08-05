// Intermediate rungs the screenshot encoder tries. The source's own width is
// always emitted on top of these, so the srcset can always offer full native
// resolution; see optimize-images.ts. What actually got written per image lives
// in screenshots.generated.json.
export const SCREENSHOT_WIDTHS = [640, 1024, 1440, 1920] as const

export interface ScreenshotEntry {
  /** Intrinsic size of the source, for reserving the box before load. */
  width: number
  height: number
  /** Widths that exist on disk for this image. */
  widths: number[]
  /**
   * Absolute site path of the served files, minus the `-<width>.<ext>` tail.
   * Carrying the whole path is what lets rox screenshots and other people's
   * software live in different folders under different naming rules without a
   * consumer having to know which is which.
   */
  path: string
  /**
   * Same, for the light-theme counterpart, when one was encoded. Absent means
   * the site shows the one shot in both themes, on a mat so it reads as
   * deliberate.
   */
  lightPath?: string
}

export type ScreenshotManifest = Record<string, ScreenshotEntry>
