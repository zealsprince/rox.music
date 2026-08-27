export interface Benchmark {
  /** Project name. Never a key. */
  player: string
  /** Home page or canonical repo. Null for rox, which is already this site. */
  url: string | null
  /** Seconds to a visible window, or null where the run never produced one. */
  windowUpSecs: number | null
  /** Seconds to a settled CPU, or null where it never settled. */
  loadedSecs: number | null
  /** PSS across the full process tree, in MB, for both the bar and the label. */
  memoryMb: number
  /** Idle CPU as a fraction, so Intl can render it as a percent per locale. */
  idleCpu: number
  self: boolean
}

// Andrew's numbers, same machine and same 50k-track library through one
// harness. Kept in sync with the benchmark table in rox's README; the method
// note below the table on the site is not optional, these are first-party
// figures and have to read as such.
//
// Raw numbers rather than pre-rendered labels, because "2.3 s" is "2,3 s" in
// three of the four languages this table now renders in. The formatters below
// take the locale and put the separator where that language puts it.
export const BENCHMARKS: Benchmark[] = [
  { player: 'rox', url: null, windowUpSecs: 0.3, loadedSecs: 2.3, memoryMb: 134, idleCpu: 0.005, self: true },
  { player: 'Elisa', url: 'https://invent.kde.org/multimedia/elisa', windowUpSecs: 0.7, loadedSecs: null, memoryMb: 206, idleCpu: 0.74, self: false },
  { player: 'fooyin', url: 'https://github.com/fooyin/fooyin', windowUpSecs: 0.3, loadedSecs: 18, memoryMb: 364, idleCpu: 0, self: false },
  { player: 'Quod Libet', url: 'https://github.com/quodlibet/quodlibet', windowUpSecs: null, loadedSecs: 19, memoryMb: 384, idleCpu: 0.002, self: false },
  { player: 'Strawberry', url: 'https://www.strawberrymusicplayer.org/', windowUpSecs: 0.3, loadedSecs: 32, memoryMb: 434, idleCpu: 0.008, self: false },
  { player: 'Museeks', url: 'https://github.com/martpie/museeks', windowUpSecs: null, loadedSecs: 3, memoryMb: 436, idleCpu: 0, self: false },
  { player: 'Tauon', url: 'https://tauonmusicbox.rocks/', windowUpSecs: 8.7, loadedSecs: 12, memoryMb: 2800, idleCpu: 0, self: false },
]

/**
 * DeaDBeeF has no row because it never produced one: its MP3 parser segfaults
 * partway through importing this library, every attempt. Worth saying out loud
 * rather than quietly omitting, since it would otherwise have won on memory.
 */
export const BENCHMARK_FOOTNOTE_URL = 'https://github.com/DeaDBeeF-Player/deadbeef'

// Bars are scaled linearly against the worst result, not log. The whole point is
// that 134 MB against 2.8 GB is a 21x gap, and a log axis would flatter everyone
// else by hiding it.
const MAX_MEMORY = Math.max(...BENCHMARKS.map(b => b.memoryMb))
const MAX_LOADED = Math.max(...BENCHMARKS.map(b => b.loadedSecs ?? 0))

/** Bar width as a percentage, floored so the smallest bar is still visible. */
export function memoryPct(row: Benchmark): number {
  return Math.max(1.5, (row.memoryMb / MAX_MEMORY) * 100)
}

/**
 * Null means the run never settled. That gets a full-width bar rather than none:
 * "never finished" is the worst outcome in the column, not a missing one.
 */
export function loadedPct(row: Benchmark): number {
  if (row.loadedSecs === null)
    return 100
  return Math.max(1.5, (row.loadedSecs / MAX_LOADED) * 100)
}

/**
 * The units stay as written. "MB", "GB", "s" and "%" are the same symbols in
 * every language this site speaks, and running them through Intl's unit styles
 * would turn "18 s" into "18 Sek." for no reader's benefit. It's the decimal
 * mark and the grouping that move, and those are the number's job.
 */
function decimal(locale: string, value: number): string {
  return new Intl.NumberFormat(locale, { maximumFractionDigits: 1 }).format(value)
}

export function secondsLabel(locale: string, secs: number): string {
  return `${decimal(locale, secs)} s`
}

export function memoryLabel(locale: string, row: Benchmark): string {
  return row.memoryMb >= 1000
    ? `${decimal(locale, row.memoryMb / 1000)} GB`
    : `${decimal(locale, row.memoryMb)} MB`
}

export function cpuLabel(locale: string, row: Benchmark): string {
  return new Intl.NumberFormat(locale, {
    style: 'percent',
    maximumFractionDigits: 1,
  }).format(row.idleCpu)
}
