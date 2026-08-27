// The parity gate, the same one rox leans on: every shipped locale carries
// exactly the keys and attributes the source does, in both directions.
//
// A hole falls back to English silently at runtime, which is the right
// behaviour on a live page and the wrong one in a pull request, so this is
// where holes surface. An extra key is the other half: it means a message was
// renamed or retired in the source and left behind in a translation, and
// nothing else in the build would ever mention it again.
//
// It also reports keys no source file references. That one only warns. A key
// built by string concatenation looks unused to a grep, and the answer to that
// is not to fail the build over a false positive.
//
// Run it with `npm run locales`. CI does.

import type { Resource } from '@fluent/syntax'
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { parse } from '@fluent/syntax'
import { LOCALES, SOURCE_LOCALE } from '../src/lib/i18n/registry'

const LOCALES_DIR = path.resolve('src/locales')
const SOURCE_DIRS = ['src/routes', 'src/components', 'src/data', 'src/lib']

/** Every message id, plus `id.attribute` for each attribute it carries. */
function inventory(resource: Resource, locale: string): Set<string> {
  const keys = new Set<string>()

  for (const entry of resource.body) {
    if (entry.type === 'Junk')
      throw new Error(`${locale}: could not parse near "${entry.content.trim().slice(0, 60)}"`)
    if (entry.type !== 'Message')
      continue

    keys.add(entry.id.name)
    for (const attribute of entry.attributes)
      keys.add(`${entry.id.name}.${attribute.id.name}`)
  }

  return keys
}

async function read(locale: string): Promise<Set<string>> {
  const file = path.join(LOCALES_DIR, locale, 'rox.ftl')
  const text = await fs.readFile(file, 'utf-8')
  return inventory(parse(text, {}), locale)
}

/** Every source file that could name a key, concatenated. */
async function sourceText(): Promise<string> {
  const chunks: string[] = []

  async function walk(dir: string): Promise<void> {
    for (const entry of await fs.readdir(dir, { withFileTypes: true })) {
      const full = path.join(dir, entry.name)
      if (entry.isDirectory()) {
        await walk(full)
      }
      else if (/\.(?:svelte|ts)$/.test(entry.name)) {
        chunks.push(await fs.readFile(full, 'utf-8'))
      }
    }
  }

  for (const dir of SOURCE_DIRS)
    await walk(path.resolve(dir))

  return chunks.join('\n')
}

async function main(): Promise<void> {
  const want = await read(SOURCE_LOCALE)
  const problems: string[] = []

  for (const locale of LOCALES) {
    if (locale.id === SOURCE_LOCALE)
      continue

    const got = await read(locale.id)
    const missing = [...want].filter(key => !got.has(key))
    const extra = [...got].filter(key => !want.has(key))

    if (missing.length)
      problems.push(`${locale.id}: missing ${missing.length} (${missing.slice(0, 8).join(', ')}${missing.length > 8 ? ', ...' : ''})`)
    if (extra.length)
      problems.push(`${locale.id}: not in the source: ${extra.join(', ')}`)
  }

  if (problems.length) {
    console.error('[locales] parity failed\n')
    for (const problem of problems)
      console.error(`  ${problem}`)
    console.error('\nEvery locale carries every source key. Add the missing ones, or retire the extras from the source too.')
    process.exit(1)
  }

  // Attributes are reached as `key.attr` from a template literal about as often
  // as they're written out, so a message counts as referenced if its id appears
  // anywhere. Ids are distinctive enough that a substring match is honest.
  const source = await sourceText()
  const ids = new Set([...want].map(key => key.split('.')[0]))
  const unused = [...ids].filter(id => !source.includes(id))

  console.log(`[locales] ${want.size} keys, ${LOCALES.length} locales, parity holds`)
  if (unused.length)
    console.warn(`[locales] ${unused.length} key(s) nothing in src names: ${unused.join(', ')}`)
}

main().catch((error: Error) => {
  console.error(error.message)
  process.exit(1)
})
