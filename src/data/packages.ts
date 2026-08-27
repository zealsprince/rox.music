export interface PackageSource {
  id: string
  /** Distro name. A name, not copy. */
  name: string
  /**
   * Message key. Value is the scope line beside the name, `.body` the prose
   * under the commands, `.caveat` the fine print where there is any, and
   * `.link` the label on the outbound link.
   */
  key: string
  /** Shell lines, rendered as one block. The same in every language. */
  commands: string[]
  /** Whether this entry carries a `.caveat` attribute. */
  caveat: boolean
  href: string
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
    key: 'package-aur',
    commands: ['yay -S rox-player'],
    caveat: false,
    href: 'https://aur.archlinux.org/packages/rox-player',
  },
  {
    id: 'nix',
    name: 'Nix and NixOS',
    key: 'package-nix',
    commands: [
      'nix run github:zealsprince/rox',
      'nix profile install github:zealsprince/rox',
    ],
    caveat: false,
    href: 'https://github.com/zealsprince/rox/blob/main/flake.nix',
  },
]
