export type PlatformId = 'linux' | 'macos' | 'windows'

export interface Platform {
  id: PlatformId
  /** Shown on the card and the detect button. */
  label: string
  /** The `artifact` slug rox's release workflow puts in each asset name. */
  artifact: string
  /** What the user ends up with once the archive is open. */
  archive: string
  /** Message keys for the archive's install lines, one line each. */
  steps: string[]
  /**
   * Message key for the line under the card: the gatekeeping note on Windows'
   * unsigned builds, the package-manager pointer on Linux. Rendered through
   * `<Rich>`, so it can carry a link.
   */
  footnote: string | null
  /**
   * Message key for the archive's download button. `.short` on the same key is
   * what the format chip says, so a label and its chip can't drift apart.
   */
  cta: string
  /** The other artifacts beside the archive, in the order the card lists them. */
  alts: Alt[]
}

/**
 * One artifact beside the platform's archive: the .deb, the AppImage, the
 * Flatpak bundle, the Windows installer.
 *
 * `suffix` is matched against the end of the asset name, `key` labels its
 * button and, through `.short`, its chip, `steps` are its install lines, and
 * `lead` makes it the format the card opens on rather than the archive.
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
  steps: string[]
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
