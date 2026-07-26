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
   * Whether `<id>-light-<w>.<ext>` was written alongside `<id>-dark-<w>.<ext>`.
   * False means the site shows the dark shot in both themes, on a dark mat so
   * it reads as deliberate.
   */
  hasLight: boolean
}

export type ScreenshotManifest = Record<string, ScreenshotEntry>
