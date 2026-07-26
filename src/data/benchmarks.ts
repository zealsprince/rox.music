export interface Benchmark {
  player: string
  /** Home page or canonical repo. Null for rox, which is already this site. */
  url: string | null
  /** Time to a visible window, or null where the run never produced one. */
  windowUp: string | null
  /** Seconds to a settled CPU, or null where it never settled. */
  loadedSecs: number | null
  /** What to print when there is no number: "never settles". */
  loadedLabel: string
  /** PSS across the full process tree, in MB, for both the bar and the label. */
  memoryMb: number
  idleCpu: string
  self: boolean
}

// Andrew's numbers, same machine and same 50k-track library through one
// harness. Kept in sync with the benchmark table in rox's README; the method
// note below the table on the site is not optional, these are first-party
// figures and have to read as such.
export const BENCHMARK_METHOD
  = 'I measured all of these myself, on one machine (Ryzen 9 5950X, Linux/Wayland) '
    + 'with the same 50k-track library on an external SSD, every player through the same '
    + 'harness with its library loaded. Memory is PSS across the full process tree. '
    + '"Loaded" is when CPU settles after launch; idle is a paused player with the window '
    + 'visible.'

// Every player links out to its own project. A comparison that names competitors
// should make them easy to go check, not just easy to lose to.
export const BENCHMARKS: Benchmark[] = [
  { player: 'rox', url: null, windowUp: '0.3 s', loadedSecs: 2.3, loadedLabel: '2.3 s', memoryMb: 134, idleCpu: '0.5%', self: true },
  { player: 'Elisa', url: 'https://invent.kde.org/multimedia/elisa', windowUp: '0.7 s', loadedSecs: null, loadedLabel: 'never settles', memoryMb: 206, idleCpu: '74%', self: false },
  { player: 'fooyin', url: 'https://github.com/fooyin/fooyin', windowUp: '0.3 s', loadedSecs: 18, loadedLabel: '18 s', memoryMb: 364, idleCpu: '0%', self: false },
  { player: 'Quod Libet', url: 'https://github.com/quodlibet/quodlibet', windowUp: null, loadedSecs: 19, loadedLabel: '19 s', memoryMb: 384, idleCpu: '0.2%', self: false },
  { player: 'Strawberry', url: 'https://www.strawberrymusicplayer.org/', windowUp: '0.3 s', loadedSecs: 32, loadedLabel: '32 s', memoryMb: 434, idleCpu: '0.8%', self: false },
  { player: 'Museeks', url: 'https://github.com/martpie/museeks', windowUp: null, loadedSecs: 3, loadedLabel: '3 s', memoryMb: 436, idleCpu: '0%', self: false },
  { player: 'Tauon', url: 'https://tauonmusicbox.rocks/', windowUp: '8.7 s', loadedSecs: 12, loadedLabel: '12 s', memoryMb: 2800, idleCpu: '0%', self: false },
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
const MAX_LOADED = Math.max(
  ...BENCHMARKS.map(b => b.loadedSecs ?? 0),
)

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

export function memoryLabel(row: Benchmark): string {
  return row.memoryMb >= 1000
    ? `${(row.memoryMb / 1000).toFixed(1)} GB`
    : `${row.memoryMb} MB`
}
