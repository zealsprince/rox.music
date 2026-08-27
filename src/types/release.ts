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
  assets: ReleaseAsset[]
  /** True when the data came from the checked-in fallback, not the API. */
  stale: boolean
}
