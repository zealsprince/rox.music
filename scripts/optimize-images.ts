// Re-encodes rox's screenshots into the responsive AVIF/WebP set the site
// serves. The rox repo stays the source of truth: nothing here edits it, and
// rerunning this after a screenshot changes is the whole update process.
//
//   npm run images                  # reads ../rox
//   ROX_REPO=/path/to/rox npm run images
//
// A source marked `kind: 'content'` reads and writes static/content in this
// repo instead, for images the rox repo has no business carrying.
//
// rox shots ship as theme pairs (Default_Dark.png / Default_Light.png). The
// light half is optional: a missing one means the site keeps showing the dark
// shot on a dark mat. Drop the file in and rerun.
//
// Output is committed, so a normal build needs neither sharp nor the rox
// checkout.

import type { Buffer } from 'node:buffer'
import type { ScreenshotEntry, ScreenshotManifest } from '../src/data/images'
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import sharp from 'sharp'
import { SCREENSHOT_WIDTHS } from '../src/data/images'

interface Source {
  id: string
  from: string
  /**
   * Which pile this image belongs to, deciding where it's read from, where the
   * variants land, and what they're called. Defaults to `rox`.
   */
  kind?: Kind
}

type Kind = 'rox' | 'content'

const ROX = process.env.ROX_REPO ?? path.resolve('../rox')
const CONTENT = path.resolve('static/content')
const MANIFEST = path.resolve('src/data/screenshots.generated.json')

/**
 * `rox` is the app's own screenshots, read from the rox checkout. Every one of
 * them is half of a theme pair, so the output carries `-dark` or `-light`.
 *
 * `content` is everything that isn't rox: screenshots of other people's
 * software, which have no home in the rox repo and live here instead. They read
 * and write in the same folder and get no theme suffix, because a foobar2000
 * screenshot is one image rather than this site's dark half of anything.
 */
const PLACES: Record<Kind, { in: string, out: string, url: string }> = {
  rox: { in: ROX, out: path.resolve('static/screenshots'), url: '/screenshots' },
  content: { in: CONTENT, out: CONTENT, url: '/content' },
}

const SOURCES: Source[] = [
  { id: 'hero', from: 'docs/0S-screenshots/Preview_Dark.png' },
  { id: 'default', from: 'crates/rox/assets/workspaces/Default_Dark.png' },
  { id: 'foobar', from: 'crates/rox/assets/workspaces/Foobar_Dark.png' },
  { id: 'catrox', from: 'crates/rox/assets/workspaces/CaTRoX_Dark.png' },
  { id: 'llama', from: 'crates/rox/assets/workspaces/Llama_Dark.png' },
  { id: 'metro', from: 'crates/rox/assets/workspaces/Metro_Dark.png' },
  { id: 'phosphor', from: 'crates/rox/assets/workspaces/Phosphor_Dark.png' },
  { id: 'critters', from: 'crates/rox/assets/workspaces/Critters_Dark.png' },
  { id: 'diffuse', from: 'crates/rox/assets/workspaces/Diffuse_Dark.png' },
  { id: 'nekorox', from: 'nekorox.png', kind: 'content' },
  { id: 'alpharox', from: 'alpharox.png', kind: 'content' },
]

const placeOf = (source: Source) => PLACES[source.kind ?? 'rox']

const kb = (n: number): string => `${Math.round(n / 1024)} KB`

/** `Default_Dark.png` -> `Default_Light.png` */
const lightPath = (from: string): string => from.replace('_Dark', '_Light')

/**
 * The widths to emit for a source: the ladder rungs below its own width, then
 * its own width on top.
 *
 * Including the native width is the point. Without it a 1416px source topped out
 * at the 1024 rung, because 1440 was skipped as an upscale, and the browser then
 * had nothing sharp enough for a full-width slot on a 2x display.
 *
 * Every returned width is a width that gets written and is used verbatim in the
 * filename, so the manifest and the disk can't disagree.
 */
function targetWidths(intrinsicWidth: number): number[] {
  const rungs = SCREENSHOT_WIDTHS.filter(w => w < intrinsicWidth)
  return [...rungs, intrinsicWidth]
}

/**
 * Writes every target width of one image in both formats. Returns the widths
 * that made it to disk and the bytes they cost.
 */
