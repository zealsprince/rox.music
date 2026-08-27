<script lang="ts">
  import { base } from '$app/paths'
  import Footer from '$components/Footer.svelte'
  import Header from '$components/Header.svelte'
  import { setI18n } from '$lib/i18n/context'
  import '../app.scss'

  const { children, data } = $props()

  // Before anything renders, so Header, Footer and every page below can read
  // the locale out of context instead of taking it as a prop. Reading `data`
  // once at init is the point: with csr = false the page never navigates, and
  // a locale that could change under the tree is a bug, not a feature.
  // svelte-ignore state_referenced_locally
  const { t } = setI18n(data.locale, data.path)
</script>

<svelte:head>
  <script defer src="{base}/js/enhance.js"></script>
</svelte:head>

<a class="skip" href="#main">{t('skip-to-content')}</a>

<Header stars={data.repo.stars} />

<main id="main">
  {@render children()}
</main>

<Footer />

<style>
  /* Takes whatever vertical slack is left over, which is what pins the footer to
     the bottom on short pages. `0 auto` rather than `1 1 auto` so a long page
     never gets its content squeezed to fit. */
  main {
    flex: 1 0 auto;
  }

  .skip {
    position: absolute;
    left: -9999px;
    top: 0;
    z-index: 100;
    background: var(--accent);
    color: var(--text-on-accent);
    padding: var(--space-xs) var(--space-md);
  }

  .skip:focus {
    left: 0;
  }
</style>
