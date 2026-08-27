import type { Platform } from '$types/release'

/**
 * The long-form platform pages.
 *
 * The shape lives here and the words live in the catalogs. Only the frame is
 * shared between the three pages: every sentence is written from what rox
 * actually does on that OS, and three pages of the same copy with the platform
 * name swapped would be a doorway set, which is both a policy problem and a
 * useless page. If a platform ever stops having enough of its own to say,
 * delete its entry rather than pad it.
 *
 * Sourced from the rox repo: `crates/rox-playback/src/output/` for the audio
 * backends, `crates/rox/src/integrations/` for tray and media controls,
 * `crates/rox/src/workspace/native_menu.rs` for the macOS menubar, and
 * `.github/workflows/release.yml` for what actually gets built and signed.
 */

export interface Section {
  /** Message key for the heading. */
  heading: string
  /** Message keys, one paragraph each, rendered in order. */
  body: string[]
  /** Optional shell block under the prose, identical in every language. */
  commands?: string[]
}

export interface PlatformPage {
  id: Platform['id']
  /**
   * Message key carrying this page's framing: value is the full `<title>`,
   * front-loading the words people search, with `.description`, `.h1`, `.lede`
   * and `.aside` as attributes.
   *
   * `.aside` is the turn after the limits: what this platform gets that has no
   * counterpart to name. Deliberately different examples on every page.
   * Repeating one pair of features across all three would undo the thing that
   * keeps these from reading as one page with the OS swapped, and it's the
   * section most likely to slip into that, since a closing pitch is the easiest
   * thing to template.
   */
  key: string
  sections: Section[]
  /** Message keys. Things a person would be annoyed to discover after downloading. */
  limits: string[]
}

export const PLATFORM_PAGES: Record<Platform['id'], PlatformPage> = {
  linux: {
    id: 'linux',
    key: 'linux',
    sections: [
      {
        heading: 'linux-why',
        body: ['linux-why-1', 'linux-why-2', 'linux-why-3'],
      },
      {
        heading: 'linux-install',
        body: ['linux-install-1', 'linux-install-2', 'linux-install-3'],
        commands: [
          'yay -S rox-player',
          'nix run github:zealsprince/rox',
          'nix profile install github:zealsprince/rox',
        ],
      },
      {
        heading: 'linux-display',
        body: ['linux-display-1'],
      },
      {
        heading: 'linux-alsa',
        body: ['linux-alsa-1', 'linux-alsa-2', 'linux-alsa-3'],
      },
      {
        heading: 'linux-desktop',
        body: ['linux-desktop-1', 'linux-desktop-2'],
      },
      {
        heading: 'linux-benchmarks',
        body: ['linux-benchmarks-1'],
      },
    ],
    limits: ['linux-limit-arch', 'linux-limit-plugins'],
  },

  windows: {
    id: 'windows',
    key: 'windows',
    sections: [
      {
        heading: 'windows-awkward',
        body: ['windows-awkward-1', 'windows-awkward-2'],
      },
      {
        heading: 'windows-install',
        body: ['windows-install-1', 'windows-install-2', 'windows-install-3'],
        commands: ['rox.exe --portable'],
      },
      {
        heading: 'windows-wasapi',
        body: ['windows-wasapi-1', 'windows-wasapi-2'],
      },
      {
        heading: 'windows-integration',
        body: ['windows-integration-1', 'windows-integration-2'],
      },
    ],
    limits: ['windows-limit-instance', 'windows-limit-signing', 'windows-limit-plugins'],
  },

  macos: {
    id: 'macos',
    key: 'macos',
    sections: [
      {
        heading: 'macos-gap',
        body: ['macos-gap-1', 'macos-gap-2'],
      },
      {
        heading: 'macos-install',
        body: ['macos-install-1'],
      },
      {
        heading: 'macos-native',
        body: ['macos-native-1', 'macos-native-2'],
      },
      {
        heading: 'macos-coreaudio',
        body: ['macos-coreaudio-1'],
      },
    ],
    limits: ['macos-limit-silicon', 'macos-limit-xcode', 'macos-limit-plugins'],
  },
}
