# rox.music

The marketing and download site for [rox](https://github.com/zealsprince/rox). SvelteKit
prerendered to static HTML, served from GitHub Pages.

Every route is prerendered with `csr = false`, so no framework JavaScript reaches the
browser. The only script the site loads is `src/enhance.ts`, bundled to about a kilobyte,
which handles the theme toggle and picks the download matching the visitor's OS. Both are
enhancements: the pages are complete and usable without them.

## Getting Started

### Prerequisites

- Node.js, version in `.node-version`
- A `rox` checkout beside this one, only for regenerating screenshots

### Development

```bash
npm install
npm run dev
npm run build
npm run preview
```

`npm run lint` and `npm run typecheck` both run in CI and must pass.

## Project Structure

```text
scripts/         # Node tooling, run through tsx
src/
  components/    # Svelte components
  data/          # Site content and config as typed modules
  lib/server/    # Build-time only, runs during prerender
  routes/        # SvelteKit routes
  types/         # Shared types
  enhance.ts     # The entire client runtime
static/          # Copied to the site root verbatim
```

Page content lives in `src/data` as typed modules rather than markdown. These are designed
pages, not prose, so the copy sits next to the layout that renders it.

## Release data

The download page needs the current version and per-platform asset URLs. It fetches the
latest release from the GitHub API during prerender and bakes the result into the HTML, so
visitors never call the API and never hit its rate limit.

`src/lib/server/release.ts` has two fallbacks. A local cache keeps `npm run dev` off the
network between restarts, and a committed snapshot in `src/data/release.fallback.json`
keeps a GitHub outage from failing the build. A build that falls back logs a warning and
ships the last known release.

A new rox release reaches the site through a `repository_dispatch` of type `rox-release`,
fired by rox's own release workflow, which triggers a rebuild here.

Regenerate the fallback snapshot when the asset naming in rox changes:

```bash
curl -s https://api.github.com/repos/zealsprince/rox/releases/latest > /tmp/rel.json
```

## Screenshots

Source images live in the rox repo and stay there. `npm run images` re-encodes them into
the responsive AVIF and WebP set under `static/screenshots`, and writes
`src/data/screenshots.generated.json` recording each image's intrinsic size and the widths
that actually got emitted. `Screenshot.svelte` builds its `srcset` from that manifest, so
it can never advertise a file the encoder skipped.

Output is committed, so a normal build needs neither sharp nor a rox checkout.

```bash
npm run images                        # expects ../rox
ROX_REPO=/path/to/rox npm run images
```

## Icons

UI icons come from `@lucide/svelte`. Brand marks live in `src/components/icons` as
plain components: Apple, Tux and GitHub carry paths from simple-icons (CC0-1.0), and
Windows is drawn here because simple-icons dropped it over trademark.

They are local rather than a dependency because `@icons-pack/svelte-simple-icons` ships
raw `.svelte` files behind an export map declaring only a `svelte` condition, which Vite
will not resolve when it externalises for SSR. Working around that costs an `ssr.noExternal`
entry and a barrel import that pulls all ~3000 icons. Four marks did not justify either.
If the count ever grows past a handful, take the dependency and the workaround together.

Because routes are `csr = false`, every icon renders to inline SVG at prerender and adds
nothing to the browser's JavaScript. The only cost is HTML: roughly 300 bytes per icon,
except Tux, whose path is 5.3 KB on its own and is most of the download page's markup.

## Social cards and app icons

`npm run assets` draws the app icons and the Open Graph cards from the rox mark. Output is
committed and this does not run during a build: sharp renders SVG text with the host's
fonts, and a CI runner's font set is not a workstation's.

## Fonts

The site uses the system UI stack, which costs zero requests and zero bytes. Adding a
webfont means self-hosting the woff2 under `static/fonts`, a `@font-face` with
`font-display: swap`, and a `preload` in `app.html`. Do not reach for a Google Fonts
`@import`: it puts a blocking third-party request on the critical path.

## Colors

`src/tokens.scss` carries rox's own palette, lifted role for role from
`crates/rox/src/design/palette.rs`. Dark is the app's default ladder, light is the
counterpart it swaps in under a bright cover. Change a role in the app and change it here.

## License

[MIT](LICENSE)
