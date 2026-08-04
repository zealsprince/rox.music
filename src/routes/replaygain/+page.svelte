<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import StructuredData from '$components/StructuredData.svelte'

  const { data }: { data: PageData } = $props()

  const TITLE = 'ReplayGain explained, and what turning it on costs'
  const DESCRIPTION
    = 'What ReplayGain actually does, track gain versus album gain, why the peak '
      + 'value matters, how to handle files nobody ever measured, and why '
      + 'ReplayGain and bit-perfect playback are mutually exclusive.'
</script>

<Meta title="ReplayGain" fullTitle={TITLE} description={DESCRIPTION} />
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  breadcrumb="ReplayGain"
/>

<section class="shell narrow intro">
  <h1>ReplayGain, and what it costs you</h1>
  <p class="prose lede">
    Why one album is twice as loud as the next, what the fix actually does to your audio,
    and why you can't have it and bit-perfect playback at the same time.
  </p>
</section>

<section class="shell narrow block">
  <h2>The problem it solves</h2>
  <div class="prose">
    <p>
      Records aren't mastered to a common loudness. A 1985 CD and a 2005 remaster of the
      same album can differ by ten decibels or more, which is the difference between
      comfortable and reaching for the volume knob. Shuffle a library across four decades
      and you're adjusting volume every third track.
    </p>
    <p>
      ReplayGain fixes this without touching your audio. An analysis pass measures how far
      a track sits from a reference loudness and writes that number, in decibels, into the
      file's tags. At playback the player reads the number and applies it. Nothing is
      re-encoded and nothing is destroyed, because the correction lives in a tag and the
      audio underneath is the audio you had.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Track gain and album gain</h2>
    <div class="prose">
      <p>
        Every measured file carries two numbers, and picking between them is the one
        setting that actually changes how listening feels.
      </p>
      <p>
        <strong>Track gain</strong> levels each track independently. Every song arrives at
        the same loudness, which is what you want on shuffle. It also flattens albums that
        were built with dynamics on purpose: the quiet interlude before the loud closer
        gets pulled up to match it, and the effect the producer intended is gone.
      </p>
      <p>
        <strong>Album gain</strong> applies one figure to every track on the record, worked
        out from the album as a whole. Relative differences inside the album survive
        exactly as mastered, and the album as a unit sits level with other albums. This is
        the right default if you listen to records front to back.
      </p>
      <p>
        rox takes this as a setting and applies the chosen figure per track as it opens, so
        it's a preference rather than something baked into the files.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>The peak, and why a boost can clip</h2>
  <div class="prose">
    <p>
      Alongside the gain, a measurement pass records the loudest sample in the track. That
      number matters because ReplayGain corrections go both ways: a quiet recording gets a
      positive gain, and multiplying samples that already reach near full scale pushes them
      past it. Past full scale there's nowhere to go, so the waveform flattens and you hear
      distortion that wasn't in the file.
    </p>
    <p>
      The peak is what prevents it. rox clamps a boost against the peak the tag reports, so
      a quiet track gets turned up only as far as it can go without clipping. The result is
      that some quiet tracks land slightly below the target loudness, which is the correct
      trade and the reason peak values are stored at all.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>The files nobody ever measured</h2>
    <div class="prose">
      <p>
        ReplayGain only works on files that carry the tags, and in a real library assembled
        over twenty years a large fraction won't. Historically that meant running a
        separate tagger over everything before your player was any use.
      </p>
      <p>
        rox reads the tags where they exist, under the standard names in every format it
        indexes: TXXX frames in ID3v2, Vorbis comments in FLAC, freeform atoms in MP4. For
        everything else it measures the files itself with an EBU R128 loudness pass and
        stores the result against the library, marked as measured so a later rescan can
        tell rox's own numbers apart from what a tagger wrote. If you'd rather the numbers
        lived in the files, a setting writes them back through the same verified write path
        the tag editor uses.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>The part most pages skip</h2>
  <div class="prose">
    <p>
      ReplayGain multiplies your samples by a number. That is processing. It is not
      lossless, it is not a passthrough, and any player claiming both ReplayGain and
      bit-perfect output at the same time is describing something that cannot happen.
    </p>
    <p>
      This matters if you own a DAC you chose carefully. Bit-perfect means the samples that
      reach the converter are the samples in the file, unmodified, so anything that scales
      them, a volume control below unity, an equalizer, ReplayGain, ends the claim. There
      is no version of loudness normalisation that leaves the bits alone, because changing
      the loudness is changing the bits.
    </p>
  </div>

  <div class="callout-wrap">
    <Callout label="What bit-perfect means in rox">
      <p>
        Three conditions, stated rather than decorated: the processing chain empty or
        disabled, volume at 100%, and the device running at the source file's own rate.
        Meet all three and the converter receives bit-identical samples. Miss any one and
        it doesn't, and rox says so instead of showing a badge. ReplayGain on is processing
        on, and it reads as processing on.
      </p>
    </Callout>
  </div>

  <div class="prose after-callout">
    <p>
      Which of the two you want is a real choice rather than a trick question. Bit-perfect
      matters for critical listening to one album on good hardware. ReplayGain matters for
      every other hour, when the library is on shuffle and you'd rather not touch the
      volume. Most people should run ReplayGain and stop worrying about it. The point is
      knowing which one is on.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Exclusive output, separately</h2>
    <div class="prose">
      <p>
        Bit-perfect also needs the operating system out of the path, which is what an
        exclusive output mode is for. rox takes the device directly: the ALSA
        <code>hw:</code> name on Linux, with no dmix, no plug and no sound server in the
        way; WASAPI exclusive on Windows; hog mode through CoreAudio on macOS. It follows
        the source rate where the device allows it, and reports what the hardware actually
        agreed to rather than what was asked for.
      </p>
      <p>
        The trade is what exclusive means everywhere: while rox holds the device, nothing
        else on the machine plays through it. If the device can't be acquired, rox falls
        back to shared mode with the state visible, rather than going quiet and leaving you
        to work out why.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>What isn't handled</h2>
  <ul class="limits">
    <li>
      Opus files carry their own <code>R128_TRACK_GAIN</code> scheme relative to a
      different reference. rox doesn't convert it, because <code>.opus</code> isn't in the
      scanner's extensions.
    </li>
    <li>
      iTunes' <code>iTunNORM</code> is out of scope. Nothing else writes it and its
      per-channel figures aren't a decibel gain.
    </li>
    <li>
      Following the source rate in exclusive mode costs an audible gap between two tracks
      of different sample rates, since the stream reopens. Gapless within one rate is
      unaffected.
    </li>
  </ul>
  <p class="aside">
    A player that tells you which of bit-perfect and ReplayGain is currently true, and
    measures the files your taggers never got to, is a short list. If that's the kind of
    honesty you want from the thing between your library and your DAC, rox is on it.
  </p>
</section>

<section class="block band closer">
  <div class="shell narrow">
    <h2>Point it at your library</h2>
    <p class="prose">
      The measurement pass runs in the background over everything missing a gain, and keeps
      running with the settings window closed. More on
      <a href="{base}/best-music-player">what else matters at library scale</a>.
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

  .prose strong {
    color: var(--text-bright);
    font-weight: 600;
  }

  .callout-wrap {
    margin-top: var(--space-lg);
  }

  .after-callout {
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