async function encodeVariant(
  raw: Buffer,
  intrinsicWidth: number,
  outDir: string,
  stem: string,
): Promise<{ widths: number[], bytes: number }> {
  const widths = targetWidths(intrinsicWidth)
  let bytes = 0

  for (const width of widths) {
    const resized = sharp(raw).resize({ width, withoutEnlargement: true })
    const avif = await resized.clone().avif({ quality: 55, effort: 6 }).toBuffer()
    const webp = await resized.clone().webp({ quality: 80 }).toBuffer()

    await fs.writeFile(path.join(outDir, `${stem}-${width}.avif`), avif)
    await fs.writeFile(path.join(outDir, `${stem}-${width}.webp`), webp)
    bytes += avif.length + webp.length
  }

  return { widths, bytes }
}

async function encode(
  source: Source,
): Promise<{ before: number, after: number, entry: ScreenshotEntry }> {
  const kind = source.kind ?? 'rox'
  const place = placeOf(source)
  const input = path.join(place.in, source.from)

  let raw: Buffer
  try {
    raw = await fs.readFile(input)
  }
  catch {
    throw new Error(
      kind === 'content'
        ? `missing ${input}`
        : `missing ${input}\nset ROX_REPO if the rox checkout is not at ${ROX}`,
    )
  }

  const meta = await sharp(raw).metadata()
  if (!meta.width || !meta.height)
    throw new Error(`could not read dimensions of ${input}`)

  // rox output names carry the theme explicitly, since "default" would mislead:
  // some workspaces, like Foobar, default to light. Content images are one
  // image with no counterpart, so they keep the bare id.
  const themed = kind === 'rox'
  const stem = themed ? `${source.id}-dark` : source.id
  const primary = await encodeVariant(raw, meta.width, place.out, stem)

  // The light counterpart is optional and silently absent most of the time.
  let lightStem: string | undefined
  let lightBytes = 0
  let lightBefore = 0
  if (themed) {
    try {
      const lightRaw = await fs.readFile(path.join(place.in, lightPath(source.from)))
      const lightMeta = await sharp(lightRaw).metadata()
      if (lightMeta.width !== meta.width || lightMeta.height !== meta.height) {
        // Mismatched pairs make the box jump when the theme flips, and the
        // manifest only records one intrinsic size for both.
        console.warn(
          `[${source.id}] light variant is ${lightMeta.width}x${lightMeta.height}, `
          + `dark is ${meta.width}x${meta.height}. Shoot the pair at one window size.`,
        )
      }
      lightStem = `${source.id}-light`
      const light = await encodeVariant(lightRaw, meta.width, place.out, lightStem)
      lightBytes = light.bytes
      lightBefore = lightRaw.length
    }
    catch {
      // No light variant for this one. Expected until the shots exist.
      lightStem = undefined
    }
  }

  console.log(
    `${source.id.padEnd(10)} ${meta.width}x${meta.height}  `
    + `${kb(raw.length)} -> ${kb(primary.bytes)}  [${primary.widths.join(', ')}]`
    + `${lightStem ? `  + light ${kb(lightBytes)}` : '  (no light variant)'}`,
  )

  return {
    before: raw.length + lightBefore,
    after: primary.bytes + lightBytes,
    entry: {
      width: meta.width,
      height: meta.height,
      widths: primary.widths,
      // Absolute site paths rather than an id, so a consumer never has to know
      // which folder an image landed in or whether its name carries a theme.
      path: `${place.url}/${stem}`,
      ...(lightStem ? { lightPath: `${place.url}/${lightStem}` } : {}),
    },
  }
}

async function main(): Promise<void> {
  for (const place of Object.values(PLACES))
    await fs.mkdir(place.out, { recursive: true })

  let before = 0
  let after = 0
  const manifest: ScreenshotManifest = {}

  for (const source of SOURCES) {
    const result = await encode(source)
    before += result.before
    after += result.after
    manifest[source.id] = result.entry
  }

  await fs.writeFile(MANIFEST, `${JSON.stringify(manifest, null, 2)}\n`)

  const withLight = Object.values(manifest).filter(e => e.lightPath).length
  console.log(
    `\n${kb(before)} of sources in, ${kb(after)} out across `
    + `${SCREENSHOT_WIDTHS.length} widths and 2 formats`,
  )
  console.log(`${withLight}/${SOURCES.length} have a light variant`)
  console.log(`manifest written to ${path.relative(process.cwd(), MANIFEST)}`)
}

main().catch((error: Error) => {
  console.error(error.message)
  process.exit(1)
})
