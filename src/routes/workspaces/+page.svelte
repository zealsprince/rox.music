<script lang="ts">
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { WORKSPACES } from '$data/workspaces'

  const TITLE = 'rox workspaces - shareable themes and layouts'
  const DESCRIPTION
    = 'A rox workspace is a whole look in one shareable file: layout, palette '
      + 'and appearance. Six ship in the box, from a Foobar2000 tribute to a '
      + 'monospace terminal.'
</script>

<Meta
  title="Workspaces"
  fullTitle={TITLE}
  description={DESCRIPTION}
  image="/social/workspaces.png"
  imageAlt="The rox logo above the words: a whole look in one shareable file"
/>
<!-- This page had no graph at all, so the six shots it exists to show were
     invisible to anything reading structured data. -->
<StructuredData
  name={TITLE}
  description={DESCRIPTION}
  image="/social/workspaces.png"
  breadcrumb="Workspaces"
/>

<section class="shell intro">
  <h1>Workspaces</h1>
  <p class="prose lede">
    A workspace is a whole look in one file: layout, palette, appearance. Load one from
    the welcome window or settings, change anything you like, and hand the file to
    someone else to get the same thing back. These six ship in the box.
  </p>
</section>

<!--
  A switcher rather than six stacked full windows, because stacked they read as
  repetition instead of as range.

  Built on radio inputs so it works with no JavaScript at all, which matters
  here: the whole site is prerendered with csr = false. The inputs hold the
  state, the labels are the tabs, and :checked drives which panel shows. Keyboard
  arrow navigation and screen reader semantics come free with the radio group.
-->
<section class="shell switcher">
  <div class="tabs">
    {#each WORKSPACES as workspace, index (workspace.id)}
      <input
        type="radio"
        name="workspace"
        id="ws-{workspace.id}"
        value={workspace.id}
        checked={index === 0}
      />
      <label for="ws-{workspace.id}">{workspace.name}</label>
    {/each}
  </div>

  <div class="panels">
    {#each WORKSPACES as workspace, index (workspace.id)}
      <article class="panel" data-panel={workspace.id}>
        <!--
          `sizes` describes the real box: the full content width of .shell, which
          is max-width 1180px minus 2rem of padding each side = 1116px, dropping
          to 1.25rem of padding below 48rem. The old "70vw" under-budgeted by a
          third, so the browser fetched a file sized for an 832px slot and then
          stretched it across 1116px. Update it if .shell or --page-max move.
        -->
        <Screenshot
          id={workspace.id}
          alt={workspace.alt}
          sizes="(min-width: 1180px) 1116px, (min-width: 48rem) calc(100vw - 4rem), calc(100vw - 2.5rem)"
          priority={index === 0}
        />
        <!-- A real heading per workspace, not just the tab label. The tab is a
             control; this is the content, and it gives the page a structure
             below the h1 for both crawlers and screen reader navigation. -->
        <h2>{workspace.name}</h2>
        <p class="blurb">{workspace.blurb}</p>
      </article>
    {/each}
  </div>
</section>

<style>
  .intro {
    padding-block: var(--space-xl) var(--space-lg);
  }

  h1 {
    font-size: var(--step-4);
  }

  .lede {
    margin-top: var(--space-md);
    font-size: var(--step-1);
    color: var(--text-secondary);
  }

  .switcher {
    padding-bottom: var(--space-2xl);
  }

  .tabs {
    display: flex;
    flex-wrap: wrap;
    gap: var(--space-xs);
    margin-bottom: var(--space-md);
    border-bottom: var(--hairline) solid var(--border);
  }

  /* The radios are the state, not the interface. Kept in the layout rather than
     display: none so they stay focusable and reachable by keyboard. */
  .tabs input {
    position: absolute;
    width: 1px;
    height: 1px;
    opacity: 0;
    pointer-events: none;
  }

  .tabs label {
    padding: 0.55rem var(--space-md);
    margin-bottom: -1px;
    border: var(--hairline) solid transparent;
    border-bottom: 0;
    color: var(--text-secondary);
    font-size: var(--step--1);
    cursor: pointer;
  }

  .tabs label:hover {
    color: var(--text-bright);
  }

  .tabs input:checked + label {
    background: var(--bg-panel);
    border-color: var(--border);
    box-shadow: inset 0 2px 0 var(--accent);
    color: var(--text-bright);
  }

  /* Focus has to show on the label, since the input it belongs to is invisible. */
  .tabs input:focus-visible + label {
    outline: 2px solid var(--accent);
    outline-offset: -2px;
  }

  .panels {
    display: grid;
  }

  /* Every panel stacks into one grid cell, so switching never changes the page
     height and nothing below it jumps. */
  .panel {
    grid-area: 1 / 1;
    visibility: hidden;
    opacity: 0;
    pointer-events: none;
  }

  .panel h2 {
    margin-top: var(--space-md);
    font-size: var(--step-1);
  }

  .blurb {
    margin-top: var(--space-xs);
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  /*
    One rule per workspace tying a checked input to its panel. Written out rather
    than generated: :has() with :nth-of-type would be less legible and no shorter
    at six items.
  */
  .tabs:has(#ws-default:checked) ~ .panels .panel[data-panel='default'],
  .tabs:has(#ws-foobar:checked) ~ .panels .panel[data-panel='foobar'],
  .tabs:has(#ws-catrox:checked) ~ .panels .panel[data-panel='catrox'],
  .tabs:has(#ws-llama:checked) ~ .panels .panel[data-panel='llama'],
  .tabs:has(#ws-metro:checked) ~ .panels .panel[data-panel='metro'],
  .tabs:has(#ws-phosphor:checked) ~ .panels .panel[data-panel='phosphor'] {
    visibility: visible;
    opacity: 1;
    pointer-events: auto;
  }
</style>
