export type PlatformId = 'linux' | 'macos' | 'windows'

export interface Platform {
  id: PlatformId
  /** Shown on the card and the detect button. */
  label: string
  /** The `artifact` slug rox's release workflow puts in each asset name. */
  artifact: string
  /** What the user ends up with once the archive is open. */
  archive: string
  /** Message keys, one line each, rendered as an ordered list. */
  steps: string[]
  /** Message key for the gatekeeping note on unsigned builds, or null. */
  caveat: string | null
  /**
   * A second artifact beside the archive, like the .deb or the Windows
   * installer. `suffix` is matched against the end of the asset name, `key`
   * is the message introducing the link.
   */
  alt: { suffix: string, key: string } | null
}

export interface ReleaseAsset {
  platform: PlatformId
  name: string
  url: string
  size: number
}

export interface Release {
  version: string
  tag: string
  url: string
  publishedAt: string
  /** One per platform: the archive the platform card and CTA button link. */
  assets: ReleaseAsset[]
  /** The alt artifacts, at most one per platform with an `alt` matcher. */
  alts: ReleaseAsset[]
  /** True when the data came from the checked-in fallback, not the API. */
  stale: boolean
}
