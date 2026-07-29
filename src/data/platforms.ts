import type { Platform } from '$types/release'

// The install steps mirror rox's README so the two never drift into telling
// people different things. The artifact slugs have to match the `artifact`
// values in rox's .github/workflows/release.yml matrix.
export const PLATFORMS: Platform[] = [
  {
    id: 'linux',
    label: 'Linux',
    artifact: 'linux-x86_64',
    archive: 'tar.gz',
    steps: [
      'Unpack the tarball anywhere.',
      'Run ./rox.',
    ],
    caveat: null,
  },
  {
    id: 'macos',
    label: 'macOS',
    artifact: 'macos-aarch64',
    archive: 'dmg',
    steps: [
      'Open the DMG.',
      'Drag rox into Applications.',
    ],
    caveat: null,
  },
  {
    id: 'windows',
    label: 'Windows',
    artifact: 'windows-x86_64',
    archive: 'zip',
    steps: [
      'Unzip anywhere.',
      'Run rox.exe.',
    ],
    caveat: 'If SmartScreen objects, choose More info, then Run anyway.',
  },
]

export const PLATFORM_BY_ID = Object.fromEntries(
  PLATFORMS.map(p => [p.id, p]),
) as Record<Platform['id'], Platform>
