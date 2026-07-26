<script lang="ts">
  import { base } from '$app/paths'
  import Footer from '$components/Footer.svelte'
  import Header from '$components/Header.svelte'
  import '../app.scss'

  const { children, data } = $props()
</script>

<svelte:head>
  <script defer src="{base}/js/enhance.js"></script>
</svelte:head>

<a class="skip" href="#main">Skip to content</a>

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
