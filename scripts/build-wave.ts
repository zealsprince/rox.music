// Draws the hero's backdrop tile: the dot field with the dots stacked into
// waveforms, as an alpha PNG the page uses as a CSS mask. Rasterised here
// rather than shipped as an SVG, so the browser paints a small bitmap instead
// of a few thousand circles every time the hero lays out. Output is committed.
//
//   npm run wave

import { Buffer } from 'node:buffer'
import path from 'node:path'
import process from 'node:process'
import sharp from 'sharp'

const OUT = path.resolve('static/hero-wave.png')

// The tile in CSS pixels, drawn at twice that for 2x screens. The page sizes
// the mask to this: keep mask-size in +page.svelte in step.
const TILE = { width: 576, height: 288 }
const SCALE = 2

const ROWS = 3
const PITCH = 8
const DOT_PITCH = 6
const DOT = 1.1

/** A small LCG, so the tile is the same on every run. */
function rng(seed: number): () => number {
  let s = seed >>> 0
  return () => {
    s = (Math.imul(s, 1664525) + 1013904223) >>> 0
    return s / 2 ** 32
  }
}

const random = rng(5)
const clamp = (v: number, lo: number, hi: number): number => Math.min(hi, Math.max(lo, v))

/**
 * One row's envelope as a sum of whole-period sines, so the row repeats
 * seamlessly across the tile's edge. Each row draws its own phases and
 * weights, which is what keeps the swells of one row off the swells of the
 * next.
 */
function envelope(): (x: number) => number {
  const parts = [1, 2, 3, 5].map(period => ({
    period,
    phase: random(),
    weight: (0.9 / period) * (0.6 + random() * 0.8),
  }))
  const total = parts.reduce((sum, p) => sum + p.weight, 0)
  return (x) => {
    const v = parts.reduce((sum, p) => sum + p.weight * Math.sin(2 * Math.PI * (p.period * x + p.phase)), 0)
    return clamp(0.5 + v / total / 2, 0, 1)
  }
}

function tileSvg(): string {
  const rowHeight = TILE.height / ROWS
  const columns = TILE.width / PITCH
  let d = ''

  for (let row = 0; row < ROWS; row++) {
    const level = envelope()
    // Columns a third of a pitch over per row and the dot grid a third of a
    // step down, so no dot in one row sits straight above a dot in another.
    const columnShift = (row * PITCH) / ROWS
    const gridShift = (row * DOT_PITCH) / ROWS
    const centre = row * rowHeight + rowHeight / 2 + gridShift

    for (let i = 0; i < columns; i++) {
      const x = (i + 0.5) / columns
      const amount = clamp(level(x) * (0.6 + random() * 0.5), 0.05, 0.92)
      const half = Math.floor((amount * rowHeight) / 2 / DOT_PITCH)
      const cx = i * PITCH + PITCH / 2 + columnShift
      for (let k = -half; k <= half; k++) {
        const cy = centre + k * DOT_PITCH
        d += `M${cx - DOT} ${cy}a${DOT} ${DOT} 0 1 0 ${DOT * 2} 0a${DOT} ${DOT} 0 1 0 ${-DOT * 2} 0`
      }
    }
  }

  // Drawn twice, offset by a whole tile either way, so a dot column that
  // crosses the right edge comes back in on the left.
  return `<svg xmlns="http://www.w3.org/2000/svg" width="${TILE.width}" height="${TILE.height}" viewBox="0 0 ${TILE.width} ${TILE.height}">
  <path d="${d}" fill="#fff"/>
  <path d="${d}" fill="#fff" transform="translate(${-TILE.width} 0)"/>
  <path d="${d}" fill="#fff" transform="translate(${TILE.width} 0)"/>
</svg>`
}

async function main(): Promise<void> {
  const png = await sharp(Buffer.from(tileSvg()), { density: 72 * SCALE })
    .png({ compressionLevel: 9, palette: true })
    .toBuffer()
  await sharp(png).toFile(OUT)
  const meta = await sharp(OUT).metadata()
  console.log(`wave tile ${meta.width}x${meta.height}, ${Math.round(png.length / 1024)} KB -> ${path.relative(process.cwd(), OUT)}`)
}

main()
