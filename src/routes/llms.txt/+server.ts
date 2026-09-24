import type { RequestHandler } from './$types'
import { HUB, SIDE_PAGES } from '$data/pages'
import { SITE } from '$data/site'
import { WORKSPACE_COUNT } from '$data/workspaces'
import { localePath, LOCALES, SOURCE_LOCALE, translate } from '$lib/i18n'
import { loadRelease } from '$lib/server/release'

export const prerender = true

// llms.txt, per the llmstxt.org proposal: a markdown index at the site root for
// models reading the site, the way robots.txt is for crawlers. Generated rather
// than checked in as a static file so the page list comes from pages.ts and the
// version comes from the same release lookup every other page uses. A
// hand-maintained copy would be wrong within two releases.
//
// Prerenders to build/llms.txt, which GitHub Pages serves as text/plain off the
// extension. The content-type below only applies to dev and `vite preview`.
//
// The register is deliberately flatter than the site's: no voice, no argument,
// just what is true. A model quoting this should end up with accurate claims
// about rox rather than the pitch.
//
// One file, in English, at the root. The site ships in every language rox does
// and this index is read by models rather than by people, so a copy per language
// would be that many things to keep in sync for no reader. What it does carry is
// where the translations live, which is the part a model can't guess.

const url = (path: string): string => new URL(path, SITE.origin).href

function t(key: string, args?: Record<string, string | number>): string {
  return translate(SOURCE_LOCALE, key, args)
}

