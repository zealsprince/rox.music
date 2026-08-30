import type { Sample } from '$lib/downloads'
import { CHANNELS } from '$data/channels'

/**
 * Synthetic snapshot history, so the weekly strip can be looked at before there
 * is a year of real snapshots to look at.
 *
 * The weekly view is the one thing on this site that can't be checked by
 * building it: it needs months of daily samples that only exist once the
 * workflow has been running for months. Shipping a layout nobody has seen and
 * finding out in November is the failure this avoids.
 *
 * Callers gate this on `dev`, so it cannot reach a build. Same footgun as the
 * pseudo-locale and handled harder: that one warns, this one is unreachable
 * outside `npm run dev`.
 *
 *   ROX_MOCK_HISTORY=1 npm run dev     # 30 weeks, so the weekly view leads
 *   ROX_MOCK_HISTORY=10 npm run dev    # 10 weeks, offered but not leading
 *
 * The number is weeks when it's four or more, and just an on switch otherwise,
 * which is what makes both sides of the half-year default reachable without
 * editing anything.
 *
 * Deterministic, so two runs draw the same strip and a layout change is the only
 * thing that moved between them.
 */

/** Past the half-year default, so the mock shows the eventual steady state. */
const DEFAULT_WEEKS = 30

/** Roughly the real mix: Windows leads, the Linux .deb is a trickle. */
const DAILY_RATE: Record<string, number> = {
  'linux-archive': 2.2,
  'linux-alt': 0.4,
  'macos-archive': 1.3,
  'windows-archive': 6.5,
  'windows-alt': 1.1,
}

/** Reads the week count out of the switch's value. See the note above. */
export function mockWeeks(value: string): number {
  const requested = Number(value)
  return Number.isFinite(requested) && requested >= 4 ? Math.floor(requested) : DEFAULT_WEEKS
}

export function mockHistory(today: string, weeks: number): Sample[] {
  // A plain LCG rather than Math.random, so the mock is the same every run and
  // a diff in the screenshot is a diff in the code.
  let seed = 20260830
  const random = (): number => {
    seed = (seed * 1103515245 + 12345) % 2147483648
    return seed / 2147483648
  }

  const days = weeks * 7
  const start = new Date(`${today}T00:00:00Z`)
  start.setUTCDate(start.getUTCDate() - days)

  const running: Record<string, number> = {}
  for (const channel of CHANNELS)
    running[channel.id] = 0

  const samples: Sample[] = []

  for (let day = 0; day <= days; day++) {
    const at = new Date(start)
    at.setUTCDate(at.getUTCDate() + day)

    // A release lands every eight to twelve days and drags a few days of
    // elevated traffic behind it, which is the shape the real strip has.
    const sinceRelease = day % 10
    const spike = sinceRelease === 0 ? 4.5 : sinceRelease < 3 ? 2 : 1
    // Slow growth over the window, so the strip has a direction and not just
    // noise. Nothing here is a prediction, it's a layout fixture.
    const growth = 1 + (day / days) * 0.8

    for (const channel of CHANNELS) {
      const rate = (DAILY_RATE[channel.id] ?? 1) * spike * growth
      running[channel.id] += Math.round(rate * (0.5 + random()))
    }

    samples.push({
      date: at.toISOString().slice(0, 10),
      total: Object.values(running).reduce((sum, n) => sum + n, 0),
      channels: { ...running },
    })
  }

  return samples
}
