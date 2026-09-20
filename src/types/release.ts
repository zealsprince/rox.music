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
   * "Download". Platforms carrying alts name every button so the set reads
   * as a choice.
   */
  cta: string | null
  /** The other artifacts beside the archive, in the order the card lists them. */
  alts: Alt[]
}

/**
 * One artifact beside the platform's archive: the .deb, the AppImage, the
 * Flatpak bundle, the Windows installer.
 *
 * `suffix` is matched against the end of the asset name, `key` labels its
 * button, and `lead` puts it first on the card, which is display order only
 * and leaves the archive as the release's canonical asset.
 *
 * `id` is the tail of this artifact's download-count channel id
 * (`linux-appimage`, `windows-alt`), so it outlives the filename the way
 * src/data/channels.ts requires. The .deb and the Windows installer are both
 * `alt` because that's what they have been counted under since the first
 * snapshot, and a rename would start a fresh series.
 */
export interface Alt {
  id: string
  suffix: string
  key: string
  lead?: boolean
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
  /**
   * A release candidate: tagged with a prerelease suffix (`v1.25.0-rc.1`)
   * and flagged as one on GitHub. Never the release the download buttons
   * hand out by default.
   */
  prerelease: boolean
  /** One per platform: the archive the platform card and CTA button link. */
  assets: ReleaseAsset[]
  /** The alt artifacts a release carries, in the order PLATFORMS declares them. */
  alts: ReleaseAsset[]
  /** True when the data came from the checked-in fallback, not the API. */
  stale: boolean
}
