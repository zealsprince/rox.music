<script lang="ts">
  import { base } from '$app/paths'
  import { page } from '$app/state'
  import { SITE } from '$data/site'
  import SiGithub from './icons/SiGithub.svelte'
  import Logo from './Logo.svelte'
  import ThemeToggle from './ThemeToggle.svelte'

  const LINKS = [
    { href: '/download', label: 'Download' },
    { href: '/workspaces', label: 'Workspaces' },
  ]

  const current = $derived(page.url.pathname.replace(/\/$/, ''))
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
      <a class="gh plain" href={SITE.repo} rel="noreferrer">
        <SiGithub size={17} title="" aria-hidden="true" />
        <span>GitHub</span>
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

  /* On narrow screens the mark carries the link on its own. */
  @media (max-width: 48rem) {
    .gh span {
      position: absolute;
      width: 1px;
      height: 1px;
      overflow: hidden;
      clip-path: inset(50%);
      white-space: nowrap;
    }
  }
</style>
