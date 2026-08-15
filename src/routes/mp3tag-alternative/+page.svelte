<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import StructuredData from '$components/StructuredData.svelte'
  import { YEAR } from '$data/site'

  const { data }: { data: PageData } = $props()

  const TITLE = `An Mp3tag alternative for Linux and macOS in ${YEAR}`
  const DESCRIPTION
    = 'Batch tag editing across FLAC, MP3, MP4 and APE, a per-file grid for the '
      + 'messy imports, ratings written into the files themselves, and a write '
      + 'path that never edits an original in place.'
</script>

<Meta title="Mp3tag alternative" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="Mp3tag alternative"
/>

<section class="shell narrow intro">
  <h1>A tag editor you can point at ten thousand files</h1>
  <p class="prose lede">
    Mp3tag is the tool most people mean when they say tag editor, and there's no Linux
    build of it. rox has a full editor inside it, and a write path built for the case
    where a batch is large enough that "it usually works" isn't good enough.
  </p>
  <DownloadButton release={data.release} />
</section>

<section class="shell narrow block">
  <h2>Start with what this isn't</h2>
  <div class="prose">
    <p>
      rox is a music player that contains a serious tag editor. Mp3tag is a dedicated
      tagger, and at being a dedicated tagger it's better: scripting, actions, format
      strings you can compose, and twenty years of accumulated sharp edges filed off. If
      what you want is a standalone tool to run over a folder and then close, on Windows,
      that's the one.
    </p>
    <p>
      The case for doing it in rox is that tagging a library is not usually a task you
      finish. It's something you do while you're listening, to the file you just noticed
      was wrong, which means the editor being attached to the player and the library is
      the point rather than a compromise.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>The write path</h2>
    <div class="prose">
      <p>
        This is the part worth reading even if you never install rox. Most tag writers
        modify your file in place: they open the original, rewrite the metadata region, and
        hope. That is fine tens of thousands of times and catastrophic once, because a
        crash, a full disk or a yanked drive partway through leaves a file that no longer
        parses, with your audio inside it.
      </p>
      <p>
        rox never writes into an original. Every edit copies the file, applies the change
        to the copy, verifies the result by reading the metadata back and hashing the audio
        stream to confirm it's byte-identical to what went in, and only then atomically
        renames the copy over the original. If any step fails the copy is unlinked and your
        file is untouched, because it was never opened for writing in the first place.
      </p>
      <p>
        Each file is also isolated, so one pathological file in a batch of four thousand
        fails on its own instead of taking the run down with it.
      </p>
    </div>
    <div class="callout-wrap">
      <Callout label="The cost">
        <p>
          Copy-verify-rename means every edit briefly needs free space equal to the file,
          and it's slower than writing in place. On a batch of a few thousand FLACs that's
          real time and real disk. It's the trade rox makes on purpose, and it's the whole
          reason the editor is safe to point at a library rather than a folder.
        </p>
      </Callout>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>Editing a batch without flattening it</h2>
  <div class="prose">
    <p>
      Select any number of tracks and the editor opens as one shared form. A field every
      file agrees on shows its value; fields that disagree show empty under a "multiple
      values" placeholder. Only fields you actually move write anything, so an untouched
      field never rewrites a file, and the ones that would be nonsense to stamp across a
      selection, title and track number and disc number, lock themselves in a batch.
    </p>
    <p>
      When one file inside the batch is wrong, the form swaps for a table: one row per
      track, a column per field, the locked per-track fields editable in place. That's the
      view for the import where every title and number is differently wrong, and it beats
      stepping into fields one at a time. Both views commit as a single batch through the
      same write path, and the result lands in the library without a rescan.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>What it reads and writes</h2>
    <ul class="specs">
      <li><strong>Formats.</strong> ID3v2, Vorbis comments, MP4 atoms and APE behind one editor, so MP3, FLAC, M4A and the rest are the same screen.</li>
      <li><strong>Ratings.</strong> Written into the files themselves through FMPS and POPM, not into a database you can't take with you.</li>
      <li><strong>Multi-value genres.</strong> Real lists, with merges kept as a library opinion rather than a rewrite of your tags.</li>
      <li><strong>Cover art.</strong> Multi-picture album art, added and replaced through the same atomic path.</li>
      <li><strong>Lookup.</strong> Tags and covers from MusicBrainz, iTunes and Deezer, applied through the same diff so you see what changes before it writes.</li>
      <li><strong>Repair.</strong> A pass for files whose tags are damaged in specific known ways rather than merely wrong, the ones that make other taggers show a track as a filename and a zero duration.</li>
      <li><strong>Patterns, both directions.</strong> A format string like <code>%artist% - %title%</code> reads tags out of a filename, and the same pattern run backwards renames files from their tags. Both preview every track before anything is written.</li>
    </ul>
  </div>
</section>

<section class="shell narrow block">
  <h2>Who should stay with Mp3tag</h2>
  <div class="prose">
    <p>
      If you're on Windows and you lean on actions, scripting or the more elaborate
      format-string work, rox has no equivalent and this would be a downgrade. If you want a
      tagger that isn't also a player, this is the wrong shape entirely.
    </p>
    <p>
      If you're on Linux or a Mac, or your tagging happens in the middle of listening
      rather than as a separate chore, that's the gap this fills.
    </p>
    <p class="aside">
      The write path is the part that doesn't have a counterpart to compare against.
      Verifying an audio-stream hash before renaming over an original is not something a
      tagger does unless it expects to be pointed at everything you own. If that's the kind
      of caution you want between an edit and your files, that's what this is.
    </p>
  </div>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>Point it at the folder you've been avoiding</h2>
    <p class="prose">
      Free and open source, no account, no installer. The
      <a href="{base}/best-music-player">library side of it</a> is written up separately,
      and if you're coming off a Windows setup there's a
      <a href="{base}/musicbee-alternative">MusicBee</a> and a
      <a href="{base}/foobar2000-alternative">Foobar2000</a> comparison too.
    </p>
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
    margin-block: var(--space-md) var(--space-lg);
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

  .specs {
    list-style: none;
    margin: 0;
    padding: 0;
    display: grid;
    gap: var(--space-md);
    color: var(--text-secondary);
    font-size: var(--step--1);
  }

  .specs strong {
    color: var(--text-bright);
    font-weight: 600;
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
