<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import StructuredData from '$components/StructuredData.svelte'

  const { data }: { data: PageData } = $props()

  const TITLE = 'Playing FLAC and CUE rips, one track at a time'
  const DESCRIPTION
    = 'A whole-disc image beside a cue sheet, indexed as real tracks: each span '
      + 'seeks, sorts, scrobbles and runs gaplessly into the next, and your '
      + 'playlists never learn that three rows share a file.'
</script>

<Meta title="Cue sheets" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="Cue sheets"
/>

<section class="shell narrow intro">
  <h1>Cue sheets, and rips that behave like albums</h1>
  <p class="prose lede">
    If you ripped CDs before splitting was the default, a chunk of your library is one
    FLAC per disc with a text file beside it. Most players either ignore the sheet or
    treat what it describes as second-class. Here's what rox does with it.
  </p>
</section>

<section class="shell narrow block">
  <h2>What a cue rip actually is</h2>
  <div class="prose">
    <p>
      One audio file holding an entire disc, and a <code>.cue</code> sheet listing where
      each track starts. It's the accurate way to preserve a CD, because the gaps between
      tracks are part of the disc and splitting throws them away. It's also the format
      that breaks the assumption every music library is built on, which is that one file
      is one track.
    </p>
    <p>
      Players resolve that in one of three ways. Ignore the sheet and show a
      seventy-minute track. Show the sheet's tracks but keep them apart from the real
      library, so search, sort and playlists behave differently for them. Or make the
      break real and absorb it once.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Real rows, not fragments</h2>
    <div class="prose">
      <p>
        rox indexes each span in the sheet as an ordinary row in the library, identified
        by its file plus its track number. Everything downstream reads it as a track,
        because to everything downstream it is one. Playlists snapshot it, listens attach
        to it, search finds it, the sort columns sort it, and none of them know that
        eleven rows point at the same FLAC.
      </p>
      <p>
        The alternative most implementations pick is a synthetic path,
        <code>album.flac#3</code>, which keeps the database tidy and moves the problem onto
        every piece of code that later opens that path. A missed strip there is a silent
        bug that reads tag bytes out of nothing. A library that owns no cue sheets pays
        nothing for any of this: the spans live in a side table, and nothing on the hot
        paths reads them.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>Playing a span like a file</h2>
  <div class="prose">
    <p>
      The engine takes a span as the whole world for that track: an accurate seek to its
      start, a sample-accurate trim at both edges, and an end boundary that takes the same
      path a real end-of-file does. Gapless, crossfade, stop-after-current and loop all
      work without knowing spans exist.
    </p>
    <p>
      The head trim is the detail that matters. An accurate seek lands on a packet
      boundary rather than the exact sample, so without dropping the frames between the
      landing and the span start, every track opens on the tail of the one before it.
      That's the sound of a cue implementation nobody finished.
    </p>
    <p>
      Consecutive tracks of one rip share an album group, which is what keeps crossfade
      from fading across a disc's own gapless splices. A rip plays like the record it was
      cut from.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Scanning, and changing your mind</h2>
    <div class="prose">
      <p>
        The sheet claims its image. While a cue lists a file, that file gets no row of its
        own, so you don't end up with eleven tracks plus a seventy-minute duplicate.
        Freshness keys off whichever of the two was modified later, so editing either the
        sheet or the audio re-cuts the rip on the next scan. Delete the sheet and the image
        folds back into one plain row.
      </p>
      <p>
        Metadata prefers the sheet and falls back to the image's own tags. Sheets written
        before UTF-8 discipline was a thing get a cp1252 fallback, because old rips are
        exactly the population this feature is for.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>Ratings that don't stamp the whole disc</h2>
  <div class="prose">
    <p>
      rox normally writes ratings into the files themselves, which is the right call when
      a file is a track. On a cue rip it isn't: the image belongs to all eleven tracks, so
      a per-track write would stamp every one of them with the same stars.
    </p>
    <p>
      The writer refuses the file half for these rows and the database keeps the value.
      Same for tag edits. You get per-track ratings on a rip, and your image comes out of
      it byte-identical.
    </p>
  </div>

  <div class="callout-wrap">
    <Callout label="Out, for now">
      <p>
        Waveform peaks and the acoustic analysis pass still read the whole image rather
        than the span. Lyrics are per file, so a rip shares one sheet. Per-span ReplayGain
        measurement, cue sheet editing in the app, and embedded FLAC CUESHEET blocks are
        all unhandled. Each is additive on top of how spans are identified, and none of
        them changes it.
      </p>
    </Callout>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>The parts you'd only notice later</h2>
    <ul class="limits">
      <li>
        m3u export writes spans as <code>path#N</code>, and import prefers an exact path
        match, so a list round-trips through other software without collapsing to the
        image.
      </li>
      <li>
        Scrobbling and now-playing dedup on the pair, so a disc's eleven tracks scrobble as
        eleven tracks rather than one very long one.
      </li>
      <li>
        Listens reattach per span after a rescan, so a disc keeps its play history per
        track even when every span carries identical tags.
      </li>
      <li>
        Only the album pair of ReplayGain values carries over. Track values written against
        a whole-disc image describe the disc, so they're ignored rather than trusted.
      </li>
    </ul>
    <p class="aside">
      The measure of this isn't whether a rip plays. It's whether, a month later, anything
      in the library still behaves differently because it came out of an image.
    </p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>Point it at the shelf you never split</h2>
  <p class="prose">
    The scanner picks the sheets up on its first pass, alongside everything else. More on
    <a href="{base}/best-music-player">what breaks at library scale</a>.
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
