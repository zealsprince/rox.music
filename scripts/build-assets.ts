// Generates the app icons and social cards from the rox mark. Output is
// committed, so this runs when the branding changes and never during a normal
// build or in CI. Keeping it out of the build path also keeps text rendering
// off the critical path: sharp draws SVG text with whatever fonts the machine
// has, and a CI runner's font set is not this machine's.
//
//   npm run assets

import { Buffer } from 'node:buffer'
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import sharp from 'sharp'

const STATIC = path.resolve('static')

// The mark, in its measured bounding box. Same path as src/components/Logo.svelte.
const MARK
  = 'M257.04,474.529C122.391,341.297 61.981,140.351 211.128,59C210.725,59.398 '
    + '186.275,141.334 216.699,154.869C240.286,131.53 265.432,114.675 294.001,131.714'
    + 'C318.245,131.714 372.072,52.549 370.363,13.718C399.153,42.205 552.677,168.191 '
    + '361.83,355.767C361.177,356.409 277.04,454.74 257.04,474.529Z'

const INK = '#121212'
const AMBER = '#ffb300'
const DIM = '#a0a0a0'

/** The mark alone on the dark surface, square, for app icons. */
function iconSvg(size: number): string {
  // The mark is 336 x 464.8. Fit it to 62% of the square by height and centre it.
  const scale = (size * 0.62) / 464.8
  const x = (size - 336 * scale) / 2 - 122 * scale
  const y = (size - 464.8 * scale) / 2 - 11.7 * scale
  return `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}">
  <rect width="${size}" height="${size}" fill="${INK}"/>
  <g transform="translate(${x} ${y}) scale(${scale})">
    <path d="${MARK}" fill="${AMBER}"/>
  </g>
</svg>`
}

/**
 * 1200x630 Open Graph card: mark and wordmark on one line, copy below, domain
 * at the foot. The mark is 336 x 464.8 in its own space, so its drawn width is
 * derived from the target height rather than guessed, and the wordmark starts
 * clear of it.
 */
function cardSvg(heading: string, sub: string): string {
  const markHeight = 150
  const scale = markHeight / 464.8
  const markWidth = 336 * scale
  const left = 90
  const markTop = 96
  // Optical centring: the cap height of the wordmark against the mark's box.
  const wordBaseline = markTop + markHeight * 0.78
  const wordLeft = left + markWidth + 34

  return `<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="630">
  <rect width="1200" height="630" fill="${INK}"/>
  <rect x="0" y="0" width="1200" height="6" fill="${AMBER}"/>
  <g transform="translate(${left - 122 * scale} ${markTop - 11.7 * scale}) scale(${scale})">
    <path d="${MARK}" fill="${AMBER}"/>
  </g>
  <text x="${wordLeft}" y="${wordBaseline}" font-family="Helvetica, Arial, sans-serif"
        font-size="118" font-weight="700" fill="#e0e0e0" letter-spacing="-5">${heading}</text>
  <text x="${left}" y="380" font-family="Helvetica, Arial, sans-serif" font-size="46"
        font-weight="400" fill="${DIM}">${sub}</text>
  <text x="${left}" y="545" font-family="Helvetica, Arial, sans-serif" font-size="30"
        font-weight="400" fill="${AMBER}">rox.music</text>
</svg>`
}

const CARDS = [
  {
    file: 'social/default.png',
    heading: 'rox',
    sub: 'If Foobar2000 was made in the current year.',
  },
  {
    file: 'social/download.png',
    heading: 'rox',
    sub: 'Download for Linux, macOS and Windows.',
  },
  {
    file: 'social/workspaces.png',
    heading: 'rox',
    sub: 'A whole look in one shareable file.',
  },
  {
    file: 'social/visualizer.png',
    heading: 'rox',
    sub: 'Signals off the music, shaders on every surface.',
  },
]

const ICONS = [
  { file: 'icon-180.png', size: 180 },
  { file: 'icon-192.png', size: 192 },
  { file: 'icon-512.png', size: 512 },
]

async function write(file: string, svg: string): Promise<void> {
  const out = path.join(STATIC, file)
  await fs.mkdir(path.dirname(out), { recursive: true })
  const png = await sharp(Buffer.from(svg)).png({ compressionLevel: 9 }).toBuffer()
  await fs.writeFile(out, png)
  console.log(`${file.padEnd(24)} ${Math.round(png.length / 1024)} KB`)
}

async function main(): Promise<void> {
  for (const icon of ICONS)
    await write(icon.file, iconSvg(icon.size))

  for (const card of CARDS)
    await write(card.file, cardSvg(card.heading, card.sub))
}

main().catch((error: Error) => {
  console.error(error.message)
  process.exit(1)
})
