<script lang="ts">
  import type { PageData } from './$types'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Rich from '$components/Rich.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { WORKSPACE_COUNT } from '$data/workspaces'
  import { i18n } from '$lib/i18n/context'

  const { data }: { data: PageData } = $props()

  const { t } = i18n()

  const TITLE = t('neko-title')
  const DESCRIPTION = t('neko-title.description')

  // Straight off the NekoRoX README, in its order, answered against what rox
  // actually ships. Two of them are misses and they stay in the list: someone
  // arriving from a decade of NekoRoX deserves to find that out here rather
  // than after the download. The key names the old feature; `.now` is the
  // answer.
  const CARRIED = [
    { key: 'neko-had-nav', kept: true },
    { key: 'neko-had-mini', kept: true },
    { key: 'neko-had-ontop', kept: false },
    { key: 'neko-had-ratings', kept: true },
    { key: 'neko-had-youtube', kept: false },
    { key: 'neko-had-covers', kept: true },
    { key: 'neko-had-lyrics', kept: true },
    { key: 'neko-had-viz', kept: true },
    { key: 'neko-had-discord', kept: true },
    { key: 'neko-had-bio', kept: true },
    { key: 'neko-had-lastfm', kept: true },
  ]
</script>

<Meta title="NekoRoX" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="NekoRoX"
/>

<section class="shell narrow intro">
  <h1>{t('neko-h1')}</h1>
  <p class="prose lede"><Rich key="neko-h1.lede" /></p>

  <div class="shot portrait">
    <Screenshot
      id="nekorox"
      alt={t('neko-shot-alt')}
      sizes="(min-width: 640px) 560px, calc(100vw - 2.5rem)"
    />
    <p class="caption">{t('neko-shot-caption')}</p>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('neko-was')}</h2>
  <div class="prose">
    <p><Rich key="neko-was.p1" /></p>
    <p><Rich key="neko-was.p2" /></p>
  </div>

  <div class="credit">
    <Callout label={t('neko-where')}>
      <p><Rich key="neko-where.body" /></p>
    </Callout>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('neko-alpha')}</h2>
    <div class="prose">
      <p><Rich key="neko-alpha.body" /></p>
    </div>

    <div class="shot portrait">
      <Screenshot
        id="alpharox"
        alt={t('neko-alpha.alt')}
        sizes="(min-width: 640px) 560px, calc(100vw - 2.5rem)"
        lightSource
      />
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>{t('neko-stopped')}</h2>
  <div class="prose">
    <p>{t('neko-stopped.p1')}</p>
    <p>{t('neko-stopped.p2')}</p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>{t('neko-rox')}</h2>
    <div class="prose">
      <p><Rich key="neko-rox.body" args={{ others: WORKSPACE_COUNT - 2 }} /></p>
    </div>

    <div class="shot">
      <Screenshot
        id="default"
        alt={t('neko-default-alt')}
        sizes="(min-width: 827px) 787px, calc(100vw - 2.5rem)"
      />
    </div>

    <h3>{t('neko-carried')}</h3>
    <ul class="carried">
      {#each CARRIED as row (row.key)}
        <li class:gone={!row.kept}>
          <span class="had">{t(row.key)}</span>
          <span class="now">{t(`${row.key}.now`)}</span>
        </li>
      {/each}
    </ul>

    <p class="prose after-list">{t('neko-carried.after')}</p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>{t('neko-closer')}</h2>
  <p class="prose">
    <Rich key="neko-closer.body" args={{ count: WORKSPACE_COUNT }} />
  </p>
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

  .block h3 {
    font-size: var(--step-1);
    margin-block: var(--space-xl) var(--space-md);
  }

  .shot {
    margin-top: var(--space-lg);
  }

  /* Both foobar2000 shots are taller than they are wide. At the full reading
     measure they'd run past a laptop viewport on their own, so they get capped
     and centred instead. */
  .portrait {
    max-width: 560px;
    margin-inline: auto;
  }

  .caption {
    margin-top: var(--space-sm);
    font-size: var(--step--1);
    color: var(--text-muted);
    text-align: center;
  }

  .credit {
    margin-top: var(--space-lg);
  }

  .carried {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: var(--space-md);
  }

  .carried li {
    display: grid;
    gap: 0.2rem;
  }

  .had {
    font-size: var(--step--1);
    color: var(--text-muted);
  }

  .now {
    color: var(--text-secondary);
  }

  /*
    The two misses read differently from the nine hits without needing a word to
    say so. Struck through, because that's what happened to them.
  */
  .gone .had {
    text-decoration: line-through;
  }

  .gone .now {
    color: var(--text-muted);
  }

  .after-list {
    margin-top: var(--space-lg);
  }

  .closer .prose {
    margin-bottom: var(--space-lg);
  }
</style>
