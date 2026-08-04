<script lang="ts">
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import Meta from '$components/Meta.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { SIDE_PAGES } from '$data/pages'
  import { SITE, YEAR } from '$data/site'

  const TITLE = 'More about rox'
  const DESCRIPTION
    = 'The pages that sit off the main nav: the Foobar2000 comparison, what to '
      + 'look for in a music player for a local library, and how rox works on '
      + 'each of Linux, macOS and Windows.'
</script>

<Meta title="More" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData name={TITLE} description={DESCRIPTION} breadcrumb="More" />

<section class="shell narrow intro">
  <h1>More about rox</h1>
  <!-- No count in the copy. "Five pages" was true when this was written and
       becomes a lie the first time someone adds a sixth. -->
  <p class="prose lede">
    The pages that don't belong in the nav, kept somewhere findable instead of
    deleted.
  </p>
</section>

<section class="shell narrow block">
  <Callout label="Why these are here">
    <p>
      These exist to be found. Someone searching for a Foobar2000 alternative on Linux in
      {YEAR}, or working out which player survives a library this size, should land
      somewhere that answers them rather than on a homepage written for people who already
      know what rox is.
    </p>
    <p>
      They're off the nav on purpose. The main site is three pages: what rox is, how to get
      it, what it looks like. Stacking the rest into the header would make the thing you
      came for harder to find, which is a bad trade for everyone who arrived already
      knowing.
    </p>
    <p>
      You might know all of this about rox and Foobar2000 already. Plenty of people landing
      here won't, and they're who these are for. Each one says where rox loses as well as
      where it wins, and repeats nothing you'd get from the
      <a href="{base}/">homepage</a>.
    </p>
  </Callout>
</section>

<section class="shell narrow block">
  <h2>The pages</h2>
  <ul class="pages">
    {#each SIDE_PAGES as item (item.path)}
      <li>
        <h3><a href="{base}{item.path}">{item.name}</a></h3>
        <p>{item.blurb}</p>
      </li>
    {/each}
  </ul>
</section>

<section class="shell narrow block closer">
  <p class="prose">
    If you'd rather skip all of it, the
    <a href="{base}/download">download page</a> is two clicks from a running player, and
    the <a href={SITE.repo} rel="noreferrer">source</a> is the most honest documentation
    here.
  </p>
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

  .block {
    padding-bottom: var(--space-xl);
  }

  .block h2 {
    font-size: var(--step-2);
    margin-bottom: var(--space-lg);
  }

  .pages {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: var(--space-lg);
  }

  .pages h3 {
    font-size: var(--step-1);
    margin-bottom: var(--space-xs);
  }

  .pages p {
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .closer {
    color: var(--text-muted);
    font-size: var(--step--1);
  }
</style>
