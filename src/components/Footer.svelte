<script lang="ts">
  import { base } from '$app/paths'
  import { HUB } from '$data/pages'
  import { SITE } from '$data/site'
  import { Bug, Hash } from '@lucide/svelte'
  import SiGithub from './icons/SiGithub.svelte'
</script>

<footer>
  <div class="shell inner">
    <p class="tag">
      rox is built by
      <a href="https://zealsprince.com" rel="me">Andrew Lake (zealsprince)</a> in Rust on
      <a href="https://gpui.rs" rel="noreferrer">gpui</a>, the UI framework behind
      <a href="https://zed.dev" rel="noreferrer">Zed</a>. Free and open source under the
      <a href="https://www.gnu.org/licenses/agpl-3.0.html" rel="license noreferrer">
        AGPL-3.0
      </a>.
    </p>

    <nav aria-label="Footer">
      <a href="{base}/download">Download</a>
      <a href="{base}/workspaces">Workspaces</a>
      <!--
        The only link into the pages that sit off the nav. It has to exist:
        a page reachable from nothing but sitemap.xml is an orphan, and orphans
        get crawled rarely and indexed less. Footer rather than header keeps
        them out of the way of people who came here to download something.
      -->
      <a href="{base}{HUB.path}">{HUB.name}</a>
      <a class="plain" href={SITE.repo} rel="noreferrer">
        <SiGithub size={15} title="" aria-hidden="true" />
        Source
      </a>
      <!--
        Not a link itself, so the text stays inside one inline run: a flex row
        would eat the spaces around the slash and the brackets.
      -->
      <span class="chat">
        <Hash size={15} strokeWidth={2} aria-hidden="true" />
        <span>
          IRC (<a class="plain" href={SITE.chatDirect}>Direct</a> /
          <a class="plain" href={SITE.chat} rel="noreferrer">Webchat</a>)
        </span>
      </span>
      <a class="plain" href={SITE.issues} rel="noreferrer">
        <Bug size={15} strokeWidth={2} aria-hidden="true" />
        Report a bug
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
