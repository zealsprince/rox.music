// Bundles src/enhance.ts, the site's only client script, into
// static/js/enhance.js. The pages are prerendered with csr = false so the site
// ships this one small script instead of the SvelteKit runtime and hydration
// payload. The trade-off is that Vite emits no client entry for the pages, so
// there is nothing for this to ride along with and it gets built separately.
//
// Runs as prebuild, and with --watch alongside vite during dev.

import path from 'node:path'
import process from 'node:process'
import * as esbuild from 'esbuild'

const ENTRY = path.resolve('src/enhance.ts')
const OUT = path.resolve('static/js/enhance.js')

const options: esbuild.BuildOptions = {
  entryPoints: [ENTRY],
  outfile: OUT,
  bundle: true,
  minify: true,
  format: 'iife',
  // Matches what the CSS already assumes: evergreen browsers, no legacy shims.
  target: ['es2020'],
  legalComments: 'none',
  logLevel: 'info',
}

async function main(): Promise<void> {
  if (process.argv.includes('--watch')) {
    const context = await esbuild.context(options)
    await context.watch()
    console.log('[enhance] watching src/enhance.ts')
    return
  }

  const result = await esbuild.build({ ...options, metafile: true })
  const output = result.metafile?.outputs[path.relative(process.cwd(), OUT)]
  if (output)
    console.log(`[enhance] ${output.bytes} B minified`)
}

main().catch((error: Error) => {
  console.error(error.message)
  process.exit(1)
})
