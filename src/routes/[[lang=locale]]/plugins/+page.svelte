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

  const TITLE = t('plg-title')
  const DESCRIPTION = t('plg-title.description')
</script>

<Meta title={t('plg-breadcrumb')} fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb={t('plg-breadcrumb')}
/>

<section class="shell narrow intro">
  <h1>{t('plg-h1')}</h1>
  <p class="prose lede">{t('plg-h1.lede')}</p>
</section>

<section class="shell narrow block">
  <h2>{t('plg-what')}</h2>
  <div class="prose">
    <p>{t('plg-what.p1')}</p>
    <p>{t('plg-what.p2')}</p>
  </div>
</section>

<section class="block band">
  <!-- The shot is portrait, so on a wide screen it stands beside the text
       rather than under it, where it would run two screens tall. -->
  <div class="shell browse">
    <div>
      <h2>{t('plg-browse')}</h2>
      <div class="prose">
        <p>{t('plg-browse.p1')}</p>
        <p>{t('plg-browse.p2')}</p>
      </div>
    </div>
    <figure class="shot">
      <Screenshot
        id="plugins"
        alt={t('home-plugins-shot')}
        sizes="(min-width: 64rem) 34rem, (min-width: 48rem) 40rem, calc(100vw - 2.5rem)"
      />
      <figcaption class="caption"><Rich key="home-plugins-caption" /></figcaption>
    </figure>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('plg-play')}</h2>
  <div class="prose">
    <p>{t('plg-play.p1')}</p>
    <p>{t('plg-play.p2')}</p>
    <p>{t('plg-play.p3')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('plg-radio')}</h2>
    <div class="prose">
      <p>{t('plg-radio.p1')}</p>
      <p>{t('plg-radio.p2')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('plg-trust')}</h2>
  <div class="prose">
    <p>{t('plg-trust.p1')}</p>
    <p>{t('plg-trust.p2')}</p>
  </div>

  <div class="callout-wrap">
    <Callout label={t('plg-sandbox')}>
      <p>{t('plg-sandbox.body')}</p>
    </Callout>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('plg-write')}</h2>
    <div class="prose">
      <p><Rich key="plg-write.p1" /></p>
      <p><Rich key="plg-write.p2" /></p>
      <p>{t('plg-write.p3')}</p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('plg-limits')}</h2>
  <ul class="limits">
    <li>{t('plg-limit-scope')}</li>
    <li>{t('plg-limit-python')}</li>
    <li><Rich key="plg-limit-flatpak" /></li>
    <li>{t('plg-limit-macos')}</li>
    <li>{t('plg-limit-windows')}</li>
  </ul>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('plg-closer')}</h2>
    <p class="prose"><Rich key="plg-closer.body" /></p>
    <DownloadButton release={data.release} />
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

  .browse {
    display: grid;
    gap: var(--space-lg);
  }

  @media (min-width: 64rem) {
    .browse {
      grid-template-columns: minmax(0, 1fr) minmax(0, 34rem);
      gap: var(--space-xl);
      align-items: start;
    }
  }

  .shot {
    margin: 0;
    max-width: 40rem;
  }

  .caption {
    margin-top: var(--space-md);
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

  .closer .prose {
    margin-bottom: var(--space-lg);
  }
</style>
