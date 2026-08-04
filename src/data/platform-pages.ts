import type { Platform } from '$types/release'

/**
 * The long-form platform pages.
 *
 * Content lives here rather than in three route files because the shell around
 * it is identical and the words are not. Every section below is written from
 * what rox actually does on that OS: the audio backend it opens, the desktop
 * integration it gets, and the things it still can't do there. Three pages of
 * the same copy with the platform name swapped would be a doorway set, which is
 * both a policy problem and a useless page. If a platform ever stops having
 * enough of its own to say, delete its entry rather than pad it.
 *
 * Sourced from the rox repo: `crates/rox-playback/src/output/` for the audio
 * backends, `crates/rox/src/integrations/` for tray and media controls,
 * `crates/rox/src/workspace/native_menu.rs` for the macOS menubar, and
 * `.github/workflows/release.yml` for what actually gets built and signed.
 */

export interface Section {
  heading: string
  /** Paragraphs, rendered in order. */
  body: string[]
  /** Optional shell block under the prose. */
  commands?: string[]
}

export interface PlatformPage {
  id: Platform['id']
  /** Full <title>, front-loading the words people search. */
  title: string
  description: string
  h1: string
  lede: string
  sections: Section[]
  /** Things a person would be annoyed to discover after downloading. */
  limits: string[]
  /**
   * The turn after the limits: what this platform gets that has no counterpart
   * to name. Deliberately different examples on every page. Repeating one pair
   * of features across all three would undo the thing that keeps these from
   * reading as one page with the OS swapped, and it's the section most likely
   * to slip into that, since a closing pitch is the easiest thing to template.
   */
  aside: string
}

