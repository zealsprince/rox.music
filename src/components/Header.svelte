<script lang="ts">
  import { base } from '$app/paths'
  import { page } from '$app/state'
  import { SITE } from '$data/site'
  import SiGithub from './icons/SiGithub.svelte'
  import Logo from './Logo.svelte'
  import ThemeToggle from './ThemeToggle.svelte'

  interface Props {
    /** Stargazers on the rox repo, resolved at prerender. */
    stars: number
  }

  const { stars }: Props = $props()

  const LINKS = [
    { href: '/download', label: 'Download' },
    { href: '/workspaces', label: 'Workspaces' },
  ]

  // Set this above 0 to hide the badge until the number is worth showing. A
  // star count is social proof, and a low one argues against the product more
  // convincingly than no badge at all.
  const MIN_STARS = 0

  const current = $derived(page.url.pathname.replace(/\/$/, ''))

  // 1200 -> 1.2k. Exact below a thousand, because "1.0k" hides real movement
  // at the point where every star still counts.
  const starLabel = $derived(
    stars >= 1000 ? `${(stars / 1000).toFixed(1).replace(/\.0$/, '')}k` : String(stars),
  )
</script>

<header>
  <div class="shell bar">
    <a class="brand" href="{base}/" aria-label="rox home">
      <Logo />
      <span>rox</span>
    </a>

    <nav aria-label="Main">
      {#each LINKS as link (link.href)}
        <a
          href="{base}{link.href}"
          aria-current={current === `${base}${link.href}` ? 'page' : undefined}
        >
          {link.label}
        </a>
      {/each}
      <a
        class="gh plain"
        href={SITE.repo}
        rel="noreferrer"
        aria-label="rox on GitHub{stars >= MIN_STARS ? `, ${stars} stars` : ''}"
      >
        <SiGithub size={17} title="" aria-hidden="true" />
        <span class="gh-label">GitHub</span>
        {#if stars >= MIN_STARS}
          <span class="stars" aria-hidden="true">
            <svg viewBox="0 0 24 24" aria-hidden="true">
              <path
                d="M12 2.6l2.9 5.9 6.5.9-4.7 4.6 1.1 6.5-5.8-3-5.8 3 1.1-6.5L2.6 9.4l6.5-.9z"
              />
            </svg>
            {starLabel}
          </span>
        {/if}
      </a>
      <ThemeToggle />
    </nav>
  </div>
</header>

<style>
  header {
    position: sticky;
    top: 0;
    z-index: 10;
    background: color-mix(in srgb, var(--bg-root) 88%, transparent);
    backdrop-filter: blur(12px);
    border-bottom: var(--hairline) solid var(--border);
  }

  .bar {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: var(--space-md);
    min-height: 3.25rem;
  }

  .brand {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    color: var(--text-bright);
    font-weight: 650;
    letter-spacing: -0.03em;
    font-size: var(--step-1);
  }

  .brand:hover {
    color: var(--accent-text);
  }

  nav {
    display: flex;
    align-items: center;
    gap: var(--space-md);
    font-size: var(--step--1);
  }

  nav a {
    color: var(--text-secondary);
  }

  nav a:hover,
  nav a[aria-current='page'] {
    color: var(--text-bright);
  }

  nav a[aria-current='page'] {
    box-shadow: inset 0 -1px 0 var(--accent);
  }

  .gh {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
  }

  .stars {
    display: inline-flex;
    align-items: center;
    gap: 0.2rem;
    padding-left: 0.4rem;
    margin-left: 0.1rem;
    border-left: var(--hairline) solid var(--border);
    color: var(--text-muted);
    font-variant-numeric: tabular-nums;
  }

  .stars svg {
    width: 0.8rem;
    height: 0.8rem;
    fill: currentcolor;
  }

  .gh:hover .stars {
    color: var(--text-bright);
  }

  /* On narrow screens the mark and the count carry the link, the word goes. */
  @media (max-width: 48rem) {
    .gh .gh-label {
      position: absolute;
      width: 1px;
      height: 1px;
      overflow: hidden;
      clip-path: inset(50%);
      white-space: nowrap;
    }
  }
</style>
