export interface PackageSource {
  id: string
  name: string
  /** Which platforms this actually covers, stated plainly. */
  scope: string
  /** Shell lines, rendered as one block. */
  commands: string[]
  /** Prose under the block. Kept short; the caveat carries the fine print. */
  body: string
  /** Something a user would be annoyed to discover after installing. */
  caveat: string | null
  link: { href: string, label: string }
}

// Verified against the real sources rather than written from memory:
//
//   AUR   rox-player 1.5.0-1, AGPL-3.0-only, source build (makedepends cargo,
//         clang, gcc). Checked via the AUR RPC. Co-maintained by Andrew.
//   Nix   `nix eval .#packages.x86_64-linux.default.name` on the rox repo
//         returns rox-1.5.0, so the commands below hit a real derivation.
//
// Nothing here names a platform. The flake decides what it builds for, and
// repeating that list on a marketing page only creates something to forget.
export const PACKAGES: PackageSource[] = [
  {
    id: 'aur',
    name: 'Arch Linux',
    scope: 'AUR, builds from source',
    commands: [
      'yay -S rox-player',
    ],
    body:
      'On the AUR as rox-player, co-maintained by the rox author. Any AUR helper '
      + 'works, or clone the package and run makepkg -si yourself.',
    caveat: null,
    link: {
      href: 'https://aur.archlinux.org/packages/rox-player',
      label: 'rox-player on the AUR',
    },
  },
  {
    id: 'nix',
    name: 'Nix and NixOS',
    // Deliberately says nothing about which platforms the flake covers. It is
    // gaining darwin, and a platform list here would go stale the moment that
    // lands. The flake is the source of truth; let it be.
    scope: 'straight from the flake',
    commands: [
      'nix run github:zealsprince/rox',
      'nix profile install github:zealsprince/rox',
    ],
    body:
      'The repo is a flake. The first command runs rox without installing '
      + 'anything, the second puts it in your profile. On NixOS, add the flake as '
      + 'an input and pull in packages.default, or use the overlay it exports.',
    caveat: null,
    link: {
      href: 'https://github.com/zealsprince/rox/blob/main/flake.nix',
      label: 'flake.nix',
    },
  },
]
