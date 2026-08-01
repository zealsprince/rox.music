// Re-encodes rox's screenshots into the responsive AVIF/WebP set the site
// serves. The rox repo stays the source of truth: nothing here edits it, and
// rerunning this after a screenshot changes is the whole update process.
//
//   npm run images                  # reads ../rox
//   ROX_REPO=/path/to/rox npm run images
//
// Each screenshot may have a light-theme counterpart. Workspace shots ship as
// pairs (Default_Dark.png / Default_Light.png); anything else names its light
// variant by suffixing the source with `-light` (nekorox.jpg ->
// nekorox-light.jpg). It is optional: a missing one just means that image has
// no light variant and the site keeps showing the dark shot on a dark mat.
// Drop the file in and rerun.
//
// Output lands in static/screenshots and is committed, so a normal build needs
// neither sharp nor the rox checkout.

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
}

const ROX = process.env.ROX_REPO ?? path.resolve('../rox')
const OUT = path.resolve('static/screenshots')
const MANIFEST = path.resolve('src/data/screenshots.generated.json')

const SOURCES: Source[] = [
  { id: 'hero', from: 'docs/0S-screenshots/Preview_Dark.png' },
  { id: 'default', from: 'crates/rox/assets/workspaces/Default_Dark.png' },
  { id: 'foobar', from: 'crates/rox/assets/workspaces/Foobar_Dark.png' },
  { id: 'catrox', from: 'crates/rox/assets/workspaces/CaTRoX_Dark.png' },
  { id: 'llama', from: 'crates/rox/assets/workspaces/Llama_Dark.png' },
  { id: 'metro', from: 'crates/rox/assets/workspaces/Metro_Dark.png' },
  { id: 'phosphor', from: 'crates/rox/assets/workspaces/Phosphor_Dark.png' },
]

const kb = (n: number): string => `${Math.round(n / 1024)} KB`

/** `Default_Dark.png` -> `Default_Light.png`, else `nekorox.jpg` -> `nekorox-light.jpg` */
function lightPath(from: string): string {
  if (from.includes('_Dark'))
    return from.replace('_Dark', '_Light')
  const ext = path.extname(from)
  return `${from.slice(0, -ext.length)}-light${ext}`
}

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
  outPrefix: string,
): Promise<{ widths: number[], bytes: number }> {
  const widths = targetWidths(intrinsicWidth)
  let bytes = 0

  for (const width of widths) {
    const resized = sharp(raw).resize({ width, withoutEnlargement: true })
    const avif = await resized.clone().avif({ quality: 55, effort: 6 }).toBuffer()
    const webp = await resized.clone().webp({ quality: 80 }).toBuffer()

    await fs.writeFile(path.join(OUT, `${outPrefix}-${width}.avif`), avif)
    await fs.writeFile(path.join(OUT, `${outPrefix}-${width}.webp`), webp)
    bytes += avif.length + webp.length
  }

  return { widths, bytes }
}

async function encode(
  source: Source,
): Promise<{ before: number, after: number, entry: ScreenshotEntry }> {
  const input = path.join(ROX, source.from)

  let raw: Buffer
  try {
    raw = await fs.readFile(input)
  }
  catch {
    throw new Error(
      `missing ${input}\nset ROX_REPO if the rox checkout is not at ${ROX}`,
    )
  }

  const meta = await sharp(raw).metadata()
  if (!meta.width || !meta.height)
    throw new Error(`could not read dimensions of ${input}`)

  // Output names carry the theme explicitly (`<id>-dark`, `<id>-light`), since
  // "default" would mislead: some workspaces, like Foobar, default to light.
  const dark = await encodeVariant(raw, meta.width, `${source.id}-dark`)

  // The light counterpart is optional and silently absent most of the time.
  let hasLight = false
  let lightBytes = 0
  let lightBefore = 0
  try {
    const lightRaw = await fs.readFile(path.join(ROX, lightPath(source.from)))
    const lightMeta = await sharp(lightRaw).metadata()
    if (lightMeta.width !== meta.width || lightMeta.height !== meta.height) {
      // Mismatched pairs make the box jump when the theme flips, and the
      // manifest only records one intrinsic size for both.
      console.warn(
        `[${source.id}] light variant is ${lightMeta.width}x${lightMeta.height}, `
        + `dark is ${meta.width}x${meta.height}. Shoot the pair at one window size.`,
      )
    }
    const light = await encodeVariant(lightRaw, meta.width, `${source.id}-light`)
    hasLight = true
    lightBytes = light.bytes
    lightBefore = lightRaw.length
  }
  catch {
    // No light variant for this one. Expected until the shots exist.
  }

  console.log(
    `${source.id.padEnd(10)} ${meta.width}x${meta.height}  `
    + `${kb(raw.length)} -> ${kb(dark.bytes)}  [${dark.widths.join(', ')}]`
    + `${hasLight ? `  + light ${kb(lightBytes)}` : '  (no light variant)'}`,
  )

  return {
    before: raw.length + lightBefore,
    after: dark.bytes + lightBytes,
    entry: {
      width: meta.width,
      height: meta.height,
      widths: dark.widths,
      hasLight,
    },
  }
}

async function main(): Promise<void> {
  await fs.mkdir(OUT, { recursive: true })

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

  const withLight = Object.values(manifest).filter(e => e.hasLight).length
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
