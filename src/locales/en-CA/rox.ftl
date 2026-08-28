# rox.music, source locale.
#
# en-CA because the app's is: the spelling is already Canadian ("favourite"),
# and every other locale falls back here, so this file is the one that has to
# carry every key. crates/rox-i18n/locales/en-CA/rox.ftl is its opposite number
# in the app; a string that exists in both should carry the same key.
#
# Keys are surface-prefixed kebab-case, one prefix per page or component. A
# label's supporting line rides it as an attribute rather than taking a key of
# its own, so the pair moves together.
#
# Messages may carry [links](/paths), [aliases](@repo), `code`, **bold** and
# _italic_. See renderRich in src/lib/i18n. A bare URL is fine; an alias is
# better for anything linked more than once, because a URL written here is a URL
# written four times.

## Chrome

skip-to-content = Skip to content

nav-home = rox home
nav-main = Main
nav-download = Download
nav-workspaces = Workspaces
nav-more = More
nav-github = rox on GitHub
    .stars = rox on GitHub, { $stars } stars

language-picker = Language
# The last row of the language menu, and the only one that leaves the site. It
# goes to the Weblate project, where a missing language is something the reader
# can start rather than request.
language-missing = Can't find your language?
theme-toggle = Toggle theme
    .label = Toggle light and dark theme

footer-credit = rox is built by [Andrew Lake (zealsprince)](@author) in Rust on [gpui](@gpui), the UI framework behind [Zed](@zed). Free and open source under the [AGPL-3.0](@license).
footer-nav = Footer
footer-source = Source
footer-irc = IRC
footer-irc-direct = Direct
footer-irc-web = Webchat
footer-bug = Report a bug
footer-translate = Help translate

## The site itself

# The search-facing title, not the voice line. "If Foobar2000 was made in the
# current year" is the better sentence and it stays as the h1 and on the social
# card, where a human reads it. Nobody types it into Google.
#
# This targets "foobar2000 alternative", which is a real query rox can win.
# "linux music player" is not winnable against twenty years of listicles, and
# chasing it would cost the one term that actually converts. 59 characters in
# English, so it survives Google's display width intact; a translation has the
# same budget, and losing a platform name is the cheapest way to make room.
site-tagline = rox - a Foobar2000 alternative for Linux, macOS and Windows

# Under 160 characters, so Google shows the whole thing instead of cutting it
# mid-clause. The platforms are already in the title, which buys the room for
# what the title can't say.
site-description = A native music player for large, carefully tagged local libraries. Compose your own panels, share themes as files, and stay fast at 50,000 tracks.

social-image-alt = The rox logo above the words: if Foobar2000 was made in the current year

# The count of shipped workspaces, spelled out. A numeral under ten reads as a
# spec sheet in the middle of a sentence, and which numerals get spelled out is
# a per-language call, so it happens here. Every sentence that mentions the
# count says { workspace-count } and passes $count along.
workspace-count = { $count ->
    [1] one
    [2] two
    [3] three
    [4] four
    [5] five
    [6] six
    [7] seven
    [8] eight
    [9] nine
   *[other] { $count }
}

## Claims in the structured data graph

app-feature-panels = Composable panel UI with pop-out windows
app-feature-workspaces = Shareable workspaces carrying layout, palette and appearance
app-feature-tagging = Deep tag editing with atomic writes and batch edits
app-feature-gapless = Gapless playback
app-feature-dsp = Equalizer, crossfade and ReplayGain
app-feature-exclusive = Exclusive bit-perfect output
app-feature-lyrics = Synced lyrics
app-feature-scrobbling = Last.fm scrobbling

## Home

home-hero = If Foobar2000 was made in the current year.
    .lede = A desktop music player for people with large, carefully tagged local libraries. You build the panels yourself, and a theme is one file you can hand to someone else. Native on Linux, macOS and Windows.
    .alt = rox running the NekoRoX-style default workspace, showing the library, cover art, queue and a spectrum panel

home-speed = Under a second to a window
    .body = rox ships as one binary and starts before you've let go of the mouse.

home-features = What's in it

home-closer = Make it yours
    .body = There are { workspace-count } workspaces in the box, one click away on the welcome window. Each one is a single file carrying the layout, the palette and the shaders it runs, so you can edit it, break it, and hand it to someone else. [See them all](/workspaces).

## The benchmark table

benchmark-caption = Startup, memory and idle CPU across seven music players on one 50,000-track library
benchmark-player = Player
benchmark-window-up = Window up
benchmark-loaded = Fully loaded
benchmark-memory = Memory
benchmark-idle-cpu = Idle CPU
benchmark-never-settles = never settles

benchmark-method = I measured all of these myself, on one machine (Ryzen 9 5950X, Linux/Wayland) with the same 50k-track library on an external SSD, every player through the same harness with its library loaded. Memory is PSS across the full process tree. "Loaded" is when CPU settles after launch; idle is a paused player with the window visible.
    .deadbeef = [DeaDBeeF](@deadbeef) would have sat at 44 MB and won on memory, but it never got a row: its MP3 parser segfaults partway through importing this library, every attempt. rox indexes all 50,000 tracks, including the truncated files that trip it.

## The feature grid

features-library = Library
features-playback = Playback
features-looks = Looks
features-daily = Day to day

feature-library = A library that holds up
    .body = A parallel scanner reads full tags, true durations and each file's own codec, not a header skim. Folder watching survives renames, and nothing drops silently.
    .link = What breaks at 50,000 tracks

feature-tagging = Tagging you can trust
    .body = A full editor with atomic writes and batch edits. Ratings live in the files themselves via FMPS and POPM. Lookup through MusicBrainz, iTunes and Deezer.
    .link = Next to Mp3tag

feature-cue = Cue rips play like tracks
    .body = A whole-disc FLAC beside its cue sheet indexes as real rows. Each span seeks, scrobbles, sorts and runs into the next one gaplessly, the way a file does.
    .link = How the spans work

feature-gapless = Gapless playback
    .body = One stream, with shuffle, repeat and play-next. It recovers when an audio device disappears, and media keys and now-playing work on all three platforms.

feature-equalizer = Ten bands and bit-perfect
    .body = An equalizer in a window of its own, crossfade that leaves an album's own splices alone, and exclusive output that says what the hardware agreed to.
    .link = ReplayGain and bit-perfect

feature-similarity = Sorted by how it sounds
    .body = rox describes your tracks off their own audio, tempo included, and orders what's next by resemblance. It runs on your machine against your files, no service in the loop.

feature-panels = Panels you compose
    .body = Forty-odd panel types, from library and queue to artist grids, spectrum and VU. Duplicate one with its config, save it as a preset, or pop it out into a window.
    .link = Next to Foobar2000

feature-themes = Themes as shareable files
    .body = A workspace is one file carrying layout, palette, appearance and shaders. Palettes can tint from the playing cover, going light or dark with the art.
    .link = The { workspace-count } in the box

feature-shaders = Visuals that listen
    .body = Write a WGSL shader over one panel or the whole window. Named signals off the spectrum ride its inputs, so a kick band drives whichever knob you point it at.
    .link = Shaders and signals

feature-lyrics = Lyrics and history
    .body = Synced or plain, from sidecar files, tags or lrclib, with an editor that writes back where it read. A listen log drives the history panel, stats and scrobbling.

feature-playlists = Playlists that survive
    .body = Favourites, drag reorder, m3u in and out, and smart playlists that re-run a saved query rather than hold a snapshot. Entries survive a file leaving and returning.

feature-binary = One binary, no installer
    .body = A tarball, a DMG or a zip, plus the AUR and a Nix flake. Portable mode keeps the library and settings in a folder beside the executable.
    .link = Get it

## The download button, wherever it appears

