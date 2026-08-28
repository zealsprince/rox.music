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
   * Message key for the main download button's label, or null for the plain
   * "Download". Platforms with an alt name both buttons so the pair reads
   * as a choice.
   */
  cta: string | null
  /**
   * A second artifact beside the archive, like the .deb or the Windows
   * installer. `suffix` is matched against the end of the asset name, `key`
   * labels its button. `lead` puts it first on the card: display order only,
   * the archive stays the release's canonical asset.
   */
  alt: { suffix: string, key: string, lead?: boolean } | null
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
