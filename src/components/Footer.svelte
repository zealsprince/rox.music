<script lang="ts">
  import { base } from '$app/paths'
  import { SITE } from '$data/site'
  import { Bug } from '@lucide/svelte'
  import SiGithub from './icons/SiGithub.svelte'
</script>

<footer>
  <div class="shell inner">
    <p class="tag">
      rox is built by <a href="https://zealsprince.com" rel="me">Andrew Lake</a>. Free and
      open source under the GPL.
    </p>

    <nav aria-label="Footer">
      <a href="{base}/download">Download</a>
      <a href="{base}/workspaces">Workspaces</a>
      <a class="plain" href={SITE.repo} rel="noreferrer">
        <SiGithub size={15} title="" aria-hidden="true" />
        Source
      </a>
      <a class="plain" href={SITE.issues} rel="noreferrer">
        <Bug size={15} strokeWidth={2} aria-hidden="true" />
        Report a bug
      </a>
    </nav>
  </div>
</footer>

<style>
  footer {
    margin-top: var(--space-2xl);
    border-top: var(--hairline) solid var(--border);
    padding-block: var(--space-lg);
    font-size: var(--step--1);
    color: var(--text-muted);
  }

  .inner {
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-md);
    justify-content: space-between;
    align-items: center;
  }

  .tag {
    margin: 0;
  }

  nav {
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-md);
  }

  nav a {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    color: var(--text-secondary);
  }

  nav a:hover {
    color: var(--text-bright);
  }
</style>