download-cta = Download rox
# %s is where enhance.js puts the detected platform name. Keep it: the script
# has no locale and can only substitute, so the word order has to be here.
download-cta-detected = Download for %s
download-packaged = On Arch or NixOS? [Install it from the AUR or the Nix flake](/download#packages) instead.
download-meta = v{ $version } · Linux, macOS, Windows · [all downloads](@releases)

## Download

download-title = Download rox for Linux, macOS or Windows
    .description = Download rox free for Linux, macOS or Windows. One binary per platform, no installer and no account. Open source under the AGPL.
    .image-alt = The rox logo above the words: download for Linux, macOS and Windows

download-h1 = Download rox
    .lede = One binary per platform. No installer, no account, nothing running in the background when it's closed.

download-released = released { $date }
download-notes = release notes
download-missing = No { $platform } build in this release. [Check the releases page](@releases).

install-linux-1 = Unpack the tarball anywhere.
install-linux-2 = Run `./rox`.
install-macos-1 = Open the DMG.
install-macos-2 = Drag rox into Applications.
install-windows-1 = Unzip anywhere.
install-windows-2 = Run `rox.exe`.
install-windows-caveat = If SmartScreen objects, choose More info, then Run anyway.

download-packages = Package managers
    .body = Two routes that keep rox updated alongside the rest of your system.

package-aur =
    .scope = AUR, builds from source
    .body = On the AUR as `rox-player`, co-maintained by the rox author. Any AUR helper works, or clone the package and run `makepkg -si` yourself.
    .link = rox-player on the AUR

package-nix =
    .scope = straight from the flake
    .body = The repo is a flake. The first command runs rox without installing anything, the second puts it in your profile. On NixOS, add the flake as an input and pull in `packages.default`, or use the overlay it exports.
    .link = flake.nix

download-cli = Running it from a terminal
    .body = Pass rox files or folders and it plays them now, replacing what's loaded. Folders expand to the audio files directly inside them.
    .flags = `--enqueue` (or `-e`) appends to the up-next queue instead of playing. `--portable` keeps the library, settings and caches in a `rox-data` folder beside the executable for that run. To stay portable across launches, drop an empty file named `portable` next to the executable, or flip the toggle in the Behavior settings.

download-build = Building it yourself
    .body = With Nix, `nix develop` then `cargo run` gets you a dev shell carrying the Rust toolchain and the libraries gpui loads at runtime. Without Nix you need stable Rust and gpui's system libraries from your distro. The [development section of the README](@readme-dev) has the full list.

## Workspaces

workspaces-title = rox workspaces - shareable themes and layouts
    .description = A rox workspace is a whole look in one shareable file: layout, palette, appearance and the shaders it runs. They ship from a Foobar2000 tribute to a player rendered entirely in 1-bit dither.
    .image-alt = The rox logo above the words: a whole look in one shareable file

workspaces-lede = A workspace is a whole look in one file: layout, palette, appearance, and any shaders it runs, carried inline so an imported look arrives complete. Load one from the welcome window or settings, change anything you like, and hand the file to someone else to get the same thing back. These { workspace-count } ship in the box.

workspaces-critters = How Critters does that
    .body = A workspace carries its shaders inline, source and image assets both, so a look that renders the whole app as a 1-bit print imports whole rather than arriving as a reference to a file on somebody else's machine. Nothing runs until you approve it. [Shaders and signals](/music-visualizer).

workspace-default = What rox looks like out of the box: translucent surfaces, art tinting off.
    .alt = The Default rox workspace: a cover art grid beside a playlist with star ratings, an amber waveform seek bar along the bottom and tabs for biography, lyrics and metadata.

workspace-foobar = The layout this whole project is an argument with. Opaque, dense, OS decorations on, menubar where it always was.
    .alt = The Foobar rox workspace: a classic foobar2000 layout with a menubar, artist and album filter columns, a dense track table with play counts and ratings, and cover art bottom left.

workspace-catrox = The CaTRoX foobar2000 skin you know and love that started it all.
    .alt = The CaTRoX rox workspace: the foobar2000 skin recreated, with a circular CD render of the cover, a metadata field list down the left and album-grouped tracks with rating dots.

workspace-llama = WinAmp, in the way you remember it rather than the way it was. Tahoma, dark, no chrome.
    .alt = The Llama rox workspace: a Winamp-style dotted spectrum analyzer across the top, green transport controls and a dense track list below, with no window chrome.

workspace-metro = Flat panels and comfortable rows with art theming on, so the palette follows whatever cover is playing.
    .alt = The Metro rox workspace: a full-width grid of album covers with titles beneath, and an artist biography panel on the right carrying a photo, genre tags and listener counts.

workspace-phosphor = Monospace everything. Consolas, no cover in quick play, a terminal that happens to play music.
    .alt = The Phosphor rox workspace: green-on-black monospace throughout, a folder tree beside a track table and a green waveform across the bottom, like a terminal that plays music.

workspace-critters = The whole app as a 1-bit print. An ordered dither over every surface, tones crushing with the sub-bass, and a noise wall behind the panels that moves with the song.
    .alt = The Critters rox workspace: the entire window rendered in black-and-white ordered dither, with a curved shelf of album covers over a seek bar, transport row, waveform strip and track table, all sitting on a shifting field of noise.

workspace-diffuse = Just the album that's playing, over a soft wash of its own cover. Monochrome on purpose, so the art carries the colour, and the library waits in a drawer on the right edge.
    .alt = The Diffuse rox workspace: one large album cover filling the left of the window against a blurred gradient of the same art, with the track title, artist and album beside it over a thin seek line, a row of transport buttons and a volume slider.

## More

more-title = More about rox
    .description = The pages that sit off the main nav: the Foobar2000 comparison, what to look for in a music player for a local library, and how rox works on each of Linux, macOS and Windows.

more-lede = The pages that don't belong in the nav, kept somewhere findable instead of deleted.

more-why = Why these are here
    .p1 = These exist to be found. Someone searching for a Foobar2000 alternative on Linux in { $year }, or working out which player survives a library this size, should land somewhere that answers them rather than on a homepage written for people who already know what rox is.
    .p2 = They're off the nav on purpose. The main site is three pages: what rox is, how to get it, what it looks like. Stacking the rest into the header would make the thing you came for harder to find, which is a bad trade for everyone who arrived already knowing.
    .p3 = You might know all of this about rox and Foobar2000 already. Plenty of people landing here won't, and they're who these are for. Each one says where rox loses as well as where it wins, and repeats nothing you'd get from the [homepage](/).

more-pages = The pages
more-closer = If you'd rather skip all of it, the [download page](/download) is two clicks from a running player, and the [source](@repo) is the most honest documentation here.

## The pages off the nav, as the hub and the sitemap list them

page-foobar2000-alternative = The Foobar2000 alternative
    .blurb = What Foobar2000 got right, where it leaves you, and what rox does about it. Includes where Foobar2000 is still ahead.

page-catrox = CaTRoX, rebuilt native
    .blurb = The foobar2000 theme that started this, who made it, and what it took to get the look running without Windows underneath.

page-nekorox = NekoRoX, and where it went
    .blurb = The CaTRoX fork I maintained for a decade, why it stopped, and which of its panels exist in rox today. Includes AlphaRoX, the light one.

page-music-visualizer = The visualizer, and the layer under it
    .blurb = Spectrum and waveform panels, WGSL shaders over any panel or the whole window, and the named signals off the audio that drive them.

page-cue-sheets = FLAC and CUE rips
    .blurb = A whole-disc image and its sheet, indexed as real tracks that seek, sort, scrobble and run gaplessly into each other.

page-mp3tag-alternative = An Mp3tag alternative for Linux
    .blurb = Batch edits, a per-file grid, and a write path that copies, verifies and renames rather than editing your files in place.

page-musicbee-alternative = A MusicBee alternative
    .blurb = What MusicBee does that rox does not, what rox does that MusicBee cannot, and why the honest answer depends on your OS.

page-replaygain = ReplayGain, and what it costs
    .blurb = What ReplayGain actually does, track versus album gain, measuring the files nobody tagged, and why turning it on means giving up bit-perfect.

page-best-music-player = The best music player for a local library
    .blurb = What actually separates players once your library is real, and how the field measures up on a 50,000-track collection.

page-linux = rox on Linux
    .blurb = AUR and Nix, Wayland and X11, ALSA exclusive output, MPRIS media keys, and the benchmark table that is all Linux players.

page-windows = rox on Windows
    .blurb = A zip with no installer, portable mode, WASAPI exclusive output, and an honest read on competing with Foobar2000 on its home turf.

page-macos = rox on macOS
    .blurb = Apple Silicon, signed and notarized, menus in the system bar, CoreAudio exclusive output.

## Not found

notfound-title = Page not found
    .description = That page does not exist on rox.music.
notfound-h1 = Nothing here
notfound-nav = Recovery

## The three platform pages, shared frame

platform-breadcrumb = rox on { $platform }
platform-limits = What it can't do on { $platform }
platform-closer = Point it at your library
    .body = Free and open source under the AGPL. No account, and nothing running in the background when it's closed.
platform-more = More on [what it looks like](/workspaces), the [full Foobar2000 comparison](/foobar2000-alternative), or what the exclusive output above is actually doing, under [ReplayGain and bit-perfect](/replaygain).

## Linux

linux = rox - a native music player for Linux
    .description = A native Linux music player for large local libraries. On the AUR and as a Nix flake, Wayland and X11, ALSA exclusive output, MPRIS media keys, and under a second to a window at 50,000 tracks.
    .h1 = A music player for Linux that was built for Linux
    .lede = Not a port, not an Electron wrapper, and not Foobar2000 under Wine. One native binary that treats Linux as a first-class target rather than the third one.
    .aside = Exclusive output that reports back what the card actually agreed to rather than what you asked it for, and a look you can build here and hand to someone running Windows. If that's the sort of thing Linux has had you going without, this is where it lives.
    .siblings = Same player on [Windows](/windows) and [macOS](/macos).

linux-why = The problem it was written for
linux-why-1 = The good Linux players each give up something. Tauon's tagging is shallow. Strawberry isn't composable. Quod Libet isn't something anyone would theme. The stack that does panels, deep tagging and a theming story all at once has been stuck on Windows for twenty years.
linux-why-2 = Running that stack through Wine works until it doesn't. A skin like CaTRoX is held together by stacked workarounds and, in places, Internet Explorer rendering inside panels. Through a translation layer it becomes obvious how much is luck, and every OS update is a chance to find out.
linux-why-3 = rox is that shape written natively: around forty panel types you arrange yourself, tag editing you can trust with a real collection, and themes that travel as a single file.

linux-install = Installing it
linux-install-1 = On Arch it's on the AUR as `rox-player`, co-maintained by the author. Any helper works, or clone and run `makepkg -si` yourself.
linux-install-2 = The repo is also a flake, so Nix and NixOS get it without a package step. The first command runs rox without installing anything, the second puts it in your profile.
linux-install-3 = Everywhere else, unpack the tarball and run `./rox`. One binary, no installer, nothing left behind when you delete it.

linux-display = Wayland and X11
linux-display-1 = Both, natively, through gpui. Window decorations are a per-workspace setting rather than a compile-time decision, so you can run server-side decorations on one layout and a borderless one on the next without restarting into a different build.

linux-alsa = Exclusive output through ALSA
linux-alsa-1 = Exclusive mode opens the card directly as `hw:CARD=x,DEV=n`. That is the one ALSA name with no dmix, no plug and no sound server anywhere in the path, which is what makes it the only route that will refuse a rate it can't do rather than quietly resampling to something else.
linux-alsa-2 = The trade is the honest one: while rox holds the card in exclusive mode, it holds it. Nothing else on the system plays through that device until you stop. rox tells you what the hardware actually agreed to rather than what you asked for, so a mismatch shows up as a number instead of as a suspicion.
linux-alsa-3 = Shared mode is the default and behaves like every other application on your desktop.

linux-desktop = Desktop integration
linux-desktop-1 = Media keys and now-playing come through a real MPRIS service, so playerctl, the GNOME and KDE media widgets, and anything else speaking `org.mpris.MediaPlayer2` all see it without configuration.
linux-desktop-2 = The tray icon goes on the bus through StatusNotifierItem, which is what makes quit-to-tray safe: if no SNI host is running to receive it, closing the last window quits instead of stranding a headless process you can't get back to.

linux-benchmarks = The benchmarks are all Linux players
linux-benchmarks-1 = The comparison table on this site was run on Linux against Linux software: Elisa, fooyin, Quod Libet, Strawberry, Museeks and Tauon, all on one machine with the same 50,000-track library. rox gets a window up in 0.3 seconds and settles at 134 MB. The next lightest that finishes loading uses nearly three times the memory.

linux-limit-arch = x86_64 only. There is no aarch64 Linux build, so ARM boards and Asahi need a source build.
linux-limit-plugins = No plugin API, so nothing here replaces a specific Foobar2000 component you depend on.

## Windows

windows = rox - a music player for Windows with no installer
    .description = A native Windows music player for large local libraries. A zip with no installer, portable mode, WASAPI exclusive output, deep tag editing, and panels you compose yourself.
    .h1 = A music player for Windows, from someone who left Windows
    .lede = Windows is Foobar2000's home and it is very good there. This page is honest about that, and about the specific reasons you might still want rox.
    .aside = Whatever you build here is one file, and it opens the same on the Linux or Mac machine sitting next to it. If a setup you spent a weekend on has ever been stranded on one operating system, that's the part worth an afternoon.
    .siblings = Same player on [Linux](/linux) and [macOS](/macos).

windows-awkward = Start with the awkward part
windows-awkward-1 = If you run Windows, your Foobar2000 setup is configured the way you like, and it has been stable for years, rox is not an upgrade. Foobar2000 has two decades of components, a smaller footprint, and no surprises left in it. Pretending otherwise on a page like this would be an easy way to waste your afternoon.
windows-awkward-2 = The reasons to look anyway are narrow and real. You want the same player and the same layout on the Linux or Mac machine you also use. You want the source to be readable and the licence to be AGPL rather than closed freeware. Or you want a theming story where a whole look is one file you can send to someone, instead of a folder of components, configs and scripts that only reassembles on your machine.

windows-install = Installing it
windows-install-1 = Unzip anywhere and run `rox.exe`. There is no installer, no service, no uninstaller entry and nothing running in the background once it's closed.
windows-install-2 = Portable mode keeps the library, settings and caches in a `rox-data` folder next to the executable, so the whole thing lives on a stick. Pass `--portable` for one run, or drop an empty file named `portable` beside the executable to make it permanent.
windows-install-3 = The binary isn't code-signed, so SmartScreen will object the first time. More info, then Run anyway. Signing certificates cost money that a free player doesn't have, and saying so is better than pretending the warning is a bug.

windows-wasapi = Exclusive output through WASAPI
windows-wasapi-1 = Exclusive mode takes the endpoint in WASAPI exclusive, which puts the file's own rate and bit depth in front of the converter with nothing in between. rox reports back what the device actually accepted, so if the hardware quietly refused your 192 kHz you find out from a readout rather than from a forum argument.
windows-wasapi-2 = While it holds the endpoint, nothing else on the machine plays through that device. That is what exclusive means and it is the reason it isn't the default.

windows-integration = The rest of the Windows integration
windows-integration-1 = Media keys and the now-playing overlay come through SMTC, the same system surface built-in apps use, so the volume-key panel shows the track and the transport buttons work.
windows-integration-2 = There is a tray icon with quit-to-tray, so closing the last window leaves the music playing rather than ending it, and the icon is the way back in. A workspace can also take the window frame off, or keep the frame and drop only the resize border, which leaves the shadow, the snap layouts and Win+arrow intact and gives up the edge drag alone.

windows-limit-instance = No single-instance guard. On Linux and macOS a second launch hands its files to the running rox; on Windows it starts a second copy.
windows-limit-signing = x86_64 only, and the binary is unsigned, so expect SmartScreen once.
windows-limit-plugins = No plugin API, so a specific Foobar2000 component has no equivalent here.

## macOS

macos = rox - a native music player for macOS
    .description = A native macOS music player for large local libraries. Apple Silicon, signed and notarized, menus in the system bar, CoreAudio exclusive output, and deep tag editing.
    .h1 = A native music player for macOS
    .lede = Foobar2000 has a real Mac build now. What it doesn't have on the Mac is the reason people configured it on Windows.
    .aside = Menus where macOS puts them, around forty panel types to arrange however you like, and { workspace-count } complete looks a click away on the welcome window. If configuring the player is the part you actually enjoy, that's what's here.
    .siblings = Same player on [Linux](/linux) and [Windows](/windows).

macos-gap = The gap on the Mac specifically
macos-gap-1 = Foobar2000 v2 ships an official macOS version, and this page isn't going to pretend it doesn't. The catch is that the component and skin ecosystem, the thing that made a Windows install worth a weekend of configuring, is Windows-side. On a Mac you get the player without the ecosystem that justified choosing it.
macos-gap-2 = rox puts the composition and theming back: around forty panel types arranged how you want, duplicated with their own configs, popped out into real windows, and a whole look stored as one shareable file. One of the { workspace-count } shipped workspaces is a CaTRoX recreation, which is a fair statement of what it's aiming at.

macos-install = Installing it
macos-install-1 = Open the DMG and drag rox into Applications. Releases are code-signed with an Apple Developer ID and notarized, so Gatekeeper lets it open without a right-click-open dance or a trip to the security pane.

macos-native = It behaves like a Mac application
macos-native-1 = The menus live in the system menu bar where macOS expects them, not in a bar drawn inside the window. The green button does native fullscreen, and holding Option gets you zoom instead.
macos-native-2 = Closing the last window leaves rox in the dock rather than quitting, which is the platform convention and the macOS half of the quit-to-tray behaviour.

macos-coreaudio = Exclusive output through CoreAudio
macos-coreaudio-1 = Exclusive mode drives the device through CoreAudio at the file's own rate, and reports what the hardware agreed to rather than what was requested. Useful mostly if you have a DAC worth the trouble, and off by default because taking a device away from the rest of the system should be a decision you made on purpose.

macos-limit-silicon = Apple Silicon only. There is no Intel build, so an Intel Mac needs a source build.
macos-limit-xcode = Building from source needs Xcode, nix or not: gpui compiles Metal shaders at build time and nix cannot ship Apple's Metal toolchain.
macos-limit-plugins = No plugin API, so a specific Foobar2000 component has no equivalent here.

## Best music player for a local library

best-breadcrumb = Best music player
best-title = The best music player for a local library in { $year }
    .description = Streaming apps and library players are judged on different things. Five criteria that actually separate desktop music players once your collection is real, measured on 50,000 tracks.

best-lede = Not the best music app. Those are streaming clients and they're judged on catalog and price. This is about the smaller question: which desktop player holds up when the music is already on your disk and there's a lot of it.

disclosure = Disclosure
best-disclosure = rox is one of the players in this comparison and this is its own site, so read the criteria first and the numbers second. All five hold whether or not you end up downloading anything.

best-criteria = Five things that actually separate them

best-criterion-size = It has to survive the size of your library
    .body = Most players are demoed on a few hundred albums. The interesting failures start in the tens of thousands, where scanning takes an evening, scrolling stutters, and memory climbs until something gives. This is the one criterion you cannot evaluate from a screenshot, and it is the one that decides whether you are still using the thing in a year.

best-criterion-read = It has to read your tags properly
    .body = A header skim gets you a track name and a wrong duration. Reading deep means full tags, true durations, and each file's own codec, sample rate and bit depth. It also means files with broken tags get indexed rather than silently dropped, because a library that quietly loses 300 files is worse than one that admits it.

best-criterion-write = It has to let you write tags back
    .body = A collection that has been curated is a collection that gets edited. Batch edits, atomic writes so a crash does not truncate a file, and ratings stored in the files themselves rather than in a database you cannot take with you.

best-criterion-layout = The layout has to be yours
    .body = Preference here is genuinely personal, which is the argument for composition over a good default. Panels you arrange, duplicate with their own configs, and pop out into real windows beat any single layout somebody else picked.

best-criterion-yours = It has to be yours to keep
    .body = Local libraries are what people fall back to when a service removes an album or changes its terms. A player that answers that with an account, telemetry or a subscription has missed the point of the thing it is playing.

best-measured = What the first one looks like measured
    .body = Seven players, one 50,000-track library, one machine, one harness. Startup and idle cost are the parts you feel every single day.

best-shortlist = The honest shortlist
    .p1 = If you're on Windows and already run [Foobar2000](/foobar2000-alternative), you have the answer and have had it for twenty years. Nothing on this page beats a working Foobar2000 setup on its own platform.
    .p2 = If you want something with a large plugin ecosystem and a long track record on Linux, Quod Libet and Strawberry are both real answers, and both are slower to load a library this size than they are pleasant to use once loaded. If the tagging criterion is the one you actually care about, that's written up on its own as an [Mp3tag alternative](/mp3tag-alternative), and the loudness side of criterion one is covered under [ReplayGain](/replaygain).
    .p3 = rox is the answer if you want the Foobar2000 shape natively on Linux or macOS: panels you compose, deep tagging, themes as single shareable files, and a player that gets a window up in under a second against a library this size. It's new, and it has no plugin API. Both of those are real costs.
    .aside = The five criteria above are the floor, not the ceiling. Ratings go into the files themselves through FMPS and POPM rather than a database you can't take with you, and multi-value genres merge as a library opinion instead of a rewrite of your tags. If that's the kind of thing you've been wanting out of a library, this is the one to point at your disk.

best-closer = Measure it against your own collection
    .body = The benchmark that matters is the one on your disk. Free and open source, no account, no installer.

## MusicBee

musicbee-breadcrumb = MusicBee alternative
musicbee-title = A MusicBee alternative for Linux and macOS in { $year }
    .description = MusicBee is Windows-only. rox is a native player for large local libraries on Linux, macOS and Windows, with deep tagging and a layout you compose yourself. Includes what MusicBee still does better.

musicbee-h1 = A MusicBee alternative that isn't Windows-only
    .lede = MusicBee's problem, from a Linux or Mac machine, is that it's excellent and it isn't there. This page is about what actually transfers and what doesn't.

musicbee-good = What MusicBee is good at
    .p1 = Breadth. It manages a large library properly, handles auto-playlists and queue automation, syncs to portable devices, does podcasts and internet radio, converts formats, and skins into something you like looking at. It's free, it's polished, and for a lot of people it's the last music player they ever needed to install.
    .p2 = It also runs on Windows and nowhere else. Wine gets you a version of it, with the usual caveat that it works until an update decides otherwise.

musicbee-gaps = What rox doesn't do
    .body = Taking this first, because it's the part that decides the question for a lot of people and burying it would waste your time.
    .close = Four real things and the list isn't padded to look honest. If two of them are part of how you use a player, stop here.

musicbee-gap-sync = **No device sync.** If you move music onto a phone or a DAP through your player, rox has no answer at all.
musicbee-gap-radio = **No podcasts or internet radio.** rox plays files on your disk.
musicbee-gap-plugins = **No plugin API.** Anything you'd have solved with an add-on has to already exist.
musicbee-gap-ffmpeg = **Conversion needs ffmpeg.** rox converts between formats, but it drives an ffmpeg you installed rather than carrying an encoder of its own, and it won't re-encode on the way to a device because there's no sync to re-encode for.

musicbee-transfers = What transfers, and what's better
    .p1 = The library holds up at the size MusicBee users tend to have. A parallel scanner reads full tags, true durations and each file's own codec, sample rate and bit depth rather than skimming headers, and files with unreadable tags get indexed by filename instead of silently disappearing. Tag editing is a real editor with batch edits, a per-file grid, and a [write path that copies and verifies](/mp3tag-alternative) rather than modifying originals in place.
    .p2 = The interface is the bigger difference. MusicBee gives you a good layout and some skinning; rox gives you around forty panel types you arrange yourself, duplicate with their own configs, and pop out into real OS windows. A whole look is one file carrying layout, palette and appearance, which means the arrangement you settle on is something you can hand to someone else, or move to your other machine, rather than something that lives on one install.
    .p3 = Auto-playlists transfer. A smart playlist in rox is a saved query written in the same syntax the search box uses, with an optional sort and cap, and it re-runs every time the panel refreshes rather than holding a stale snapshot. The editor previews what the query takes as you type it, so you find out you wrote the wrong rule before you save it under a name.
    .p4 = Queue automation is here too: rox refills the queue when it runs dry, from your browse order, from the tracks you keep never getting to, or from what the current track sounds like. That last one comes from analyzing your files on your own machine, so it works on a library nothing on the internet has heard of.

musicbee-size = The size question
    .body = MusicBee isn't in this table, because the benchmarks were run on Linux where it doesn't run. It's here as the answer to "does the alternative fall over at my library size", measured on 50,000 tracks.

musicbee-split = The honest split
    .p1 = Staying on Windows with a MusicBee setup that syncs your phone and feeds it podcasts? Nothing here replaces that, and switching would cost you two features rox has no version of.
    .p2 = Moving to Linux or a Mac, or already there and looking at the gap MusicBee left? That's the whole reason this exists, and the trade is specific: you give up sync and podcasts, and you get a native player with deeper tagging, a layout you build yourself, and a library that stays quick at fifty thousand tracks.
    .aside = Popping a panel into its own OS window, or handing your entire layout to someone as a single file, aren't rows in a feature comparison because there's nothing on the other side to compare them to. If that's what you've been after, rox is where it is.

musicbee-closer = Try it against your own library
    .body = Free and open source under the AGPL, no account and no installer. There's a [Foobar2000 comparison](/foobar2000-alternative) too, if that's the setup you're actually leaving.

## CaTRoX

catrox-title = CaTRoX, rebuilt as a native player
    .description = The CaTRoX foobar2000 theme, who built it, and what it took to get that look running natively on Linux and macOS without Windows or Wine underneath it.

catrox-h1 = CaTRoX, without Windows underneath it
    .lede = rox ships a CaTRoX workspace in the box. This is the page about why, and about the people whose work it's standing on.

catrox-credit = Credit where it belongs
    .body = CaTRoX is a foobar2000 theme. The original design and colour scheme are eXtremeHunter1972's, and the edition most people have actually run is [CaTRoX_QWR](https://theqwertiest.github.io/CaTRoX_QWR/), rebuilt and maintained by TheQwertiest. rox is not affiliated with either, and nothing here is their code. The workspace below is a recreation of a look they made.

catrox-was = What CaTRoX was
    .p1 = A dense, dark, information-first layout for foobar2000: cover art rendered as a CD, a metadata field list down one side, album-grouped tracks with rating dots, and a menubar exactly where a menubar goes. It's the thing people mean when they say foobar2000 can look good, and it's most of the reason anyone put up with configuring foobar2000 in the first place.
    .p2 = It was never a skin in the sense a music player usually means. CaTRoX is a stack of components, panel scripts and configuration, assembled. That's what made it powerful, and it's also what makes it hard to move, hard to share, and easy to break.

catrox-nekorox = Where NekoRoX came in
    .p1 = rox's author ran a fork of it for years. [NekoRoX](/nekorox) was CaTRoX with a pile of custom panels, plugins and quality-of-life modules on top: tree and filter navigation, mini and micro player modes, a synced lyric panel, a cover flow, Discord presence, Last.fm tools. It has a note at the top of its README now saying it's no longer maintained, and pointing here.
    .p2 = The reason for that note is the honest content of this page. Moving to Linux full time meant running the whole assembly through Wine, and a stack held together by stacked workarounds, in places rendering Internet Explorer inside panels, does not take kindly to a translation layer. It ran. It also felt one update away from stopping, permanently, with a decade of configuration inside it.

catrox-recreation = The recreation
    .body = The CaTRoX workspace in rox is that layout rebuilt out of native panels: the circular cover render, the metadata field list, the album-grouped track list with its rating dots, the menubar. It's a look, reproduced, not a port of anything. None of CaTRoX's code exists in rox and none of it could, since rox is Rust on [gpui](@gpui) and CaTRoX is panel scripts running inside foobar2000. The wider argument with foobar2000, including the rows where it's still ahead, is on [its own page](/foobar2000-alternative).
    .after = The part that changed is what it takes to have it. In rox a whole look is a single file holding layout, palette and appearance together, so the CaTRoX workspace is one click on the welcome window, and the thing you build from it is one file you can hand to someone else. No component list, no install order, no configuration that only reassembles on the machine it was built on.

catrox-shot-alt = The CaTRoX workspace in rox: a circular CD render of the cover art, a metadata field list down the left with title, artist, album, codec and bitrate, and album-grouped tracks with rating dots on the right.

catrox-limits = What you don't get back
    .aside = What you get instead is a layout that opens on Linux and macOS without Wine anywhere near it, survives an OS update, and travels as one file. After a decade of maintaining the original, that trade is the entire reason rox exists.

catrox-limit-panels = Not every CaTRoX panel has an equivalent. rox has forty-odd panel types of its own and they aren't the same forty.
catrox-limit-youtube = No YouTube playback. CaTRoX and NekoRoX both had it through components; rox plays what's on your disk.
catrox-limit-plugins = No plugin API, so anything you'd have solved with a foobar2000 component has to already exist in rox or not exist at all.
catrox-limit-fidelity = It's a recreation working from the outside. Details differ, and a pixel-exact match was never the goal.

# $others is the shipped workspace count minus this one. It used to be the
# literal "Five", which stopped being true two workspaces ago.
catrox-closer = Try it
    .body = The CaTRoX workspace ships in the box, one click away on the welcome window. { $others } others do too, including a [Foobar layout and a WinAmp-shaped one](/workspaces).

## Cue sheets

cue-breadcrumb = Cue sheets
cue-title = Playing FLAC and CUE rips, one track at a time
    .description = A whole-disc image beside a cue sheet, indexed as real tracks: each span seeks, sorts, scrobbles and runs gaplessly into the next, and your playlists never learn that three rows share a file.

cue-h1 = Cue sheets, and rips that behave like albums
    .lede = If you ripped CDs before splitting was the default, a chunk of your library is one FLAC per disc with a text file beside it. Most players either ignore the sheet or treat what it describes as second-class. Here's what rox does with it.

cue-what = What a cue rip actually is
    .p1 = One audio file holding an entire disc, and a `.cue` sheet listing where each track starts. It's the accurate way to preserve a CD, because the gaps between tracks are part of the disc and splitting throws them away. It's also the format that breaks the assumption every music library is built on, which is that one file is one track.
    .p2 = Players resolve that in one of three ways. Ignore the sheet and show a seventy-minute track. Show the sheet's tracks but keep them apart from the real library, so search, sort and playlists behave differently for them. Or make the break real and absorb it once.

cue-rows = Real rows, not fragments
    .p1 = rox indexes each span in the sheet as an ordinary row in the library, identified by its file plus its track number. Everything downstream reads it as a track, because to everything downstream it is one. Playlists snapshot it, listens attach to it, search finds it, the sort columns sort it, and none of them know that eleven rows point at the same FLAC.
    .p2 = The alternative most implementations pick is a synthetic path, `album.flac#3`, which keeps the database tidy and moves the problem onto every piece of code that later opens that path. A missed strip there is a silent bug that reads tag bytes out of nothing. A library that owns no cue sheets pays nothing for any of this: the spans live in a side table, and nothing on the hot paths reads them.

cue-playing = Playing a span like a file
    .p1 = The engine takes a span as the whole world for that track: an accurate seek to its start, a sample-accurate trim at both edges, and an end boundary that takes the same path a real end-of-file does. Gapless, crossfade, stop-after-current and loop all work without knowing spans exist.
    .p2 = The head trim is the detail that matters. An accurate seek lands on a packet boundary rather than the exact sample, so without dropping the frames between the landing and the span start, every track opens on the tail of the one before it. That's the sound of a cue implementation nobody finished.
    .p3 = Consecutive tracks of one rip share an album group, which is what keeps crossfade from fading across a disc's own gapless splices. A rip plays like the record it was cut from.

cue-scanning = Scanning, and changing your mind
    .p1 = The sheet claims its image. While a cue lists a file, that file gets no row of its own, so you don't end up with eleven tracks plus a seventy-minute duplicate. Freshness keys off whichever of the two was modified later, so editing either the sheet or the audio re-cuts the rip on the next scan. Delete the sheet and the image folds back into one plain row.
    .p2 = Metadata prefers the sheet and falls back to the image's own tags. Sheets written before UTF-8 discipline was a thing get a cp1252 fallback, because old rips are exactly the population this feature is for.

cue-ratings = Ratings that don't stamp the whole disc
    .p1 = rox normally writes ratings into the files themselves, which is the right call when a file is a track. On a cue rip it isn't: the image belongs to all eleven tracks, so a per-track write would stamp every one of them with the same stars.
    .p2 = The writer refuses the file half for these rows and the database keeps the value. Same for tag edits. You get per-track ratings on a rip, and your image comes out of it byte-identical.

cue-outstanding = Out, for now
    .body = Waveform peaks and the acoustic analysis pass still read the whole image rather than the span. Lyrics are per file, so a rip shares one sheet. Per-span ReplayGain measurement, cue sheet editing in the app, and embedded FLAC CUESHEET blocks are all unhandled. Each is additive on top of how spans are identified, and none of them changes it.

cue-later = The parts you'd only notice later
    .aside = The measure of this isn't whether a rip plays. It's whether, a month later, anything in the library still behaves differently because it came out of an image.

cue-later-m3u = m3u export writes spans as `path#N`, and import prefers an exact path match, so a list round-trips through other software without collapsing to the image.
cue-later-scrobble = Scrobbling and now-playing dedup on the pair, so a disc's eleven tracks scrobble as eleven tracks rather than one very long one.
cue-later-listens = Listens reattach per span after a rescan, so a disc keeps its play history per track even when every span carries identical tags.
cue-later-replaygain = Only the album pair of ReplayGain values carries over. Track values written against a whole-disc image describe the disc, so they're ignored rather than trusted.

cue-closer = Point it at the shelf you never split
    .body = The scanner picks the sheets up on its first pass, alongside everything else. More on [what breaks at library scale](/best-music-player).

## Foobar2000

fb-breadcrumb = Foobar2000 alternative
fb-title = A Foobar2000 alternative for Linux, macOS and Windows in { $year }
    .description = Foobar2000 got panel layouts, deep tagging and a theme community right, and stranded most of it on Windows. rox is a native, open source player that carries all three to Linux and macOS.

fb-h1 = A Foobar2000 alternative that runs everywhere
    .lede = Foobar2000 got three things right that almost nothing else does at once, and stranded two of them on Windows. rox is the attempt to carry all three across.

fb-right = What Foobar2000 got right
    .p1 = A UI you assemble out of panels instead of accepting whatever the developer shipped. A theme community on top of that, which is how CaTRoX, [NekoRoX](/nekorox) and Georgia exist at all. And tag and library management that doesn't fall over when the collection is tens of thousands of files deep.
    .p2 = Plenty of players do one. Very few do two. The stack that does all three has been effectively Windows-only for twenty years, and every attempt to move it has meant giving one of them up.

fb-leaves = Where it leaves you
    .p1 = On Linux there's no official Foobar2000 build, so the honest options are Wine or something else. Wine works right up until it doesn't. A skin like CaTRoX leans on stacked workarounds and, in places, Internet Explorer rendering inside panels, and running that through a translation layer surfaces exactly how much is held together by luck. It's one OS update from breaking, every time.
    .p2 = macOS is better than it used to be, since Foobar2000 v2 ships a real Mac build. But the part people actually want, the component and skin ecosystem that made the Windows version worth configuring for a weekend, is Windows-side. You get the player without the reason you wanted the player.
    .p3 = And on Windows itself, nothing is wrong. That's worth saying plainly: if you're on Windows and your Foobar2000 setup works, rox is not an emergency.

fb-does = What rox does about it
    .p1 = Native on all three platforms, one binary each, written in Rust on [gpui](@gpui). Around forty panel types you arrange yourself, duplicate with independent configs, and pop out into real OS windows. The library scanner reads full tags, true durations and each file's own codec, sample rate and bit depth rather than skimming headers, and it holds up at 50,000 tracks.
    .p2 = The theming answer is the part that changed most. A workspace is a single file carrying layout, palette and appearance together. You edit it, you break it, you hand it to someone else and they get exactly what you had. One of the { workspace-count } in the box is a [CaTRoX recreation](/catrox), which is the honest statement of intent.

fb-shot-alt = The CaTRoX workspace in rox: the foobar2000 skin recreated natively, with a circular CD render of the cover, a metadata field list down the left and album-grouped tracks with rating dots.

fb-table = Side by side
    .caption = Foobar2000 and rox compared across platform support, theming, licensing and maturity
    .area = Area
    .method = Three rows go to Foobar2000, and they're the three that would take years to close. A comparison table where one column wins everything is an advert, not a comparison.

fb-row-linux = Native on Linux
    .fb = No official build. Wine only.
    .rox = First-class, x86_64.

fb-row-macos = Native on macOS
    .fb = Official build since v2.
    .rox = First-class, Apple Silicon.

fb-row-windows = Native on Windows
    .fb = Its home. Twenty-plus years of it.
    .rox = First-class, x86_64.

fb-row-panels = Panels you compose
    .fb = Yes, through Columns UI and friends.
    .rox = Forty-odd panel types, built in, no components to install.

fb-row-sharing = Sharing a look
    .fb = A skin is components, configs and scripts. Famously fiddly.
    .rox = One file carrying layout, palette and appearance.

fb-row-source = Source available
    .fb = Closed source freeware.
    .rox = AGPL-3.0, all of it.

fb-row-components = Component ecosystem
    .fb = Two decades deep. Anything you can think of.
    .rox = No plugin API.

fb-row-maturity = Maturity
    .fb = Since 2002. It does not surprise you.
    .rox = Since 2026. It will, occasionally.

fb-row-footprint = Footprint
    .fb = Famously tiny.
    .rox = One 62 MB binary, 134 MB resident at 50k tracks.

fb-not = Who should not switch
    .p1 = If you're on Windows, your components are configured, and the setup has been stable for a decade, there is nothing here worth the disruption. If you depend on a specific Foobar2000 component, rox has no plugin API and can't replace it. If you want software that has already made all its mistakes, rox is four years too young.
    .p2 = If you moved to Linux and left the setup behind, or you're on a Mac holding a player without the ecosystem that justified it, that's the gap this was built in.
    .p3 = The other side of arriving late is worth stating. Nothing in rox has to stay compatible with a decision made in 2002, which is how a whole look ends up as one shareable file instead of a component graph, how one codebase covers all three platforms, and how forty-odd panel types ship in the box rather than getting assembled one download at a time. It's also why track identity was never tied to file paths, which is the thing that makes merging a local library with anything else possible later. Most of that 62 MB is the same story.
    .aside = Panels that pop out into real OS windows, or a palette that retints itself from whatever cover is playing, never made the table above. There was nothing to put in the other column. If differences like that are what you're after, rox is the place to be.

fb-closer = Try it against your own library
    .body = Free, open source under the AGPL, no account and no installer. Point it at the collection that breaks other players.
    .fine = Or read the [source](@repo) first. That's a reasonable way to evaluate a player that wants your tag write access. Still weighing it up? The [criteria that separate library players](/best-music-player) are written out separately, benchmarks included.

## Mp3tag

mp3tag-breadcrumb = Mp3tag alternative
mp3tag-title = An Mp3tag alternative for Linux and macOS in { $year }
    .description = Batch tag editing across FLAC, MP3, MP4 and APE, a per-file grid for the messy imports, ratings written into the files themselves, and a write path that never edits an original in place.

mp3tag-h1 = A tag editor you can point at ten thousand files
    .lede = Mp3tag is the tool most people mean when they say tag editor, and there's no Linux build of it. rox has a full editor inside it, and a write path built for the case where a batch is large enough that "it usually works" isn't good enough.

mp3tag-isnt = Start with what this isn't
    .p1 = rox is a music player that contains a serious tag editor. Mp3tag is a dedicated tagger, and at being a dedicated tagger it's better: scripting, actions, format strings you can compose, and twenty years of accumulated sharp edges filed off. If what you want is a standalone tool to run over a folder and then close, on Windows, that's the one.
    .p2 = The case for doing it in rox is that tagging a library is not usually a task you finish. It's something you do while you're listening, to the file you just noticed was wrong, which means the editor being attached to the player and the library is the point rather than a compromise.

mp3tag-write = The write path
    .p1 = This is the part worth reading even if you never install rox. Most tag writers modify your file in place: they open the original, rewrite the metadata region, and hope. That is fine tens of thousands of times and catastrophic once, because a crash, a full disk or a yanked drive partway through leaves a file that no longer parses, with your audio inside it.
    .p2 = rox never writes into an original. Every edit copies the file, applies the change to the copy, verifies the result by reading the metadata back and hashing the audio stream to confirm it's byte-identical to what went in, and only then atomically renames the copy over the original. If any step fails the copy is unlinked and your file is untouched, because it was never opened for writing in the first place.
    .p3 = Each file is also isolated, so one pathological file in a batch of four thousand fails on its own instead of taking the run down with it.

mp3tag-cost = The cost
    .body = Copy-verify-rename means every edit briefly needs free space equal to the file, and it's slower than writing in place. On a batch of a few thousand FLACs that's real time and real disk. It's the trade rox makes on purpose, and it's the whole reason the editor is safe to point at a library rather than a folder.

mp3tag-batch = Editing a batch without flattening it
    .p1 = Select any number of tracks and the editor opens as one shared form. A field every file agrees on shows its value; fields that disagree show empty under a "multiple values" placeholder. Only fields you actually move write anything, so an untouched field never rewrites a file, and the ones that would be nonsense to stamp across a selection, title and track number and disc number, lock themselves in a batch.
    .p2 = When one file inside the batch is wrong, the form swaps for a table: one row per track, a column per field, the locked per-track fields editable in place. That's the view for the import where every title and number is differently wrong, and it beats stepping into fields one at a time. Both views commit as a single batch through the same write path, and the result lands in the library without a rescan.

mp3tag-specs = What it reads and writes
mp3tag-spec-formats = **Formats.** ID3v2, Vorbis comments, MP4 atoms and APE behind one editor, so MP3, FLAC, M4A and the rest are the same screen.
mp3tag-spec-ratings = **Ratings.** Written into the files themselves through FMPS and POPM, not into a database you can't take with you.
mp3tag-spec-genres = **Multi-value genres.** Real lists, with merges kept as a library opinion rather than a rewrite of your tags.
mp3tag-spec-art = **Cover art.** Multi-picture album art, added and replaced through the same atomic path.
mp3tag-spec-lookup = **Lookup.** Tags and covers from MusicBrainz, iTunes and Deezer, applied through the same diff so you see what changes before it writes.
mp3tag-spec-repair = **Repair.** A pass for files whose tags are damaged in specific known ways rather than merely wrong, the ones that make other taggers show a track as a filename and a zero duration.
mp3tag-spec-patterns = **Patterns, both directions.** A format string like `%artist% - %title%` reads tags out of a filename, and the same pattern run backwards renames files from their tags. Both preview every track before anything is written.

mp3tag-stay = Who should stay with Mp3tag
    .p1 = If you're on Windows and you lean on actions, scripting or the more elaborate format-string work, rox has no equivalent and this would be a downgrade. If you want a tagger that isn't also a player, this is the wrong shape entirely.
    .p2 = If you're on Linux or a Mac, or your tagging happens in the middle of listening rather than as a separate chore, that's the gap this fills.
    .aside = The write path is the part that doesn't have a counterpart to compare against. Verifying an audio-stream hash before renaming over an original is not something a tagger does unless it expects to be pointed at everything you own. If that's the kind of caution you want between an edit and your files, that's what this is.

mp3tag-closer = Point it at the folder you've been avoiding
    .body = Free and open source, no account, no installer. The [library side of it](/best-music-player) is written up separately, and if you're coming off a Windows setup there's a [MusicBee](/musicbee-alternative) and a [Foobar2000](/foobar2000-alternative) comparison too.

## The visualizer

viz-breadcrumb = Music visualizer
viz-title = A music visualizer built into the player - rox
    .description = Spectrum, waveform and VU panels, plus WGSL shaders over any panel or the whole window, driven by named signals you pull off the playing audio and route wherever you want them.
    .image-alt = The rox logo above the words: signals off the music, shaders on every surface

viz-h1 = A visualizer that lives in the player
    .lede = Most players give you a spectrum analyzer and stop. rox has those panels, and under them a modulation layer: named signals pulled off the audio, routed into shader inputs you write yourself, saved into the same file the rest of your theme lives in.

viz-panels = The ordinary panels, first
    .p1 = A spectrum panel with bar or block styles, gradients, peak caps with their own gravity, frequency labels, and split zoning that analyses above and below a chosen frequency at different window sizes, so each end of the range trades reactivity for resolution on its own terms. A waveform strip that draws the whole track, per channel, and seeks where you click. A VU meter. An art shelf that turns covers in real 3D. None of it needs a word of code and it's what most people will use.
    .p2 = Pausing freezes the bars where they were, rather than letting them fall to the floor. That sounds small until you're trying to look at the exact moment you paused on.

viz-shaders = Shaders, on four surfaces
    .p1 = A rox shader is one WGSL fragment stage. It can run over a single panel's body, as a Shader panel of its own, as an overlay across the whole window, or as a backdrop painting under every panel, behind the cover art. Overlay and backdrop each take a switch that extends them to every window rox has open. Same language, same uniform block, same routing in all of them.
    .p2 = Every shader gets the clock, the resolution, the pointer, and eight meta floats describing the moment: volume, where the playhead sits in the track, whether audio is actually moving, the track's length, and how dark the current palette renders, so one shader can dress itself for light and dark instead of shipping for the theme it was written against.
    .p3 = A panel shader can also read what the panel actually drew. A mask binding hands it the panel's own painting replayed onto transparency, and panels publish the shape of their content, so a shadow or a glow follows a letterboxed cover rather than the empty bars either side of it.
    .p4 = Past one stage, a `// @pass` comment splits the text into a chain of up to eight, each one able to read the passes before it by name. That's what a blur pyramid or a two-stage bloom needs. A `// @asset` line names an image to sample, and `// @asset art: @cover` binds the playing track's own cover, rebinding when the track turns over. Nine examples ship with the app, each one demonstrating a different part of that contract rather than nine variations on a plasma.
    .p5 = Point the panel at a file on disk and rox watches it. Save in your editor and the window has it. A save that doesn't compile leaves the last good version on screen with the error in the panel, because losing the picture is a bad way to find out you typed a semicolon wrong.

viz-signals = Signals are the part that's different
    .p1 = A shader with a clock in it is a screensaver. What makes it a visualizer is what you feed it, and in rox that's a pool of named signals shared by the whole app. You build them in a window of their own, under Application, next to the equalizer, and it carries a spectrum and a transport for the same reason the equalizer does: you pick a band by eye and ear against the thing you're actually playing.
    .p2 = Five kinds of source. A **band** is the energy between two frequencies, which is the signal a swell rides. **Level** is the whole mix. An **onset** pulses when a band jumps past its own recent average, which is the signal a hit rides. A **trigger** pulses when a band crosses a line you drew, for material where the moving average never gets to drop and an onset goes quiet after the first bar. A **total** adds another signal up over time and wraps at one, so a shader can read it as a phase that advances while the music is loud and stalls while it isn't.
    .p3 = Each one carries response smoothing and a gate. The gate is the setting that earns its place: a band riding room tone holds every knob attached to it slightly off its rest position forever, and a threshold with a curve above it hands over silence between the hits instead. The meter draws the ungated value with the threshold marked across it, since a bar that vanished under its own gate would be no help at all in placing the gate.
    .p4 = A route attaches one signal to one parameter with an output span: this signal, this target, from here to there. Sixteen slots reach every shader, and the slots nothing is routed to get a plain slider on the settings page, so a look can be half performed and half set by hand.

viz-tap = Measured before the volume knob
    .body = The tap the visuals read sits ahead of the output volume. Turning the music down used to make it look quieter than it is, and a signal tuned at one volume was wrong at another. The equalizer and ReplayGain still show, since those run upstream and are part of what you're hearing.

viz-critters = Critters, as the argument
    .body = One of the workspaces in the box is the whole player rendered as a 1-bit print: an ordered dither over every surface, tones crushing with the sub-bass, and a noise wall behind the panels that moves with the song. It's five signals and four shaders in a single file, and none of it is a special case in the app.
    .caption = Load it from the welcome window, then open the settings and take it apart. [The rest of them](/workspaces).

viz-trust = Running a stranger's shader
    .p1 = Shaders travel inside workspace files, which means an imported look arrives carrying somebody else's code.
    .p2 = Nothing runs until you say so. Each shader's source is fingerprinted, and the approved list is machine-local and only ever written by a direct action: you picked the file, you hit reload, you chose a preset, you pressed Approve. A look that arrived in a bundle sits there inert with a button under it until then. The examples that ship with rox are trusted by construction, because they're compiled into the binary.
    .p3 = Turning one on opens a confirmation window that waits for an answer instead of counting down, and that window is never itself shaded. Whatever the shader does to the rest of the screen, the way back out stays readable.

viz-limits = What isn't handled
    .aside = The distance between "I want the whole player to strobe on the kick" and having it is a band, a gate and a route, and none of the three needs a rebuild.

viz-limit-routes = Routes reach shader slots and the particles panel's knobs. Every other panel's settings are still knobs you set by hand.
viz-limit-milkdrop = WGSL, not Milkdrop or AVS. There's no importer for either, and twenty years of presets don't come across.
viz-limit-midi = No MIDI or OSC control surface. The overlay pass and the panel passes are what exist, driven by the audio and the pointer.
viz-limit-battery = A full-window pass is a real GPU pass every frame. On a laptop on battery, that's a choice you're making.

viz-closer = Try it on your own library
    .body = Nothing here phones anywhere: the analysis is the audio already going through the player. More on [what a workspace carries](/workspaces).

## NekoRoX

neko-title = NekoRoX, the foobar2000 theme, rebuilt native
    .description = NekoRoX was a CaTRoX fork for foobar2000: custom panels, synced lyrics, Discord presence, Last.fm tools. It's archived now, and rox is the native player its author built instead.

neko-h1 = NekoRoX, the foobar2000 theme, and where it went
    .lede = NekoRoX was a foobar2000 theme: a fork of CaTRoX with a decade of panels, plugins and fixes piled on top. I maintained it as [catlinman](https://github.com/catlinman) until it stopped being maintainable. rox is what I built instead, and its default look is that layout rebuilt from scratch.

neko-shot-alt = The NekoRoX foobar2000 theme: a dark layout with INF, BIO, LYR, ART and LIB tabs, a cover art wall on the left, album-grouped tracks with star ratings on the right, and an amber waveform with a spectrum analyzer across the bottom.
neko-shot-caption = NekoRoX running in foobar2000, on Windows, in 2022.

neko-was = What NekoRoX was
    .p1 = A ready-made foobar2000 setup you unzipped into `%appdata%` and had a finished player. Dark, dense, tabs for info, biography, lyrics, art and library, a cover wall down one side, album-grouped tracks with rating dots, and an amber waveform along the bottom with a spectrum under it. Underneath were Columns UI, a pile of JScript panels, an `.fcl` layout file and a fonts folder you had to install by hand.
    .p2 = It started as [CaTRoX](/catrox), eXtremeHunter1972's theme, later carried forward by TheQwertiest. NekoRoX added tree and filter navigation, mini player modes, a synced lyric panel, a cover flow, Discord presence and Last.fm tools, and merged a lot of TheQwertiest's work back in as it went. None of the underlying scripts were mine and the README has always said so.

neko-where = Where to find it
    .body = The repository is still up at [github.com/catlinman/foobar2000](https://github.com/catlinman/foobar2000) and the files still work. It's unmaintained, it's Windows only, and several of the components it depends on have gone stale or vanished from their original hosts. If you want to run it, run it. Just know nobody is fixing it.

neko-alpha = AlphaRoX, the light one
    .body = Same theme with the palette inverted, published under this account as [AlphaRoX](https://github.com/zealsprince/foobar2000). It's a fork of NekoRoX, which is a fork of CaTRoX, which tells you most of what was wrong with distributing a look this way. Same state as NekoRoX now: up, working, unmaintained.
    .alt = The AlphaRoX foobar2000 theme: the light counterpart to NekoRoX, with a white background, a cover art wall on the left, album-grouped tracks with star ratings, and a blue waveform and spectrum analyzer across the bottom.

neko-stopped = Why it stopped
    .p1 = I moved to Linux full time, which meant the whole assembly went through Wine. It ran. It also rendered Internet Explorer inside panels, and a stack held together by stacked workarounds does not enjoy a translation layer. Every foobar2000 update, and every Wine update, was a coin flip on a decade of configuration.
    .p2 = The deeper problem was the format. A NekoRoX install isn't a file, it's a component list, an install order and a set of paths that only reassemble on the machine they were built on. That's why the README told people to copy four directories into two different places. Sharing a look shouldn't take a page of instructions.

# $others is the shipped workspace count minus the default and CaTRoX, both
# already named in the sentence. It used to read "four others".
neko-rox = What rox does with it
    .body = rox is a native player written in Rust, on Linux, macOS and Windows, with no foobar2000 and no Wine underneath it. Its default workspace is the NekoRoX layout rebuilt out of native panels, which is why the two shots look related. There's a [CaTRoX workspace](/catrox) in the box too, along with { $others } others.

neko-default-alt = The default rox workspace, a native reconstruction of the NekoRoX layout: a cover art grid beside a playlist with star ratings, an amber waveform seek bar along the bottom, and tabs for biography, lyrics and metadata.

neko-carried = The feature list, line by line
    .after = The thing NekoRoX couldn't do is the one I care about most. In rox a whole look is a single file carrying layout, palette and appearance together, so you hand someone a workspace and they have your setup. No component list, no install order, no fonts directory.

neko-had-nav = Tree and filter based navigation
    .now = Folder Tree panel, plus a cascading Filter panel over artist, album, genre and year.
neko-had-mini = Mini and micro player modes
    .now = One mini layout per workspace, toggled from the transport, with its own window size.
neko-had-ontop = Always on top
    .now = Nothing yet. The window is a normal window.
neko-had-ratings = Rating and play count views
    .now = Five-star or ten-point ratings, written to POPM and FMPS, and a sortable plays column.
neko-had-youtube = YouTube audio search and playback
    .now = Nothing. rox plays files off your disk.
neko-had-covers = Cover art viewer and cover flow
    .now = A Cover Art panel and an Album Carousel that scales and dims its neighbours toward the edges.
neko-had-lyrics = Real time synced lyrics
    .now = LRC sheets highlighted on the playhead, click a line to seek, fetched from lrclib.
neko-had-viz = Visualization and amplitude seek bar
    .now = A whole-track waveform you can scrub, an FFT spectrum, a VU meter.
neko-had-discord = Discord rich presence
    .now = Now playing, play state and elapsed time over Discord IPC.
neko-had-bio = Live biography lookup
    .now = Artist biography with fanart, tags, listener counts and similar artists.
neko-had-lastfm = Last.fm integration
    .now = Scrobbling, now-playing, hearts mirrored as loves, and a loved-tracks import.

neko-closer = Get rox
    .body = Free, open source, one binary per platform. The [workspaces page](/workspaces) shows the { workspace-count } shipped looks, and the [foobar2000 comparison](/foobar2000-alternative) covers where foobar2000 is still ahead.

## ReplayGain

rg-title = ReplayGain explained, and what turning it on costs
    .description = What ReplayGain actually does, track gain versus album gain, why the peak value matters, how to handle files nobody ever measured, and why ReplayGain and bit-perfect playback are mutually exclusive.

rg-h1 = ReplayGain, and what it costs you
    .lede = Why one album is twice as loud as the next, what the fix actually does to your audio, and why you can't have it and bit-perfect playback at the same time.

rg-problem = The problem it solves
    .p1 = Records aren't mastered to a common loudness. A 1985 CD and a 2005 remaster of the same album can differ by ten decibels or more, which is the difference between comfortable and reaching for the volume knob. Shuffle a library across four decades and you're adjusting volume every third track.
    .p2 = ReplayGain fixes this without touching your audio. An analysis pass measures how far a track sits from a reference loudness and writes that number, in decibels, into the file's tags. At playback the player reads the number and applies it. Nothing is re-encoded and nothing is destroyed, because the correction lives in a tag and the audio underneath is the audio you had.

rg-modes = Track gain and album gain
    .p1 = Every measured file carries two numbers, and picking between them is the one setting that actually changes how listening feels.
    .track = **Track gain** levels each track independently. Every song arrives at the same loudness, which is what you want on shuffle. It also flattens albums that were built with dynamics on purpose: the quiet interlude before the loud closer gets pulled up to match it, and the effect the producer intended is gone.
    .album = **Album gain** applies one figure to every track on the record, worked out from the album as a whole. Relative differences inside the album survive exactly as mastered, and the album as a unit sits level with other albums. This is the right default if you listen to records front to back.
    .setting = rox takes this as a setting and applies the chosen figure per track as it opens, so it's a preference rather than something baked into the files.

rg-peak = The peak, and why a boost can clip
    .p1 = Alongside the gain, a measurement pass records the loudest sample in the track. That number matters because ReplayGain corrections go both ways: a quiet recording gets a positive gain, and multiplying samples that already reach near full scale pushes them past it. Past full scale there's nowhere to go, so the waveform flattens and you hear distortion that wasn't in the file.
    .p2 = The peak is what prevents it. rox clamps a boost against the peak the tag reports, so a quiet track gets turned up only as far as it can go without clipping. The result is that some quiet tracks land slightly below the target loudness, which is the correct trade and the reason peak values are stored at all.

rg-unmeasured = The files nobody ever measured
    .p1 = ReplayGain only works on files that carry the tags, and in a real library assembled over twenty years a large fraction won't. Historically that meant running a separate tagger over everything before your player was any use.
    .p2 = rox reads the tags where they exist, under the standard names in every format it indexes: TXXX frames in ID3v2, Vorbis comments in FLAC, freeform atoms in MP4. For everything else it measures the files itself with an EBU R128 loudness pass and stores the result against the library, marked as measured so a later rescan can tell rox's own numbers apart from what a tagger wrote. If you'd rather the numbers lived in the files, a setting writes them back through the same verified write path the tag editor uses.
    .p3 = That pass can run itself. With automatic measuring on, files get measured once the folder watcher settles after an import, and a track dropped into an album that was already measured sends the whole record back for re-metering, since album gain is a figure about the record rather than the file.

rg-skip = The part most pages skip
    .p1 = ReplayGain multiplies your samples by a number. That is processing. It is not lossless, it is not a passthrough, and any player claiming both ReplayGain and bit-perfect output at the same time is describing something that cannot happen.
    .p2 = This matters if you own a DAC you chose carefully. Bit-perfect means the samples that reach the converter are the samples in the file, unmodified, so anything that scales them, a volume control below unity, an equalizer, ReplayGain, ends the claim. There is no version of loudness normalisation that leaves the bits alone, because changing the loudness is changing the bits.
    .choice = Which of the two you want is a real choice rather than a trick question. Bit-perfect matters for critical listening to one album on good hardware. ReplayGain matters for every other hour, when the library is on shuffle and you'd rather not touch the volume. Most people should run ReplayGain and stop worrying about it. The point is knowing which one is on.

rg-bitperfect = What bit-perfect means in rox
    .body = Three conditions, stated rather than decorated: the processing chain empty or disabled, volume at 100%, and the device running at the source file's own rate. Meet all three and the converter receives bit-identical samples. Miss any one and it doesn't, and rox says so instead of showing a badge. ReplayGain on is processing on, and it reads as processing on.

rg-exclusive = Exclusive output, separately
    .p1 = Bit-perfect also needs the operating system out of the path, which is what an exclusive output mode is for. rox takes the device directly: the ALSA `hw:` name on Linux, with no dmix, no plug and no sound server in the way; WASAPI exclusive on Windows; hog mode through CoreAudio on macOS. It follows the source rate where the device allows it, and reports what the hardware actually agreed to rather than what was asked for.
    .p2 = The trade is what exclusive means everywhere: while rox holds the device, nothing else on the machine plays through it. If the device can't be acquired, rox falls back to shared mode with the state visible, rather than going quiet and leaving you to work out why.

rg-limits = What isn't handled
    .aside = A player that tells you which of bit-perfect and ReplayGain is currently true, and measures the files your taggers never got to, is a short list. If that's the kind of honesty you want from the thing between your library and your DAC, rox is on it.

rg-limit-opus = Opus files carry their own `R128_TRACK_GAIN` scheme relative to a different reference. rox doesn't convert it, because `.opus` isn't in the scanner's extensions.
rg-limit-itunes = iTunes' `iTunNORM` is out of scope. Nothing else writes it and its per-channel figures aren't a decibel gain.
rg-limit-rate-switch = Following the source rate in exclusive mode costs an audible gap between two tracks of different sample rates, since the stream reopens. Gapless within one rate is unaffected.

rg-closer = Point it at your library
    .body = The measurement pass runs in the background over everything missing a gain, and keeps running with the settings window closed. More on [what else matters at library scale](/best-music-player).
