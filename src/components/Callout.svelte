<script lang="ts">
  import type { Snippet } from 'svelte'
  import { Info } from '@lucide/svelte'

  interface Props {
    /**
     * Short label above the body, e.g. "Disclosure". It's what tells a skimmer
     * whether this block is about the subject or about the page itself, which
     * is the whole reason a callout is worth having.
     */
    label?: string
    children: Snippet
  }

  const { label, children }: Props = $props()
</script>

<!--
  For text that steps out of the argument to say something about the page: a
  bias disclosure, a note on why a set of pages exists. Not for emphasis. If
  it's part of the point being made it belongs in the prose, and putting it in a
  box only teaches people to skip boxes.

  <aside> rather than <div>, since that is what the element is for and it gives
  screen readers a landmark to skip.
-->
<aside class="callout">
  {#if label}
    <p class="label">
      <Info size={14} strokeWidth={2.4} aria-hidden="true" />
      {label}
    </p>
  {/if}
  <div class="body">
    {@render children()}
  </div>
</aside>

<style>
  .callout {
    background: var(--bg-panel);
    border: var(--hairline) solid var(--border);
    /* The accent edge is the only colour in it. Enough to read as deliberate
       from across the page without competing with a download button. */
    border-left: 2px solid var(--accent);
    padding: var(--space-md);
  }

  .label {
    display: flex;
    align-items: center;
    gap: 0.4rem;
    margin-bottom: var(--space-sm);
    color: var(--text-muted);
    font-size: var(--step--1);
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.08em;
  }

  .body {
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  /* Spacing between paragraphs handled here rather than by .prose, so a callout
     works the same whether or not it's nested in one. */
  .body :global(> * + *) {
    margin-top: var(--space-md);
  }
</style>
