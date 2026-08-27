<script lang="ts">
  import { HUB } from '$data/pages'
  import { SITE } from '$data/site'
  import { i18n } from '$lib/i18n/context'
  import { Bug, Hash } from '@lucide/svelte'
  import SiGithub from './icons/SiGithub.svelte'
  import Rich from './Rich.svelte'

  const { t, href } = i18n()
</script>

<footer>
  <div class="shell inner">
    <p class="tag"><Rich key="footer-credit" /></p>

    <nav aria-label={t('footer-nav')}>
      <a href={href('/download')}>{t('nav-download')}</a>
      <a href={href('/workspaces')}>{t('nav-workspaces')}</a>
      <!--
        The only link into the pages that sit off the nav. It has to exist:
        a page reachable from nothing but sitemap.xml is an orphan, and orphans
        get crawled rarely and indexed less. Footer rather than header keeps
        them out of the way of people who came here to download something.
      -->
      <a href={href(HUB.path)}>{t(HUB.key)}</a>
      <a class="plain" href={SITE.repo} rel="noreferrer">
        <SiGithub size={15} title="" aria-hidden="true" />
        {t('footer-source')}
      </a>
      <!--
        Not a link itself, so the text stays inside one inline run: a flex row
        would eat the spaces around the slash and the brackets.
      -->
      <span class="chat">
        <Hash size={15} strokeWidth={2} aria-hidden="true" />
        <span>
          {t('footer-irc')} (<a class="plain" href={SITE.chatDirect}>{t('footer-irc-direct')}</a>
          /
          <a class="plain" href={SITE.chat} rel="noreferrer">{t('footer-irc-web')}</a>)
        </span>
      </span>
      <a class="plain" href={SITE.issues} rel="noreferrer">
        <Bug size={15} strokeWidth={2} aria-hidden="true" />
        {t('footer-bug')}
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

  .chat {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    color: var(--text-secondary);
    white-space: nowrap;
  }

  /* The two words are the clickable part, the brackets and the slash are not.
     Underlining them says so, since the surrounding row is links all the way
     across and colour alone would not separate them. */
  .chat a {
    display: inline;
    color: inherit;
    text-decoration: underline;
    text-decoration-color: var(--gridline);
    text-underline-offset: 0.2em;
  }

  .chat a:hover {
    color: var(--text-bright);
    text-decoration-color: currentcolor;
  }
</style>
