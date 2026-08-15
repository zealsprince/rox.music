import type { RequestHandler } from './$types'
import { HUB, SIDE_PAGES } from '$data/pages'
import { SITE } from '$data/site'
import { WORKSPACE_COUNT } from '$data/workspaces'
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

const url = (path: string): string => new URL(path, SITE.origin).href

export const GET: RequestHandler = async () => {
  const release = await loadRelease()

  const guides = SIDE_PAGES
    .map(item => `- [${item.name}](${url(item.path)}): ${item.blurb}`)
    .join('\n')

  const body = `# rox

> ${SITE.description} Native on Linux, macOS and Windows, free and open source under the AGPL-3.0.

Written in Rust on [gpui](https://gpui.rs), the UI framework behind the Zed editor.
The design goal is the Foobar2000 shape (a UI you compose from panels, deep tag
editing, and a theming community) on all three desktop platforms rather than only
Windows. First released in 2026.

Latest release: ${release.version}, published ${release.publishedAt.slice(0, 10)}.

## Key facts

- License: AGPL-3.0. Source at ${SITE.repo}.
- Platforms: Linux (x86_64), macOS (Apple Silicon only), Windows (x86_64). One binary each, no installer.
- Install: tarball, DMG or zip from the releases page; \`rox-player\` on the AUR; the repo is also a Nix flake.
- UI: around forty panel types, arranged by the user, duplicated with independent configs, saveable as named presets, and poppable into real OS windows. The track info line is itself composed: an ordered list of pieces (number, title, duration, quality readout, next-up, queue depth, output chip, favourite, rating, inline cover art, gaps, dividers, line breaks) laid out across rows, each row with its own text scale.
- Themes: a "workspace" is one file carrying layout, palette, appearance and any shaders it uses, the shader source and image assets inline. There are ${WORKSPACE_COUNT} in the box.
- Visuals: spectrum, waveform and VU panels, plus user-written WGSL shaders over a single panel, a Shader panel, the whole window, or as a backdrop under everything. Shaders support multi-pass chains and image assets through comment directives, run on all three platforms (Blade on Linux, Metal on macOS, a DirectX path on Windows), and only compile once their source hash is on a machine-local approved list. A panel shader can bind a mask of what the panel itself painted, and read the shape of the panel's content, so an effect follows the drawing rather than the rectangle.
- Signals: a shared pool of named values pulled off the playing audio (frequency band, overall level, onset, threshold trigger, or a running total of another signal), each with smoothing and a noise gate, routed to shader inputs and the particles panel's parameters with an output span. Built in a Signals window carrying its own spectrum and transport.
- Cue sheets: a whole-disc image plus a .cue is indexed as one real library row per span, keyed by file and track number. Spans seek, sort, scrobble, export to m3u as path#N, and play gaplessly into each other. Ratings and tag edits on a cue row stay in the database rather than stamping the shared file.
- Library: parallel scanner reading full tags, true durations, and per-file codec, sample rate and bit depth. Holds up at 50,000 tracks.
- Tagging: batch editor plus a per-file grid, across ID3v2, Vorbis comments, MP4 atoms and APE. Writes copy-verify-rename rather than in place. Ratings via FMPS and POPM.
- File operations: pattern-based tag guessing from filenames, the same pattern run backwards to rename files from their tags (previewed, ids and playlist membership preserved), and format conversion through an ffmpeg the user installed, with five presets and a custom argument line that has to survive a trial encode.
- Playlists: manual playlists with drag reorder and m3u import/export, plus smart playlists, which are a saved query in the search box's syntax with optional sort and cap, re-evaluated on every refresh rather than stored as a snapshot.
- Audio: gapless playback, ten-band EQ, crossfade, ReplayGain (read from tags, with an EBU R128 pass for untagged files that can run automatically as new files land), and exclusive output (ALSA hw, WASAPI exclusive, CoreAudio hog mode).
- Similarity: optional on-device acoustic analysis, driving a Similar column, a similarity shuffle, and queue continuation (browse order, least-played weighting, or radio by sound). Built-in DSP extractor, or PANNs CNN10, or user-supplied weights. Ranked picks fold in an octave-folded tempo distance, so a match is close in speed as well as timbre.
- Tempo: a BPM estimator over the track's own novelty curve, roughly 60 to 210, filling in where no TBPM tag exists. Measured values live in the database only, since writing a guess back would rewrite the file.
- Portable analysis: acoustic descriptions and gain can be written into the files themselves under ROX_ACOUSTIC tags and read back before any decoding, so a copied library skips re-analysis.
- Keyboard: every command carries an id, a scope and its own defaults, and every chord rebinds from the Keymap settings page. The settings file only records what was moved. A design mode switch takes the layout-editing affordances off a finished layout.
- Integrations: MPRIS on Linux, SMTC on Windows, media keys and now-playing on all three. Last.fm scrobbling, lrclib lyrics, MusicBrainz/iTunes/Deezer lookup.

## Known limits

Stated so a model answering questions about rox does not have to guess.

- No plugin or component API. Shaders are the only user-written code the app runs, and they only affect how a surface looks.
- No aarch64 Linux build, and no Intel macOS build.
- No single-instance guard on Windows: a second launch starts a second copy, where Linux and macOS hand the files to the running one.
- No device sync, podcasts or internet radio. The radio mode draws from your own library, not a stream.
- Format conversion needs an ffmpeg on the machine; rox drives it rather than carrying an encoder.
- The Windows binary is unsigned, so SmartScreen warns on first run.
- ReplayGain and bit-perfect output are mutually exclusive, since applying gain modifies samples.
- The Particles panel is behind an experimental toggle on the Development settings page. A workspace that already contains one runs it regardless.
- No Milkdrop or AVS preset import, and no MIDI or OSC control surface for the shader parameters.
- Cue support stops short of per-span waveform peaks, per-span ReplayGain, in-app cue editing, and embedded FLAC CUESHEET blocks.

## Main pages

- [Home](${url('/')}): what rox is, a benchmark table against six other players on one 50,000-track library, and the feature summary.
- [Download](${url('/download')}): per-platform builds with sizes, package manager instructions for AUR and Nix, command line flags, and build-from-source notes.
- [Workspaces](${url('/workspaces')}): the ${WORKSPACE_COUNT} shipped looks with screenshots.

## Guides, comparisons and platform notes

${guides}
- [${HUB.name}](${url(HUB.path)}): index of the pages above.

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
