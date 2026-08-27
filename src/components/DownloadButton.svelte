<script lang="ts">
  import type { Release } from '$types/release'
  import Rich from '$components/Rich.svelte'
  import { PLATFORM_BY_ID } from '$data/platforms'
  import { SITE } from '$data/site'
  import { i18n } from '$lib/i18n/context'
  import { Download } from '@lucide/svelte'

  interface Props {
    release: Release
  }

  const { release }: Props = $props()

  const { t } = i18n()

  // Server-rendered this points at the releases page, which works for everyone
  // including bots and people with JS off. enhance.js rewrites it to the direct
  // asset once it knows the OS.
  const fallbackHref = SITE.releases

  // enhance.js swaps the label once it knows the OS, and it has no locale of
  // its own, so it gets the whole sentence with a hole where the platform name
  // goes rather than two halves to glue together. "Download for Linux" and
  // "Linux herunterladen" put the name in different places, and concatenation
  // only ever knows one of them.
  const detectedTemplate = t('download-cta-detected', { platform: '%s' })
</script>

<div class="wrap">
  <a
    class="primary plain"
    href={fallbackHref}
    data-download-primary
    data-download-template={detectedTemplate}
  >
    <Download size={20} strokeWidth={2.2} aria-hidden="true" />
    <span data-download-label>{t('download-cta')}</span>
  </a>

  <!--
    The per-platform hrefs enhance.js reads to rewrite the button above. Present
    in the HTML so resolving one needs no fetch, hidden because the button is
    the interface. Anchors rather than <link rel="prefetch">, which would have
    the browser speculatively pull a 20 MB binary.
  -->
  {#each release.assets as asset (asset.platform)}
    <a
      hidden
      href={asset.url}
      data-download-asset={asset.platform}
      data-platform-label={PLATFORM_BY_ID[asset.platform].label}
    >
      {PLATFORM_BY_ID[asset.platform].label}
    </a>
  {/each}

  <!--
    The tarball above works everywhere, but on Arch or NixOS it is the wrong
    answer: those two have a packaged rox that updates with the rest of the
    system. Only shown once enhance.js has marked the visitor as Linux, so
    nobody else reads a distro aside.
  -->
  <p class="packaged"><Rich key="download-packaged" /></p>

  <p class="meta"><Rich key="download-meta" args={{ version: release.version }} /></p>
</div>

<style>
  .wrap {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: var(--space-sm);
  }

  .primary {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: var(--accent);
    color: var(--text-on-accent);
    font-weight: 600;
    font-size: var(--step-1);
    padding: 0.7em 1.4em;
    border: var(--hairline) solid var(--accent);
    border-radius: var(--radius);
    transition: background 0.15s ease;
  }

  .primary:hover {
    background: var(--accent-hover);
    border-color: var(--accent-hover);
    color: var(--text-on-accent);
  }

  .meta {
    color: var(--text-muted);
    font-size: var(--step--1);
  }

  .packaged {
    display: none;
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  :global(html[data-platform='linux']) .packaged {
    display: block;
  }
</style>
