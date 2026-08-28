<script lang="ts">
  import type { PageData } from './$types'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('ctl-title')
  const DESCRIPTION = t('ctl-title.description')
</script>

<Meta title="Control" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="Control"
/>

<section class="shell narrow intro">
  <h1>{t('ctl-h1')}</h1>
  <p class="prose lede">{t('ctl-h1.lede')}</p>
</section>

<section class="shell narrow block">
  <h2>{t('ctl-refused')}</h2>
  <div class="prose">
    <p>{t('ctl-refused.p1')}</p>
    <p>{t('ctl-refused.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('ctl-socket')}</h2>
    <div class="prose">
      <p><Rich key="ctl-socket.p1" /></p>
      <p><Rich key="ctl-socket.p2" /></p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('ctl-events')}</h2>
  <div class="prose">
    <p><Rich key="ctl-events.p1" /></p>
    <p><Rich key="ctl-events.p2" /></p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('ctl-mcp')}</h2>
    <div class="prose">
      <p><Rich key="ctl-mcp.p1" /></p>
      <p><Rich key="ctl-mcp.p2" /></p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('ctl-broadcast')}</h2>
  <div class="prose">
    <p><Rich key="ctl-broadcast.p1" /></p>
    <p><Rich key="ctl-broadcast.p2" /></p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('ctl-build')}</h2>
    <div class="prose">
      <p><Rich key="ctl-build.p1" /></p>
      <p><Rich key="ctl-build.p2" /></p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <Callout label={t('ctl-honest')}>
    <p>{t('ctl-honest.body')}</p>
  </Callout>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>{t('ctl-closer')}</h2>
    <p class="prose"><Rich key="ctl-closer.body" /></p>
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

  .closer .prose {
    margin-bottom: var(--space-lg);
  }
</style>
