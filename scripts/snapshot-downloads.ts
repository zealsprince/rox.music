// The only thing that writes src/data/downloads.history.json.
//
// GitHub hands out `download_count` as a running total and keeps no history
// behind it, so the only way the site ever gets a downloads-over-time chart is
// if something writes the number down. That's this, run from a scheduled
// workflow that commits the result: git is the database, one row a day, five
// integers a row.
//
// Idempotent. Run it twice on the same day and the second run overwrites that
// day's row rather than adding a second one, so a manual run or a re-run after
// a failed commit can't put a phantom zero-delta step in the chart.
//
//   npm run snapshot
//
// It also refreshes downloads.fallback.json, which is what the build falls back
// to when the API is down or rate-limited. Same commit, same cadence.

import type { History } from '../src/lib/downloads'
import fs from 'node:fs/promises'
import path from 'node:path'
import process from 'node:process'
import { countReleases, fetchReleases, snapshot } from '../src/lib/downloads'

const HISTORY = path.resolve('src/data/downloads.history.json')
const FALLBACK = path.resolve('src/data/downloads.fallback.json')

async function readHistory(): Promise<History> {
  try {
    return JSON.parse(await fs.readFile(HISTORY, 'utf-8')) as History
  }
  catch {
    return { samples: [] }
  }
}

async function main(): Promise<void> {
  const counted = countReleases(await fetchReleases(process.env.GITHUB_TOKEN))
  if (counted.length === 0)
    throw new Error('the API returned no releases, refusing to record a zero')

  // UTC, to match the cron the workflow runs on. A local date would shift the
  // row across a day boundary depending on where the runner is.
  const today = new Date().toISOString().slice(0, 10)
  const sample = snapshot(counted, today)

  const history = await readHistory()
  const existing = history.samples.findIndex(s => s.date === today)
  if (existing === -1)
    history.samples.push(sample)
  else
    history.samples[existing] = sample

  history.samples.sort((a, b) => a.date.localeCompare(b.date))

  await fs.writeFile(HISTORY, `${JSON.stringify(history, null, 2)}\n`)
  await fs.writeFile(FALLBACK, `${JSON.stringify(counted, null, 2)}\n`)

  const previous = history.samples.at(-2)
  const change = previous ? sample.total - previous.total : null
  console.log(
    `[snapshot] ${today}: ${sample.total} downloads across ${counted.length} releases`
    + `${change === null ? ' (first sample)' : ` (${change >= 0 ? '+' : ''}${change})`}`,
  )
}

main().catch((error: Error) => {
  console.error(`[snapshot] ${error.message}`)
  process.exit(1)
})
