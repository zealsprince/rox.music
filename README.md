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

`npm run lint`, `npm run typecheck` and `npm run locales` all run in CI and must pass.

## Project structure

```text
scripts/         # Node tooling, run through tsx
src/
  components/    # Svelte components
  data/          # Page structure and config as typed modules
  lib/i18n/      # Locale registry, message lookup, inline markup
  lib/server/    # Build-time only, runs during prerender
  locales/       # One Fluent catalog per language
  params/        # Route param matchers
  routes/        # SvelteKit routes, all under [[lang]]
  types/         # Shared types
  enhance.ts     # The entire client runtime
static/          # Copied to the site root verbatim
```

Copy lives in `src/locales`. `src/data` holds the shape around it: which cells a
grid has, which sections a page has, which message key fills each one.

## Languages

The site ships in the same languages rox itself does, with the same source
locale and the same Fluent catalogs: `src/locales/<id>/rox.ftl` here,
`crates/rox-i18n/locales/<id>/rox.ftl` there. A string that exists in both
should carry the same key. The decision behind the stack is
[ADR 27](https://github.com/zealsprince/rox/blob/main/docs/02-architecture/decisions/27-adr-i18n.md)
in the rox repo.

English lives at the site root and the rest sit behind a locale prefix, so
`/download` and `/de/download` are the same page. Every route is under
`[[lang=locale]]`, and the prerender crawler finds the translations through the
language picker in the header, which is the only reason `/de` gets built at all.
Slugs stay English: a translated path is a second URL to keep alive forever, and
the one already indexed is worth more than the keyword.

Adding a language is one row in `LOCALES` (`src/lib/i18n/registry.ts`) and one
ftl file mirroring en-CA. Everything else follows: the picker, the hreflang
tags, the sitemap and the prerender all read the registry.

```bash
npm run locales                       # parity gate, also runs in CI
ROX_PSEUDOLOCALE=1 npm run dev        # brackets and pads every resolved string
```

The parity check fails when a locale's key inventory drifts from en-CA in either
direction, and warns about keys nothing in `src` names. The pseudo-locale is how
you find the literal that dodged extraction: it's the only text on the page
without brackets, and it shows you which layouts can't absorb German-length
copy before German does.

Messages can carry `[links](/paths)`, `[aliases](@repo)`, `` `code` ``,
`**bold**` and `_italic_`. `renderRich` in `src/lib/i18n` turns those into HTML
and the `<Rich>` component renders them; nothing else on the site writes
`{@html}`. Aliases resolve through the table at the bottom of that file, which
is where a URL linked more than once belongs, along with any `rel` it needs.
Anything targeting an element inside rich text needs `:global()`, since Svelte's
scoping class never lands on markup it didn't compile.

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

## Download counts

The download page carries an all-time tally in the top right and a `Stats` disclosure
under the platform cards. The landing page ends on the same breakdown. Each platform is a
full-width strip, one segment per release with the oldest on the left, shaded against that
platform's own best release; a segment's `title` carries the version, the date and the
number. Built at prerender, so it works with JavaScript off, and `<details>` does the
folding without any.

`src/lib/server/downloads.ts` reads the counts off the GitHub releases API, with the same
cache-then-fallback layering as the release loader. Nothing has to be stored for this: a
release is already a point in time and its `download_count` is its own.

A `Week` / `Release` button group switches between two views of the same counts. It's the
radio-and-`:has()` switcher the workspaces page uses, so the state lives in the markup and
no script runs. Two thresholds, not one: the control appears at four complete weeks, and
week becomes the view the page opens on at twenty-six. Between them the weekly strip is
there to be picked but doesn't lead, because a handful of recent weeks says less about the
project than every release it has shipped.

The weekly view is the one that needs storage, because `download_count` is a running total
GitHub keeps no history for and a month not recorded can't be recovered later.
`.github/workflows/snapshot.yml` writes one row a day into the tracked
`src/data/downloads.history.json` and commits it. A week is worth the difference between
its last snapshot and the previous week's, so the view appears once four complete weeks
exist. Weeks run Monday to Sunday, the one in progress is left out because a partial week
always draws short, and a gap in the snapshots lands on the week that ends it rather than
going missing.

The snapshot workflow runs an hour before the deploy cron rather than triggering a deploy,
because commits made with the default `GITHUB_TOKEN` don't fire other workflows.

```bash
npm run snapshot                      # appends today's row, idempotent
ROX_MOCK_HISTORY=1 npm run dev        # invents 30 weeks, so the weekly view leads
ROX_MOCK_HISTORY=10 npm run dev       # 10 weeks, offered but not leading
```

The weekly strip is the one thing here that can't be checked by building it, since it
needs months of samples that only exist after months. `src/lib/server/mock-history.ts`
generates a deterministic set so the layout can be looked at now. It's gated on `dev` as
well as on the variable, so a build with `ROX_MOCK_HISTORY` set in the environment still
reads the real file and there is no path from it to a published page.

Counts cover the GitHub release assets and nothing else. The AUR reports votes and a
popularity score rather than installs, and the flake reports nothing, so adding either to
the total would mean inventing a number.

## Screenshots

Source images live in the rox repo. `npm run images` re-encodes them into the AVIF and
WebP set under `static/screenshots` and writes `src/data/screenshots.generated.json`,
which `Screenshot.svelte` uses to build its `srcset`. Output is committed, so a normal
build needs neither sharp nor a rox checkout.

```bash
npm run images                        # expects ../rox
ROX_REPO=/path/to/rox npm run images
```

Images with no home in the rox repo, like screenshots of other people's software, are
marked `kind: 'content'` in the source list and both read and written under
`static/content` instead.

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

`src/tokens.scss` mirrors rox's palette from `crates/rox-design/src/palette.rs`, role
for role. Change a role in the app and change it here.

## License

[MIT](LICENSE)
