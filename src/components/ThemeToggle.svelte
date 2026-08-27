<script lang="ts">
  import { i18n } from '$lib/i18n/context'

  const { t } = i18n()
</script>

<!--
  Static markup only. Pages are prerendered with csr = false, so no Svelte
  runtime reaches the browser and this component cannot hold state. Both icons
  ship and CSS picks one off the class the inline script in app.html already put
  on <html>. The click handler is wired by static/js/enhance.js.

  Without JS the button still renders and does nothing, which is why it is
  hidden until enhance.js marks the document. The theme itself is still correct
  in that case: the inline script falls through to prefers-color-scheme.
-->
<button type="button" class="theme-toggle" title={t('theme-toggle')}>
  <span class="visually-hidden">{t('theme-toggle.label')}</span>
  <svg class="icon-sun" viewBox="0 0 24 24" aria-hidden="true">
    <circle cx="12" cy="12" r="4.2" />
    <path
      d="M12 2.5v2.4M12 19.1v2.4M2.5 12h2.4M19.1 12h2.4M5.2 5.2l1.7 1.7M17.1 17.1l1.7 1.7M18.8 5.2l-1.7 1.7M6.9 17.1l-1.7 1.7"
    />
  </svg>
  <svg class="icon-moon" viewBox="0 0 24 24" aria-hidden="true">
    <path d="M20 13.5A8.2 8.2 0 0 1 10.5 4a8.2 8.2 0 1 0 9.5 9.5Z" />
  </svg>
</button>

<style>
  .theme-toggle {
    display: none;
    place-items: center;
    width: 1.9rem;
    height: 1.9rem;
    padding: 0;
    background: none;
    border: var(--hairline) solid transparent;
    border-radius: var(--radius);
    color: var(--text-secondary);
    cursor: pointer;
  }

  /* enhance.js sets this once it has attached the listener. */
  :global(html.js) .theme-toggle {
    display: grid;
  }

  .theme-toggle:hover {
    color: var(--text-bright);
    border-color: var(--border);
    background: var(--bg-control);
  }

  svg {
    width: 1rem;
    height: 1rem;
    fill: none;
    stroke: currentColor;
    stroke-width: 1.6;
    stroke-linecap: round;
  }

  /* Dark shows the sun, because the sun is what you get if you press it. */
  .icon-sun,
  .icon-moon {
    display: none;
  }

  :global(html.dark) .icon-sun,
  :global(html.light) .icon-moon {
    display: block;
  }
</style>
