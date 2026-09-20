// Relative rather than `$types/release`: src/data/channels.ts derives the
// download channels from this list and has to import under tsx as well as under
// Vite, and the alias only exists in one of the two.
import type { Platform } from '../types/release'

// The install steps mirror rox's README so the two never drift into telling
// people different things. The artifact slugs have to match the `artifact`
// values in rox's .github/workflows/release.yml matrix.
//
// Labels stay put: "Linux", "macOS" and "Windows" are names, and a page that
// translated them would be naming something else. Steps and caveats are prose,
// so they're keys.
//
// Linux ships four artifacts and the card lists all four, because a visitor on
// a Flatpak distro who only sees a tarball concludes there isn't one.

/** The Linux artifact slug, shared by the tarball and the AppImage. */
const LINUX = 'linux-x86_64'

export const PLATFORMS: Platform[] = [
  {
    id: 'linux',
    label: 'Linux',
    artifact: LINUX,
    archive: 'tar.gz',
    steps: ['install-linux-1', 'install-linux-2', 'install-linux-3', 'install-linux-4'],
    caveat: null,
    cta: 'download-btn-tarball',
    alts: [
      // cargo-deb names it rox_<version>_amd64.deb, so the slug never appears.
      { id: 'alt', suffix: '_amd64.deb', key: 'download-btn-deb' },
      { id: 'appimage', suffix: `${LINUX}.AppImage`, key: 'download-btn-appimage' },
      // The bundle carries its own slug rather than the Linux one, because the
      // Flatpak is built in a container of its own.
      { id: 'flatpak', suffix: 'flatpak-x86_64.flatpak', key: 'download-btn-flatpak' },
    ],
  },
  {
    id: 'macos',
    label: 'macOS',
    artifact: 'macos-aarch64',
    archive: 'dmg',
    steps: ['install-macos-1', 'install-macos-2'],
    caveat: null,
    cta: null,
    alts: [],
  },
  {
    id: 'windows',
    label: 'Windows',
    artifact: 'windows-x86_64',
    archive: 'zip',
    steps: ['install-windows-1', 'install-windows-2'],
    caveat: 'install-windows-caveat',
    cta: 'download-btn-portable',
    // The installer leads: per-user install, Start menu entry, in-place
    // upgrades. The zip stays for people who want portable mode.
    alts: [
      { id: 'alt', suffix: '-setup.exe', key: 'download-btn-installer', lead: true },
    ],
  },
]

export const PLATFORM_BY_ID = Object.fromEntries(
  PLATFORMS.map(p => [p.id, p]),
) as Record<Platform['id'], Platform>
