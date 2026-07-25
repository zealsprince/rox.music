<script lang="ts">
  import { base } from '$app/paths'
  import Footer from '$components/Footer.svelte'
  import Header from '$components/Header.svelte'
  import '../app.scss'

  const { children } = $props()
</script>

<svelte:head>
  <script defer src="{base}/js/enhance.js"></script>
</svelte:head>

<a class="skip" href="#main">Skip to content</a>

<Header />

<main id="main">
  {@render children()}
</main>

<Footer />

<style>
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
