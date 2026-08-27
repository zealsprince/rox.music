<script lang="ts">
  import Callout from '$components/Callout.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { SIDE_PAGES } from '$data/pages'
  import { YEAR } from '$data/site'
  import { i18n } from '$lib/i18n/context'

  const { t, href } = i18n()

  const TITLE = t('more-title')
  const DESCRIPTION = t('more-title.description')
</script>

<Meta title={t('nav-more')} fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData name={TITLE} description={DESCRIPTION} breadcrumb={t('nav-more')} />

<section class="shell narrow intro">
  <h1>{TITLE}</h1>
  <!-- No count in the copy. "Five pages" was true when this was written and
       becomes a lie the first time someone adds a sixth. -->
  <p class="prose lede">{t('more-lede')}</p>
</section>

<section class="shell narrow block">
  <Callout label={t('more-why')}>
    <p><Rich key="more-why.p1" args={{ year: YEAR }} /></p>
    <p><Rich key="more-why.p2" /></p>
    <p><Rich key="more-why.p3" /></p>
  </Callout>
</section>

<section class="shell narrow block">
  <h2>{t('more-pages')}</h2>
  <ul class="pages">
    {#each SIDE_PAGES as item (item.path)}
      <li>
        <h3><a href={href(item.path)}>{t(item.key)}</a></h3>
        <p>{t(`${item.key}.blurb`)}</p>
      </li>
    {/each}
  </ul>
</section>

<section class="shell narrow block closer">
  <p class="prose"><Rich key="more-closer" /></p>
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
