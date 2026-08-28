<script lang="ts">
  import { SITE } from '$data/site'
  import { i18n } from '$lib/i18n/context'
  import { LOCALES } from '$lib/i18n/registry'
  import { Check, Languages } from '@lucide/svelte'

  const { t, alternate, path, info } = i18n()
</script>

<!--
  A <details> rather than a button and a menu, because the site ships no
  framework JavaScript and this has to work with none. The browser handles the
  open state; the only thing it costs is that clicking elsewhere on the page
  doesn't close it, which is the honest price of a menu with no script behind
  it.

  Every entry is a real link to the same page in that language, which is also
  what the prerender crawler follows to find the translated routes at all: no
  picker, no /de.
-->
<details class="lang">
  <summary title={t('language-picker')}>
    <Languages size={16} strokeWidth={2} aria-hidden="true" />
    <span class="visually-hidden">{t('language-picker')}</span>
    <span class="current" aria-hidden="true">{info.native}</span>
  </summary>

  <ul>
    {#each LOCALES as locale (locale.id)}
      <li>
        <a
          class="plain"
          href={alternate(locale.id, path)}
          hreflang={locale.htmlLang}
          lang={locale.htmlLang}
          aria-current={locale.id === info.id ? 'true' : undefined}
        >
          <span class="flag" aria-hidden="true">{locale.flag}</span>
          {locale.native}
          {#if locale.id === info.id}
            <Check class="tick" size={14} strokeWidth={2.4} aria-hidden="true" />
          {/if}
        </a>
      </li>
    {/each}

    <!--
      The one entry that isn't a language. Someone who opened this menu and
      didn't find theirs has already told us what they want; sending them to a
      dead end when the place to fix it exists would be a waste of the only
      moment they'll ever care.
    -->
    <li class="missing">
      <a class="plain" href={SITE.translate} rel="noreferrer">
        {t('language-missing')}
      </a>
    </li>
  </ul>
</details>

<style>
  .lang {
    position: relative;
  }

  summary {
    display: inline-flex;
    align-items: center;
    gap: 0.35rem;
    padding: 0.2rem 0.35rem;
    border: var(--hairline) solid transparent;
    border-radius: var(--radius);
    color: var(--text-secondary);
    cursor: pointer;
    list-style: none;
  }

  /* Safari draws its own triangle through a pseudo-element the standard rule
     above doesn't reach. */
  summary::-webkit-details-marker {
    display: none;
  }

  summary:hover,
  .lang[open] summary {
    color: var(--text-bright);
    border-color: var(--border);
    background: var(--bg-control);
  }

  ul {
    position: absolute;
    right: 0;
    top: calc(100% + 0.4rem);
    z-index: 20;
    min-width: 10rem;
    margin: 0;
    padding: 0.25rem;
    list-style: none;
    background: var(--bg-panel);
    border: var(--hairline) solid var(--border);
    border-radius: var(--radius);
    box-shadow: 0 8px 24px rgb(0 0 0 / 25%);
  }

  ul a {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.35rem 0.5rem;
    border-radius: var(--radius);
    color: var(--text-secondary);
    white-space: nowrap;
  }

  ul a:hover {
    background: var(--bg-control);
    color: var(--text-bright);
  }

  ul a[aria-current] {
    color: var(--text-bright);
  }

  .flag {
    /* The emoji sits on a different metric to the text beside it and drifts a
       hair high in most system fonts. */
    font-size: 1rem;
    line-height: 1;
  }

  ul a :global(.tick) {
    margin-left: auto;
    color: var(--accent-text);
  }

  /* Ruled off from the languages above because it doesn't do what they do:
     every other row swaps the page, this one leaves the site. */
  .missing {
    margin-top: 0.25rem;
    padding-top: 0.25rem;
    border-top: var(--hairline) solid var(--border);
  }

  .missing a {
    color: var(--text-muted);
    font-size: var(--step--1);
  }

  /* Same call the GitHub label makes: past this width the mark carries it. */
  @media (max-width: 48rem) {
    .current {
      display: none;
    }
  }
</style>
