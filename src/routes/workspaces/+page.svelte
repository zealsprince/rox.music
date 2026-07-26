<script lang="ts">
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import { WORKSPACES } from '$data/workspaces'
</script>

<Meta
  title="Workspaces"
  description="A workspace is a whole look in one shareable file: layout, palette and appearance. Five ship with rox, from a Foobar2000 tribute to a monospace terminal."
  image="/social/workspaces.png"
/>

<section class="shell intro">
  <h1>Workspaces</h1>
  <p class="prose lede">
    A workspace is a whole look in one file: layout, palette, appearance. Load one from
    the welcome window or settings, change anything you like, and hand the file to
    someone else to get the same thing back. These five ship in the box.
  </p>
</section>

<!--
  A switcher rather than five stacked full windows, because stacked they read as
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
        <Screenshot
          id={workspace.id}
          alt="The {workspace.name} workspace in rox"
          sizes="(min-width: 64rem) 70vw, 100vw"
          priority={index === 0}
        />
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

  .blurb {
    margin-top: var(--space-md);
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  /*
    One rule per workspace tying a checked input to its panel. Written out rather
    than generated: :has() with :nth-of-type would be less legible and no shorter
    at five items.
  */
  .tabs:has(#ws-default:checked) ~ .panels .panel[data-panel='default'],
  .tabs:has(#ws-foobar:checked) ~ .panels .panel[data-panel='foobar'],
  .tabs:has(#ws-llama:checked) ~ .panels .panel[data-panel='llama'],
  .tabs:has(#ws-metro:checked) ~ .panels .panel[data-panel='metro'],
  .tabs:has(#ws-phosphor:checked) ~ .panels .panel[data-panel='phosphor'] {
    visibility: visible;
    opacity: 1;
    pointer-events: auto;
  }
</style>
