import type { Platform } from '$types/release'

// The install steps mirror rox's README so the two never drift into telling
// people different things. The artifact slugs have to match the `artifact`
// values in rox's .github/workflows/release.yml matrix.
//
// Labels stay put: "Linux", "macOS" and "Windows" are names, and a page that
// translated them would be naming something else. Steps and caveats are prose,
// so they're keys.
export const PLATFORMS: Platform[] = [
  {
    id: 'linux',
    label: 'Linux',
    artifact: 'linux-x86_64',
    archive: 'tar.gz',
    steps: ['install-linux-1', 'install-linux-2'],
    caveat: null,
    // cargo-deb names it rox_<version>_amd64.deb, so the slug never appears.
    alt: { suffix: '_amd64.deb', key: 'download-alt-linux' },
  },
  {
    id: 'macos',
    label: 'macOS',
    artifact: 'macos-aarch64',
    archive: 'dmg',
    steps: ['install-macos-1', 'install-macos-2'],
    caveat: null,
    alt: null,
  },
  {
    id: 'windows',
    label: 'Windows',
    artifact: 'windows-x86_64',
    archive: 'zip',
    steps: ['install-windows-1', 'install-windows-2'],
    caveat: 'install-windows-caveat',
    alt: { suffix: '-setup.exe', key: 'download-alt-windows' },
  },
]

export const PLATFORM_BY_ID = Object.fromEntries(
  PLATFORMS.map(p => [p.id, p]),
) as Record<Platform['id'], Platform>
