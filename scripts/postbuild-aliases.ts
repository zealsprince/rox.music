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

import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'

const BUILD = path.resolve('build')

// index.html is already the root document, and 404.html is what Pages serves
// for unmatched paths. Neither has a trailing-slash form worth creating.
const SKIP = new Set(['index.html', '404.html'])

async function main(): Promise<void> {
  let entries: string[]
  try {
    entries = await fs.readdir(BUILD)
  }
  catch {
    throw new Error(`no build directory at ${BUILD}, run the build first`)
  }

  const pages = entries.filter(f => f.endsWith('.html') && !SKIP.has(f))
  if (pages.length === 0) {
    console.warn('[aliases] no pages found to alias')
    return
  }

  for (const page of pages) {
    const name = page.slice(0, -'.html'.length)
    const dir = path.join(BUILD, name)
    await fs.mkdir(dir, { recursive: true })
    await fs.copyFile(path.join(BUILD, page), path.join(dir, 'index.html'))
    console.log(`[aliases] /${name}/ -> ${name}/index.html`)
  }

  console.log(`[aliases] ${pages.length} page(s) now answer with and without a trailing slash`)
}

main().catch((error: Error) => {
  console.error(error.message)
  process.exit(1)
})
