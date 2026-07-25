<script lang="ts">
  import { base } from '$app/paths'
  import { page } from '$app/state'
</script>

<svelte:head>
  <title>{page.status} - rox</title>
  <meta name="robots" content="noindex" />
</svelte:head>

<section class="shell">
  <p class="code">{page.status}</p>
  <h1>{page.status === 404 ? 'Nothing here' : 'Something went wrong'}</h1>
  <p class="body">
    {page.status === 404
      ? 'That page does not exist. The download is where it always was.'
      : (page.error?.message ?? 'An unexpected error occurred.')}
  </p>
  <p><a href="{base}/download">Download rox</a> or <a href="{base}/">start over</a>.</p>
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
    margin-bottom: var(--space-md);
  }
</style>
