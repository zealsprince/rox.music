// Makes trailing-slash URLs resolve.
//
// `trailingSlash: 'never'` writes build/download.html. GitHub Pages serves that
// for /download, but /download/ looks only for download/index.html, so anyone
// who pastes a URL with a trailing slash gets a 404. Pages cannot redirect, and
// people paste trailing slashes constantly.
//
// So every page also gets copied to <name>/index.html. Both forms return 200,
// and because the copy carries the same canonical tag as the original, search
// engines still index exactly one URL: the slash-free one. That is the reason to
// copy rather than to switch trailingSlash to 'always', which would rewrite
// every canonical and churn URLs that are already indexed.
//
// It walks, rather than reading the top level, because the translations live a
// directory down: build/de/download.html needs build/de/download/index.html the
// same way the English one does, and a flat pass would have quietly left three
// languages' worth of pasted URLs broken.

import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'

const BUILD = path.resolve('build')

// index.html is already the root document, and 404.html is what Pages serves
// for unmatched paths. Neither has a trailing-slash form worth creating.
const SKIP = new Set(['index.html', '404.html'])

async function alias(dir: string): Promise<number> {
  const entries = await fs.readdir(dir, { withFileTypes: true })
  let count = 0

  for (const entry of entries) {
    if (entry.isDirectory()) {
      count += await alias(path.join(dir, entry.name))
      continue
    }
    if (!entry.name.endsWith('.html') || SKIP.has(entry.name))
      continue

    const name = entry.name.slice(0, -'.html'.length)
    const target = path.join(dir, name)
    await fs.mkdir(target, { recursive: true })
    await fs.copyFile(path.join(dir, entry.name), path.join(target, 'index.html'))
    console.log(`[aliases] ${path.relative(BUILD, target)}/ -> index.html`)
    count += 1
  }

  return count
}

async function main(): Promise<void> {
  try {
    await fs.access(BUILD)
  }
  catch {
    throw new Error(`no build directory at ${BUILD}, run the build first`)
  }

  const count = await alias(BUILD)
  if (count === 0) {
    console.warn('[aliases] no pages found to alias')
    return
  }

  console.log(`[aliases] ${count} page(s) now answer with and without a trailing slash`)
}

main().catch((error: Error) => {
  console.error(error.message)
  process.exit(1)
})
