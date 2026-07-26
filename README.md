# rox.music

The marketing and download site for [rox](https://github.com/zealsprince/rox). SvelteKit
prerendered to static HTML, served from GitHub Pages.

Every route is prerendered with `csr = false`, so no framework JavaScript reaches the
browser. The only script is `src/enhance.ts`, about a kilobyte, which handles the theme
toggle and picks the download matching the visitor's OS. The pages work without it.

## Getting started

Node.js, version in `.node-version`.

```bash
npm install
npm run dev
npm run build
npm run preview
```

`npm run lint` and `npm run typecheck` both run in CI and must pass.

## Project structure

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

Page content lives in `src/data` as typed modules, next to the layout that renders it.

## Release data

The download page fetches the latest release from the GitHub API during prerender and
bakes it into the HTML. `src/lib/server/release.ts` falls back to a local cache, then to
the committed snapshot `src/data/release.fallback.json`, with a warning when it does.
A new rox release triggers a rebuild here through a `repository_dispatch` of type
`rox-release`, fired by rox's release workflow.

Regenerate the fallback snapshot when rox's asset naming changes:

```bash
curl -s https://api.github.com/repos/zealsprince/rox/releases/latest > /tmp/rel.json
```

## Screenshots

Source images live in the rox repo. `npm run images` re-encodes them into the AVIF and
WebP set under `static/screenshots` and writes `src/data/screenshots.generated.json`,
which `Screenshot.svelte` uses to build its `srcset`. Output is committed, so a normal
build needs neither sharp nor a rox checkout.

```bash
npm run images                        # expects ../rox
ROX_REPO=/path/to/rox npm run images
```

## Icons

UI icons come from `@lucide/svelte`. Brand marks live in `src/components/icons` as plain
components: Apple, Tux and GitHub carry paths from simple-icons (CC0-1.0), and Windows is
drawn here because simple-icons dropped it. They're local because the simple-icons Svelte
package needs an `ssr.noExternal` workaround plus a barrel import of ~3000 icons, which
four marks didn't justify. If the count grows past a handful, take the dependency.

Icons render to inline SVG at prerender. The cost is markup: roughly 300 bytes each,
except Tux at 5.3 KB.

## Social cards and app icons

`npm run assets` draws the app icons and the Open Graph cards from the rox mark. Output
is committed and it doesn't run during a build, because sharp renders SVG text with the
host's fonts.

## Fonts

The site uses the system UI stack. If a webfont ever lands, self-host the woff2 under
`static/fonts` with `font-display: swap` and a `preload`; no Google Fonts `@import`.

## Colors

`src/tokens.scss` mirrors rox's palette from `crates/rox/src/design/palette.rs`, role
for role. Change a role in the app and change it here.

## License

[MIT](LICENSE)
