<!--
  A real prerendered route, not the adapter's `fallback`. The fallback writes an
  empty app shell, and with csr = false there is no client to fill it in, so
  every 404 on the live site was a blank untitled page. This route prerenders to
  build/404.html, which is exactly the file GitHub Pages serves for an unmatched
  path.
-->
<script lang="ts">
  import { SITE } from '$data/site'
  import { i18n } from '$lib/i18n/context'

  const { t, href } = i18n()
</script>

<!--
  English only, and it stays that way. GitHub Pages serves one 404.html for
  every unmatched path on the domain, /de/nonsense included, so a translated
  copy would be a file nothing can ever route to. The links below are what
  actually helps: they go to the real pages, where the picker is.
-->
<svelte:head>
  <title>{t('notfound-title')} - {SITE.name}</title>
  <meta name="description" content={t('notfound-title.description')} />
  <!-- This route is reachable at /404 as well as through the Pages handler, so
       it has to stay out of the index. `follow` still lets the links below pass
       crawlers back into the real pages. -->
  <meta name="robots" content="noindex, follow" />
</svelte:head>

<section class="shell">
  <p class="code">404</p>
  <h1>{t('notfound-h1')}</h1>
  <nav class="links" aria-label={t('notfound-nav')}>
    <a href={href('/download')}>{t('download-cta')}</a>
    <a href={href('/workspaces')}>{t('nav-workspaces')}</a>
    <a href={href('/')}>{t('nav-home')}</a>
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
    margin-block: var(--space-xs) var(--space-lg);
  }

  .links {
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-md);
  }
</style>
