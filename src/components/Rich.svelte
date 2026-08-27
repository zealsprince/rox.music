<script lang="ts">
  import type { MessageArgs } from '$lib/i18n'
  import { i18n } from '$lib/i18n/context'

  interface Props {
    /** Catalog key. The message may carry links, `code`, **bold** and _italic_. */
    key: string
    args?: MessageArgs
  }

  const { key, args }: Props = $props()

  const { rich } = i18n()
</script>

<!--
  The one place on the site that writes {@html}, so the rule below is disabled
  once rather than at every paragraph with a link in it.

  What reaches it: a message from src/locales, HTML-escaped, with the four inline
  forms in $lib/i18n turned back into tags. The catalogs are files in this repo,
  the render happens at prerender, and no visitor input goes anywhere near it.
-->
<!-- eslint-disable-next-line svelte/no-at-html-tags -->
{@html rich(key, args)}
