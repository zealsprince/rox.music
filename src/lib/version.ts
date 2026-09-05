/**
 * Version ordering for release tags, which is semver's rule with prereleases:
 * `1.25.0-rc.1` sits above every `1.24.x` and below `1.25.0` itself, and
 * `rc.10` above `rc.9`. rox's release workflow tags a candidate exactly that
 * way, so this is what lets the download page tell the newest stable build
 * from the candidate previewing the next one.
 *
 * Alias-free like `downloads.ts`, so the snapshot script can reach it under
 * tsx if it ever needs to.
 */

export interface ParsedVersion {
  core: [number, number, number]
  /** The dot-separated identifiers after the hyphen; empty for a release. */
  pre: string[]
}

/** `1.25.0-rc.1` or `v1.25.0-rc.1` to its parts, or null for anything else. */
export function parseVersion(tag: string): ParsedVersion | null {
  const match = /^v?(\d+)\.(\d+)\.(\d+)(?:-([0-9A-Za-z.-]+))?(?:\+[0-9A-Za-z.-]+)?$/.exec(tag)
  if (!match)
    return null
  return {
    core: [Number(match[1]), Number(match[2]), Number(match[3])],
    pre: match[4] ? match[4].split('.') : [],
  }
}

export function isPrerelease(tag: string): boolean {
  return (parseVersion(tag)?.pre.length ?? 0) > 0
}

/** One prerelease identifier against another: numbers by value and below words, words by ASCII. */
function compareIdentifier(a: string, b: string): number {
  const na = /^\d+$/.test(a)
  const nb = /^\d+$/.test(b)
  if (na && nb)
    return Number(a) - Number(b)
  if (na !== nb)
    return na ? -1 : 1
  return a < b ? -1 : a > b ? 1 : 0
}

/**
 * Negative when `a` is the older version, positive when it's the newer, zero
 * when they're the same. Unparseable tags sort below everything, so a stray
 * "nightly" never becomes the release the page hands out.
 */
export function compareVersions(a: string, b: string): number {
  const pa = parseVersion(a)
  const pb = parseVersion(b)
  if (!pa || !pb)
    return (pa ? 1 : 0) - (pb ? 1 : 0)

  for (let i = 0; i < 3; i++) {
    if (pa.core[i] !== pb.core[i])
      return pa.core[i] - pb.core[i]
  }

  // A release outranks its own candidates; between candidates, identifier by
  // identifier, and the one that runs out first is the older.
  if (pa.pre.length === 0 || pb.pre.length === 0)
    return pb.pre.length - pa.pre.length

  const shared = Math.min(pa.pre.length, pb.pre.length)
  for (let i = 0; i < shared; i++) {
    const order = compareIdentifier(pa.pre[i], pb.pre[i])
    if (order !== 0)
      return order
  }
  return pa.pre.length - pb.pre.length
}
