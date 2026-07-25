// Re-encodes rox's screenshots into the responsive AVIF/WebP set the site
// serves. The rox repo stays the source of truth: nothing here edits it, and
// rerunning this after a screenshot changes is the whole update process.
//
//   npm run images                  # reads ../rox
//   ROX_REPO=/path/to/rox npm run images
//
// Each screenshot may have a light-theme counterpart, named by suffixing the
// source with `-light` (Default.png -> Default-light.png). It is optional: a
// missing one just means that image has no light variant and the site keeps
// showing the dark shot on a dark mat. Drop the file in and rerun.
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
  { id: 'hero', from: 'docs/0S-screenshots/nekorox.jpg' },
  { id: 'default', from: 'crates/rox/assets/workspaces/Default.png' },
  { id: 'foobar', from: 'crates/rox/assets/workspaces/Foobar.png' },
  { id: 'llama', from: 'crates/rox/assets/workspaces/Llama.png' },
  { id: 'metro', from: 'crates/rox/assets/workspaces/Metro.png' },
  { id: 'phosphor', from: 'crates/rox/assets/workspaces/Phosphor.png' },
]

const kb = (n: number): string => `${Math.round(n / 1024)} KB`

/** `a/b/Default.png` -> `a/b/Default-light.png` */
function lightPath(from: string): string {
  const ext = path.extname(from)
  return `${from.slice(0, -ext.length)}-light${ext}`
}

/**
 * Writes every width of one image in both formats, skipping widths past the
 * source's own so no srcset can ever advertise a file that was not written.
 * Returns the widths that made it to disk and the bytes they cost.
 */
async function encodeVariant(
  raw: Buffer,
  intrinsicWidth: number,
  outPrefix: string,
): Promise<{ widths: number[], bytes: number }> {
  const widths: number[] = []
  let bytes = 0

  for (const width of SCREENSHOT_WIDTHS) {
    // Never upscale. A width past the source only gets emitted when it is the
    // smallest one, so every screenshot has at least one variant.
    if (width > intrinsicWidth && width !== SCREENSHOT_WIDTHS[0])
      continue

    const resized = sharp(raw).resize({ width, withoutEnlargement: true })
    const avif = await resized.clone().avif({ quality: 55, effort: 6 }).toBuffer()
    const webp = await resized.clone().webp({ quality: 80 }).toBuffer()

    await fs.writeFile(path.join(OUT, `${outPrefix}-${width}.avif`), avif)
    await fs.writeFile(path.join(OUT, `${outPrefix}-${width}.webp`), webp)
    bytes += avif.length + webp.length
    widths.push(Math.min(width, intrinsicWidth))
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

  const dark = await encodeVariant(raw, meta.width, source.id)

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
