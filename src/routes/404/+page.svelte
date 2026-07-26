<!--
  A real prerendered route, not the adapter's `fallback`. The fallback writes an
  empty app shell, and with csr = false there is no client to fill it in, so
  every 404 on the live site was a blank untitled page. This route prerenders to
  build/404.html, which is exactly the file GitHub Pages serves for an unmatched
  path.
-->
<script lang="ts">
  import { base } from '$app/paths'
  import { SITE } from '$data/site'
</script>

<svelte:head>
  <title>Page not found - {SITE.name}</title>
  <meta name="description" content="That page does not exist on rox.music." />
  <!-- This route is reachable at /404 as well as through the Pages handler, so
       it has to stay out of the index. `follow` still lets the links below pass
       crawlers back into the real pages. -->
  <meta name="robots" content="noindex, follow" />
</svelte:head>

<section class="shell">
  <p class="code">404</p>
  <h1>Nothing here</h1>
  <p class="body">
    That page does not exist. The download is where it always was.
  </p>
  <nav class="links" aria-label="Recovery">
    <a href="{base}/download">Download rox</a>
    <a href="{base}/workspaces">Workspaces</a>
    <a href="{base}/">Home</a>
  </nav>
</section>

<style>
  section {
    padding-block: var(--space-2xl);
    max-width: var(--measure);
  }

  .code {
    font-family: var(--font-mono);
    font-size: var(--step-1);
    color: var(--accent-text);
  }

  h1 {
    font-size: var(--step-3);
    margin-block: var(--space-xs) var(--space-md);
  }

  .body {
    color: var(--text-secondary);
    margin-bottom: var(--space-lg);
  }

  .links {
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-md);
  }
</style>
