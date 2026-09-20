import type { PlatformId } from '../types/release'
import { PLATFORMS } from './platforms'

/**
 * A distributable artifact, counted across every release rox has ever shipped.
 *
 * Derived from PLATFORMS rather than written out, because the suffixes are the
 * same ones the download cards match on and a second copy of `_amd64.deb` is a
 * second thing to fix the day cargo-deb renames it.
 *
 * The `id` is what lands in the history file, so it has to outlive the asset
 * name it stands for. `macos-archive` keeps counting the Mac build when the dmg
 * goes universal and the suffix changes; an id derived from the filename would
 * quietly start a new series instead. For the same reason the .deb and the
 * Windows installer stay `linux-alt` and `windows-alt` now that a platform can
 * carry several alts: those two ids have been in the history file since the
 * first snapshot, and renaming either one would fork its series in place.
 *
 * Relative imports, no `$` aliases: scripts/snapshot-downloads.ts runs this
 * under tsx, outside Vite, where the aliases don't resolve. Same reason
 * src/data/images.ts is written the way it is.
 */
export interface Channel {
  id: string
  platform: PlatformId
  /** Matched against the end of an asset name. */
  suffix: string
}

export const CHANNELS: Channel[] = PLATFORMS.flatMap(platform => [
  {
    id: `${platform.id}-archive`,
    platform: platform.id,
    suffix: `${platform.artifact}.${platform.archive}`,
  },
  ...platform.alts.map(alt => ({
    id: `${platform.id}-${alt.id}`,
    platform: platform.id,
    suffix: alt.suffix,
  })),
])

export const CHANNEL_IDS = CHANNELS.map(channel => channel.id)

export function channelsFor(platform: PlatformId): Channel[] {
  return CHANNELS.filter(channel => channel.platform === platform)
}
