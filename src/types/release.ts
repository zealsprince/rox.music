export type PlatformId = 'linux' | 'macos' | 'windows'

export interface Platform {
  id: PlatformId
  /** Shown on the card and the detect button. */
  label: string
  /** The `artifact` slug rox's release workflow puts in each asset name. */
  artifact: string
  /** What the user ends up with once the archive is open. */
  archive: string
  /** Install steps, one line each, rendered as an ordered list. */
  steps: string[]
  /** The gatekeeping note for unsigned builds, or null where there isn't one. */
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