export const PLATFORM_PAGES: Record<Platform['id'], PlatformPage> = {
  linux: {
    id: 'linux',
    title: 'rox - a native music player for Linux',
    description:
      'A native Linux music player for large local libraries. On the AUR and as a Nix '
      + 'flake, Wayland and X11, ALSA exclusive output, MPRIS media keys, and under a '
      + 'second to a window at 50,000 tracks.',
    h1: 'A music player for Linux that was built for Linux',
    lede:
      'Not a port, not an Electron wrapper, and not Foobar2000 under Wine. One native '
      + 'binary that treats Linux as a first-class target rather than the third one.',
    sections: [
      {
        heading: 'The problem it was written for',
        body: [
          'The good Linux players each give up something. Tauon\'s tagging is shallow. Strawberry isn\'t composable. Quod Libet isn\'t something anyone would theme. The stack that does panels, deep tagging and a theming story all at once has been stuck on Windows for twenty years.',
          'Running that stack through Wine works until it doesn\'t. A skin like CaTRoX is held together by stacked workarounds and, in places, Internet Explorer rendering inside panels. Through a translation layer it becomes obvious how much is luck, and every OS update is a chance to find out.',
          'rox is that shape written natively: forty panel types you arrange yourself, tag editing you can trust with a real collection, and themes that travel as a single file.',
        ],
      },
      {
        heading: 'Installing it',
        body: [
          'On Arch it\'s on the AUR as rox-player, co-maintained by the author. Any helper works, or clone and run makepkg -si yourself.',
          'The repo is also a flake, so Nix and NixOS get it without a package step. The first command runs rox without installing anything, the second puts it in your profile.',
          'Everywhere else, unpack the tarball and run ./rox. One binary, no installer, nothing left behind when you delete it.',
        ],
        commands: [
          'yay -S rox-player',
          'nix run github:zealsprince/rox',
          'nix profile install github:zealsprince/rox',
        ],
      },
      {
        heading: 'Wayland and X11',
        body: [
          'Both, natively, through gpui. Window decorations are a per-workspace setting rather than a compile-time decision, so you can run server-side decorations on one layout and a borderless one on the next without restarting into a different build.',
        ],
      },
      {
        heading: 'Exclusive output through ALSA',
        body: [
          'Exclusive mode opens the card directly as hw:CARD=x,DEV=n. That is the one ALSA name with no dmix, no plug and no sound server anywhere in the path, which is what makes it the only route that will refuse a rate it can\'t do rather than quietly resampling to something else.',
          'The trade is the honest one: while rox holds the card in exclusive mode, it holds it. Nothing else on the system plays through that device until you stop. rox tells you what the hardware actually agreed to rather than what you asked for, so a mismatch shows up as a number instead of as a suspicion.',
          'Shared mode is the default and behaves like every other application on your desktop.',
        ],
      },
      {
        heading: 'Desktop integration',
        body: [
          'Media keys and now-playing come through a real MPRIS service, so playerctl, the GNOME and KDE media widgets, and anything else speaking org.mpris.MediaPlayer2 all see it without configuration.',
          'The tray icon goes on the bus through StatusNotifierItem, which is what makes quit-to-tray safe: if no SNI host is running to receive it, closing the last window quits instead of stranding a headless process you can\'t get back to.',
        ],
      },
      {
        heading: 'The benchmarks are all Linux players',
        body: [
          'The comparison table on this site was run on Linux against Linux software: Elisa, fooyin, Quod Libet, Strawberry, Museeks and Tauon, all on one machine with the same 50,000-track library. rox gets a window up in 0.3 seconds and settles at 134 MB. The next lightest that finishes loading uses nearly three times the memory.',
        ],
      },
    ],
    limits: [
      'x86_64 only. There is no aarch64 Linux build, so ARM boards and Asahi need a source build.',
      'No plugin API, so nothing here replaces a specific Foobar2000 component you depend on.',
    ],
    aside:
      'Exclusive output that reports back what the card actually agreed to rather than '
      + 'what you asked it for, and a look you can build here and hand to someone running '
      + 'Windows. If that\'s the sort of thing Linux has had you going without, this is '
      + 'where it lives.',
  },

  windows: {
    id: 'windows',
    title: 'rox - a music player for Windows with no installer',
    description:
      'A native Windows music player for large local libraries. A zip with no installer, '
      + 'portable mode, WASAPI exclusive output, deep tag editing, and panels you compose '
      + 'yourself.',
    h1: 'A music player for Windows, from someone who left Windows',
    lede:
      'Windows is Foobar2000\'s home and it is very good there. This page is honest about '
      + 'that, and about the specific reasons you might still want rox.',
    sections: [
      {
        heading: 'Start with the awkward part',
        body: [
          'If you run Windows, your Foobar2000 setup is configured the way you like, and it has been stable for years, rox is not an upgrade. Foobar2000 has two decades of components, a smaller footprint, and no surprises left in it. Pretending otherwise on a page like this would be an easy way to waste your afternoon.',
          'The reasons to look anyway are narrow and real. You want the same player and the same layout on the Linux or Mac machine you also use. You want the source to be readable and the licence to be AGPL rather than closed freeware. Or you want a theming story where a whole look is one file you can send to someone, instead of a folder of components, configs and scripts that only reassembles on your machine.',
        ],
      },
      {
        heading: 'Installing it',
        body: [
          'Unzip anywhere and run rox.exe. There is no installer, no service, no uninstaller entry and nothing running in the background once it\'s closed.',
          'Portable mode keeps the library, settings and caches in a rox-data folder next to the executable, so the whole thing lives on a stick. Pass --portable for one run, or drop an empty file named portable beside the executable to make it permanent.',
          'The binary isn\'t code-signed, so SmartScreen will object the first time. More info, then Run anyway. Signing certificates cost money that a free player doesn\'t have, and saying so is better than pretending the warning is a bug.',
        ],
        commands: [
          'rox.exe --portable',
        ],
      },
      {
        heading: 'Exclusive output through WASAPI',
        body: [
          'Exclusive mode takes the endpoint in WASAPI exclusive, which puts the file\'s own rate and bit depth in front of the converter with nothing in between. rox reports back what the device actually accepted, so if the hardware quietly refused your 192 kHz you find out from a readout rather than from a forum argument.',
          'While it holds the endpoint, nothing else on the machine plays through that device. That is what exclusive means and it is the reason it isn\'t the default.',
        ],
      },
      {
        heading: 'The rest of the Windows integration',
        body: [
          'Media keys and the now-playing overlay come through SMTC, the same system surface built-in apps use, so the volume-key panel shows the track and the transport buttons work.',
        ],
      },
    ],
    limits: [
      'No tray icon. Quit-to-tray exists on Linux and macOS; on Windows, closing the last window quits.',
      'No single-instance guard. On Linux and macOS a second launch hands its files to the running rox; on Windows it starts a second copy.',
      'x86_64 only, and the binary is unsigned, so expect SmartScreen once.',
      'No plugin API, so a specific Foobar2000 component has no equivalent here.',
    ],
    aside:
      'Whatever you build here is one file, and it opens the same on the Linux or Mac '
      + 'machine sitting next to it. If a setup you spent a weekend on has ever been '
      + 'stranded on one operating system, that\'s the part worth an afternoon.',
  },

  macos: {
    id: 'macos',
    title: 'rox - a native music player for macOS',
    description:
      'A native macOS music player for large local libraries. Apple Silicon, signed and '
      + 'notarized, menus in the system bar, CoreAudio exclusive output, and deep tag '
      + 'editing.',
    h1: 'A native music player for macOS',
    lede:
      'Foobar2000 has a real Mac build now. What it doesn\'t have on the Mac is the reason '
      + 'people configured it on Windows.',
    sections: [
      {
        heading: 'The gap on the Mac specifically',
        body: [
          'Foobar2000 v2 ships an official macOS version, and this page isn\'t going to pretend it doesn\'t. The catch is that the component and skin ecosystem, the thing that made a Windows install worth a weekend of configuring, is Windows-side. On a Mac you get the player without the ecosystem that justified choosing it.',
          'rox puts the composition and theming back: forty panel types arranged how you want, duplicated with their own configs, popped out into real windows, and a whole look stored as one shareable file. One of the six shipped workspaces is a CaTRoX recreation, which is a fair statement of what it\'s aiming at.',
        ],
      },
      {
        heading: 'Installing it',
        body: [
          'Open the DMG and drag rox into Applications. Releases are code-signed with an Apple Developer ID and notarized, so Gatekeeper lets it open without a right-click-open dance or a trip to the security pane.',
        ],
      },
      {
        heading: 'It behaves like a Mac application',
        body: [
          'The menus live in the system menu bar where macOS expects them, not in a bar drawn inside the window. The green button does native fullscreen, and holding Option gets you zoom instead.',
          'Closing the last window leaves rox in the dock rather than quitting, which is the platform convention and the macOS half of the quit-to-tray behaviour.',
        ],
      },
      {
        heading: 'Exclusive output through CoreAudio',
        body: [
          'Exclusive mode drives the device through CoreAudio at the file\'s own rate, and reports what the hardware agreed to rather than what was requested. Useful mostly if you have a DAC worth the trouble, and off by default because taking a device away from the rest of the system should be a decision you made on purpose.',
        ],
      },
    ],
    limits: [
      'Apple Silicon only. There is no Intel build, so an Intel Mac needs a source build.',
      'Building from source needs Xcode, nix or not: gpui compiles Metal shaders at build time and nix cannot ship Apple\'s Metal toolchain.',
      'No plugin API, so a specific Foobar2000 component has no equivalent here.',
    ],
    aside:
      'Menus where macOS puts them, forty panel types to arrange however you like, and six '
      + 'complete looks a click away on the welcome window. If configuring the player is '
      + 'the part you actually enjoy, that\'s what\'s here.',
  },
}