export const GET: RequestHandler = async () => {
  const release = await loadRelease()

  const guides = SIDE_PAGES
    .map(item => `- [${t(item.key)}](${url(item.path)}): ${t(`${item.key}.blurb`)}`)
    .join('\n')

  const languages = LOCALES
    .filter(locale => locale.id !== SOURCE_LOCALE)
    .map(locale => `- ${locale.native} (${locale.htmlLang}): ${url(localePath(locale.id, '/'))}`)
    .join('\n')

  const body = `# rox

> ${t('site-description')} Native on Linux, macOS and Windows, free and open source under the AGPL-3.0.

Written in Rust on [gpui](https://gpui.rs), the UI framework behind the Zed editor.
The design goal is the Foobar2000 shape (a UI you compose from panels, deep tag
editing, and a theming community) on all three desktop platforms rather than only
Windows. First released in 2026.

Latest release: ${release.version}, published ${release.publishedAt.slice(0, 10)}.

## Key facts

- License: AGPL-3.0. Source at ${SITE.repo}.
- Platforms: Linux (x86_64), macOS (Apple Silicon only), Windows (x86_64). One binary each: on Linux a tarball, a .deb, an AppImage or a Flatpak bundle, on macOS a DMG, on Windows a setup or a portable zip.
- Install: tarball, .deb, AppImage, Flatpak bundle, DMG or zip from the releases page; \`rox-player\` on the AUR; the repo is also a Nix flake. Release candidates ship as GitHub prereleases ahead of a release, and the in-app updater offers them once Include Release Candidates is on under Settings > Application.
- UI: around forty panel types, arranged by the user, duplicated with independent configs, saveable as named presets, and poppable into real OS windows. The album grid's tiles caption themselves under the title with any of artist, genre, year, date added, last played, total length and track count. The track info line is itself composed: an ordered list of pieces (number, title, duration, quality readout, next-up, queue depth, output chip, favourite, rating, inline cover art, gaps, dividers, line breaks) laid out across rows, each row with its own text scale.
- Themes: a "workspace" is one file carrying layout, palette, appearance and any shaders it uses, the shader source and image assets inline. There are ${t('workspace-count', { count: WORKSPACE_COUNT })} in the box.
- Visuals: spectrum, waveform and VU panels, plus user-written WGSL shaders over a single panel, a Shader panel, the whole window, or as a backdrop under everything. Shaders support multi-pass chains and image assets through comment directives, run on all three platforms (Blade on Linux, Metal on macOS, a DirectX path on Windows), and only compile once their source hash is on a machine-local approved list. A panel shader can bind a mask of what the panel itself painted, and read the shape of the panel's content, so an effect follows the drawing rather than the rectangle.
- Milkdrop: presets render through libprojectM, in a Milkdrop panel or as a backdrop behind every window over the blurred cover art. A preset browser with thumbnails, favourites, rotation (whole library, one folder, or favourites) and a lock; colour modes keep the preset's own palette, flip it for the light theme, paint it in the theme's palette, or tint it from the playing cover. The backdrop's switch, strength, colour and flips save into a workspace; the chosen preset and the lock stay per machine. With no packs installed it renders projectM's idle preset.
- Signals: a shared pool of named values pulled off the playing audio (frequency band, overall level, onset, threshold trigger, or a running total of another signal), each with smoothing and a noise gate, routed to shader inputs and the particles panel's parameters with an output span. Built in a Signals window carrying its own spectrum and transport.
- Cue sheets: a whole-disc image plus a .cue is indexed as one real library row per span, keyed by file and track number. Spans seek, sort, scrobble, export to m3u as path#N, and play gaplessly into each other. Ratings and tag edits on a cue row stay in the database rather than stamping the shared file.
- Library: parallel scanner reading full tags, true durations, and per-file codec, sample rate and bit depth. Holds up at 50,000 tracks.
- Tagging: batch editor plus a per-file grid, across ID3v2, Vorbis comments and MP4 atoms. Writes copy-verify-rename rather than in place. Ratings via FMPS and POPM. Find and replace over a batch, literal or regex with $1, previewed with a change count. M4A writes through the same path; fragmented M4A files are refused by name.
- Sort names: artist, album artist, album and title sort tags order the rails, columns and search. A MusicBrainz pass fills artist and album artist sort names into rox's database, never the files. Japanese, Korean and Chinese names get a romanized reading; Japanese kanji needs an optional IPADIC download of about 10 MB. Search folds accents.
- Library Health: a window of per-tag tiles (genre, year, rating, sort names, ReplayGain, tempo, acoustic vectors, file writability) plus checks for missing cover art, duplicates and track-number gaps. Each tile opens the library filtered to the offending tracks or starts the pass that fixes them. A Health widget panel shows the same numbers on a layout.
- File operations: pattern-based tag guessing from filenames, the same pattern run backwards to rename files from their tags (previewed, ids and playlist membership preserved), and format conversion through an ffmpeg the user installed, with five presets and a custom argument line that has to survive a trial encode.
- Playlists: manual playlists with drag reorder and M3U, PLS and XSPF import/export (import reads the format from the file's content), plus smart playlists, which are a saved query in the search box's syntax with optional sort and cap, re-evaluated on every refresh rather than stored as a snapshot.
- Audio: gapless playback, ten-band EQ with named presets, export to Equalizer APO parametric text and an AutoEq browser over the headphone database, crossfade, ReplayGain (read from tags, with Opus R128 gain tags converted to the ReplayGain reference, and an EBU R128 pass for untagged files that can run automatically as new files land), windowed-sinc resampling through rubato, and exclusive output (ALSA hw, WASAPI exclusive, CoreAudio hog mode). Opus decodes in pure Rust and plays gapless; multichannel Opus beyond stereo is refused.
- Playback: queue with shuffle, repeat and play-next; shuffle on a big view samples a hundred tracks across the whole view rather than its top. A-B repeat with no gap at the splice (one key marks A, then B, then clears; also \`roxctl ab\`, \`transport.ab\` on the socket and \`ab_repeat\` on MCP). A sleep timer of 15, 30, 60 or 90 minutes that lets the current track finish. Comma and dot step the playhead by a configurable 25 ms, with a short blip while paused. Ctrl+G opens a go-to-time window.
- Bookmarks: a saved position inside a library track. M drops one at the playhead, Shift+M names and colours it first. Marks draw as chevrons under the seek strip and along the waveform, list in a Bookmarks panel, and Ctrl+Shift+Left/Right step through them. Playing from a mark opens the track already seeked. Stored in rox's database, never in the files, and they survive rescans and a file leaving and returning. A file played from outside the library can't take one. Session markers are the throwaway version: a right click on the seek strip or the waveform drops one, keys step through them, and they're gone when rox closes.
- Radio: internet radio stations, added by URL or found in the radio-browser.info directory under Settings > Sources. A station sits in the queue, in playlists, in history and in search the way a track does, and a Stations panel shows what is on air. A live buffer (ten minutes by default, up to twelve hours) makes a broadcast pausable and rewindable, with the seek strip spanning the buffer and LIVE at its right end; a dropped connection reconnects and marks the gap. The titles a station announces drive scrobbling, the window title, the media card, Discord presence, lyrics and cover art.
- Subsonic: a Subsonic or OpenSubsonic server (Navidrome, Airsonic, gonic) syncs its catalog into the library, where the rows browse, search and play like files. Later syncs reconcile against the server, turning the integration off leaves the rows in place, and streams request the original file so gapless and ReplayGain still apply. The password is stored in accounts.json.
- Stream capture: off by default. Writes whole songs a station plays into a capture folder in the stream's own format, nothing re-encoded, tagged, with the cover art beside the file. Only songs heard start to finish and longer than thirty seconds are kept, and the first song after tuning in is discarded. Names come from the renamer's pattern language plus %station%, %source% and %date%. Song boundaries follow the station's title changes, so a saved song can carry a few seconds of its neighbour.
- Similarity: optional on-device acoustic analysis, driving a Similar column, a similarity shuffle, and queue continuation (browse order, least-played weighting, or radio by sound). Built-in DSP extractor, or PANNs CNN10, or user-supplied weights. Ranked picks fold in an octave-folded tempo distance, so a match is close in speed as well as timbre.
- Tempo: a BPM estimator over the track's own novelty curve, roughly 60 to 210, filling in where no TBPM tag exists. Measured values live in the database only, since writing a guess back would rewrite the file.
- Portable analysis: acoustic descriptions and gain can be written into the files themselves under ROX_ACOUSTIC tags and read back before any decoding, so a copied library skips re-analysis.
- Keyboard: every command carries an id, a scope and its own defaults, and every chord rebinds from the Keymap settings page. The settings file only records what was moved. A design mode switch takes the layout-editing affordances off a finished layout.
- Integrations: MPRIS on Linux, SMTC on Windows, media keys and now-playing on all three. Last.fm, ListenBrainz and Libre.fm scrobbling at one shared threshold, plus a resumable Last.fm import that backfills loved tracks, play counts and the listen history with the scrobbles' own timestamps. lrclib lyrics, MusicBrainz/iTunes/Deezer lookup. A local JSON-RPC socket (with the \`roxctl\` CLI and pushed events) and a \`rox-mcp\` MCP proxy cover transport, queue, library search, rescans and analysis passes.

## Known limits

Stated so a model answering questions about rox does not have to guess.

- No plugin or component API. Shaders are the only user-written code the app runs, and they only affect how a surface looks.
- No aarch64 Linux build, and no Intel macOS build.
- No device sync and no podcasts. Internet radio plays and can be captured, but a podcast feed is not something rox subscribes to. The similarity radio mode is a different thing: it draws from your own library rather than a stream.
- Format conversion needs an ffmpeg on the machine; rox drives it rather than carrying an encoder.
- The Windows binary is unsigned, so SmartScreen warns on first run.
- ReplayGain and bit-perfect output are mutually exclusive, since applying gain modifies samples.
- The Particles panel is behind an experimental toggle on the Development settings page. A workspace that already contains one runs it regardless.
- No AVS preset import, and no MIDI or OSC control surface for the shader parameters. Milkdrop presets are files on disk, so which one is loaded stays per machine rather than inside a workspace.
- Cue support stops short of per-span waveform peaks, per-span ReplayGain, in-app cue editing, and embedded FLAC CUESHEET blocks.

## Main pages

- [Home](${url('/')}): what rox is, a benchmark table against six other players on one 50,000-track library, and the feature summary.
- [Download](${url('/download')}): per-platform builds with sizes, package manager instructions for AUR and Nix, command line flags, and build-from-source notes.
- [Workspaces](${url('/workspaces')}): the ${t('workspace-count', { count: WORKSPACE_COUNT })} shipped looks with screenshots.

## Guides, comparisons and platform notes

${guides}
- [${t(HUB.key)}](${url(HUB.path)}): index of the pages above.

## Other languages

The whole site is also published in the languages below, under a locale prefix:
every page above exists at the same path behind it, and English stays at the
root. The content is the same; nothing is translated selectively.

${languages}

## Optional

- [Source repository](${SITE.repo}): the code, the README feature table, and the spec docs.
- [Releases](${SITE.releases}): every published build and its notes.
- [Documentation](${SITE.docs}): product, architecture and implementation specs, including the ADRs behind the decisions above.
- [Issue tracker](${SITE.issues}): bugs and feature requests.
`

  return new Response(body, {
    headers: { 'content-type': 'text/plain; charset=utf-8' },
  })
}
