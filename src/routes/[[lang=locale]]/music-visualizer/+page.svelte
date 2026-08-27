<script lang="ts">
  import type { PageData } from './$types'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('viz-title')
  const DESCRIPTION = t('viz-title.description')
</script>

<Meta
  title={t('viz-breadcrumb')}
  fullTitle={TITLE}
  description={DESCRIPTION}
  image="/social/visualizer.png"
  imageAlt={t('viz-title.image-alt')}
/>
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  image="/social/visualizer.png"
  breadcrumb={t('viz-breadcrumb')}
/>

<section class="shell narrow intro">
  <h1>{t('viz-h1')}</h1>
  <p class="prose lede">{t('viz-h1.lede')}</p>
</section>

<section class="shell narrow block">
  <h2>{t('viz-panels')}</h2>
  <div class="prose">
    <p>{t('viz-panels.p1')}</p>
    <p>{t('viz-panels.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('viz-shaders')}</h2>
    <div class="prose">
      <p>{t('viz-shaders.p1')}</p>
      <p>{t('viz-shaders.p2')}</p>
      <p>{t('viz-shaders.p3')}</p>
      <p><Rich key="viz-shaders.p4" /></p>
      <p>{t('viz-shaders.p5')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('viz-signals')}</h2>
  <div class="prose">
    <p>{t('viz-signals.p1')}</p>
    <p><Rich key="viz-signals.p2" /></p>
    <p>{t('viz-signals.p3')}</p>
    <p>{t('viz-signals.p4')}</p>
  </div>

  <div class="callout-wrap">
    <Callout label={t('viz-tap')}>
      <p>{t('viz-tap.body')}</p>
    </Callout>
  </div>
</section>

<section class="block band">
  <div class="shell">
    <h2>{t('viz-critters')}</h2>
    <p class="prose wide-prose">{t('viz-critters.body')}</p>
    <Screenshot
      id="critters"
      alt={t('workspace-critters.alt')}
      sizes="(min-width: 1180px) 1116px, (min-width: 48rem) calc(100vw - 4rem), calc(100vw - 2.5rem)"
    />
    <p class="prose wide-prose caption"><Rich key="viz-critters.caption" /></p>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('viz-trust')}</h2>
  <div class="prose">
    <p>{t('viz-trust.p1')}</p>
    <p>{t('viz-trust.p2')}</p>
    <p>{t('viz-trust.p3')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('viz-limits')}</h2>
    <ul class="limits">
      <li>{t('viz-limit-routes')}</li>
      <li>{t('viz-limit-milkdrop')}</li>
      <li>{t('viz-limit-midi')}</li>
      <li>{t('viz-limit-battery')}</li>
    </ul>
    <p class="aside">{t('viz-limits.aside')}</p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>{t('viz-closer')}</h2>
  <p class="prose"><Rich key="viz-closer.body" /></p>
  <DownloadButton release={data.release} />
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
    padding-block: var(--space-xl);
  }

  .band {
    background: var(--bg-panel);
    border-block: var(--hairline) solid var(--border);
  }

  .block h2 {
    font-size: var(--step-3);
    margin-bottom: var(--space-md);
  }

  /* :global, because the bold run comes out of a message through {@html} and
     Svelte's scoping class never lands on it. */
  .prose :global(strong) {
    color: var(--text-bright);
    font-weight: 600;
  }

  /* This one section runs the full shell so the screenshot gets the width it
     needs, and the prose runs with it: a paragraph stopped at the measure over
     a screenshot at 1116px reads as two columns that failed to line up. */
  .wide-prose {
    max-width: none;
    margin-bottom: var(--space-lg);
  }

  .caption {
    margin-top: var(--space-md);
    margin-bottom: 0;
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .callout-wrap {
    margin-top: var(--space-lg);
  }

  .limits {
    margin: 0;
    padding-left: 1.1rem;
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .limits li + li {
    margin-top: var(--space-sm);
  }

  .aside {
    margin-top: var(--space-lg);
    color: var(--text-bright);
    font-style: italic;
  }

  .closer .prose {
    margin-bottom: var(--space-lg);
  }
</style>
