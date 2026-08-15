<script lang="ts">
  import type { PageData } from './$types'
  import { base } from '$app/paths'
  import Callout from '$components/Callout.svelte'
  import DownloadButton from '$components/DownloadButton.svelte'
  import Meta from '$components/Meta.svelte'
  import Screenshot from '$components/Screenshot.svelte'
  import StructuredData from '$components/StructuredData.svelte'

  const { data }: { data: PageData } = $props()

  const TITLE = 'A music visualizer built into the player - rox'
  const DESCRIPTION
    = 'Spectrum, waveform and VU panels, plus WGSL shaders over any panel or '
      + 'the whole window, driven by named signals you pull off the playing '
      + 'audio and route wherever you want them.'
</script>

<Meta
  title="Music visualizer"
  fullTitle={TITLE}
  description={DESCRIPTION}
  image="/social/visualizer.png"
  imageAlt="The rox logo above the words: signals off the music, shaders on every surface"
/>
<StructuredData
  release={data.release}
  name={TITLE}
  description={DESCRIPTION}
  image="/social/visualizer.png"
  breadcrumb="Music visualizer"
/>

<section class="shell narrow intro">
  <h1>A visualizer that lives in the player</h1>
  <p class="prose lede">
    Most players give you a spectrum analyzer and stop. rox has those panels, and under
    them a modulation layer: named signals pulled off the audio, routed into shader inputs
    you write yourself, saved into the same file the rest of your theme lives in.
  </p>
</section>

<section class="shell narrow block">
  <h2>The ordinary panels, first</h2>
  <div class="prose">
    <p>
      A spectrum panel with bar or block styles, gradients, peak caps with their own
      gravity, frequency labels, and split zoning that analyses above and below a chosen
      frequency at different window sizes, so each end of the range trades reactivity for
      resolution on its own terms. A waveform strip that draws the whole track, per
      channel, and seeks where you click. A VU meter. An art shelf that turns covers in
      real 3D. None of it needs a word of code and it's what most people will use.
    </p>
    <p>
      Pausing freezes the bars where they were, rather than letting them fall to the
      floor. That sounds small until you're trying to look at the exact moment you paused
      on.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>Shaders, on four surfaces</h2>
    <div class="prose">
      <p>
        A rox shader is one WGSL fragment stage. It can run over a single panel's body, as
        a Shader panel of its own, as an overlay across the whole window, or as a backdrop
        painting under every panel, behind the cover art. Overlay and backdrop each take a
        switch that extends them to every window rox has open. Same language, same uniform
        block, same routing in all of them.
      </p>
      <p>
        Every shader gets the clock, the resolution, the pointer, and eight meta floats
        describing the moment: volume, where the playhead sits in the track, whether audio
        is actually moving, the track's length, and how dark the current palette renders,
        so one shader can dress itself for light and dark instead of shipping for the
        theme it was written against.
      </p>
      <p>
        A panel shader can also read what the panel actually drew. A mask binding hands it
        the panel's own painting replayed onto transparency, and panels publish the shape of
        their content, so a shadow or a glow follows a letterboxed cover rather than the
        empty bars either side of it.
      </p>
      <p>
        Past one stage, a <code>// @pass</code> comment splits the text into a chain of up
        to eight, each one able to read the passes before it by name. That's what a blur
        pyramid or a two-stage bloom needs. A <code>// @asset</code> line names an image to
        sample, and <code>// @asset art: @cover</code> binds the playing track's own cover,
        rebinding when the track turns over. Nine examples ship with the app, each one
        demonstrating a different part of that contract rather than nine variations on a
        plasma.
      </p>
      <p>
        Point the panel at a file on disk and rox watches it. Save in your editor and the
        window has it. A save that doesn't compile leaves the last good version on screen
        with the error in the panel, because losing the picture is a bad way to find out
        you typed a semicolon wrong.
      </p>
    </div>
  </div>
</section>

<section class="shell narrow block">
  <h2>Signals are the part that's different</h2>
  <div class="prose">
    <p>
      A shader with a clock in it is a screensaver. What makes it a visualizer is what you
      feed it, and in rox that's a pool of named signals shared by the whole app. You
      build them in a window of their own, under Application, next to the equalizer, and
      it carries a spectrum and a transport for the same reason the equalizer does: you
      pick a band by eye and ear against the thing you're actually playing.
    </p>
    <p>
      Five kinds of source. A <strong>band</strong> is the energy between two frequencies,
      which is the signal a swell rides. <strong>Level</strong> is the whole mix.
      An <strong>onset</strong> pulses when a band jumps past its own recent average, which
      is the signal a hit rides. A <strong>trigger</strong> pulses when a band crosses a
      line you drew, for material where the moving average never gets to drop and an onset
      goes quiet after the first bar. A <strong>total</strong> adds another signal up over
      time and wraps at one, so a shader can read it as a phase that advances while the
      music is loud and stalls while it isn't.
    </p>
    <p>
      Each one carries response smoothing and a gate. The gate is the setting that earns
      its place: a band riding room tone holds every knob attached to it slightly off its
      rest position forever, and a threshold with a curve above it hands over silence
      between the hits instead. The meter draws the ungated value with the threshold
      marked across it, since a bar that vanished under its own gate would be no help at
      all in placing the gate.
    </p>
    <p>
      A route attaches one signal to one parameter with an output span: this signal, this
      target, from here to there. Sixteen slots reach every shader, and the slots nothing
      is routed to get a plain slider on the settings page, so a look can be half
      performed and half set by hand.
    </p>
  </div>

  <div class="callout-wrap">
    <Callout label="Measured before the volume knob">
      <p>
        The tap the visuals read sits ahead of the output volume. Turning the music down
        used to make it look quieter than it is, and a signal tuned at one volume was
        wrong at another. The equalizer and ReplayGain still show, since those run
        upstream and are part of what you're hearing.
      </p>
    </Callout>
  </div>
</section>

<section class="block band">
  <div class="shell">
    <h2>Critters, as the argument</h2>
    <p class="prose wide-prose">
      One of the workspaces in the box is the whole player rendered as a 1-bit print: an
      ordered dither over every surface, tones crushing with the sub-bass, and a noise wall
      behind the panels that moves with the song. It's five signals and four shaders in a
      single file, and none of it is a special case in the app.
    </p>
    <Screenshot
      id="critters"
      alt="The Critters rox workspace: the entire window rendered in black-and-white ordered dither, with a curved shelf of album covers over a seek bar, transport row, waveform strip and track table, all sitting on a shifting field of noise."
      sizes="(min-width: 1180px) 1116px, (min-width: 48rem) calc(100vw - 4rem), calc(100vw - 2.5rem)"
    />
    <p class="prose wide-prose caption">
      Load it from the welcome window, then open the settings and take it apart.
      <a href="{base}/workspaces">The rest of them</a>.
    </p>
  </div>
</section>

<section class="shell narrow block">
  <h2>Running a stranger's shader</h2>
  <div class="prose">
    <p>
      Shaders travel inside workspace files, which means an imported look arrives carrying
      somebody else's code.
    </p>
    <p>
      Nothing runs until you say so. Each shader's source is fingerprinted, and the
      approved list is machine-local and only ever written by a direct action: you picked
      the file, you hit reload, you chose a preset, you pressed Approve. A look that
      arrived in a bundle sits there inert with a button under it until then. The examples
      that ship with rox are trusted by construction, because they're compiled into the
      binary.
    </p>
    <p>
      Turning one on opens a confirmation window that waits for an answer instead of
      counting down, and that window is never itself shaded. Whatever the shader does to
      the rest of the screen, the way back out stays readable.
    </p>
  </div>
</section>

<section class="block band">
  <div class="shell narrow">
    <h2>What isn't handled</h2>
    <ul class="limits">
      <li>
        Routes reach shader slots and the particles panel's knobs. Every other panel's
        settings are still knobs you set by hand.
      </li>
      <li>
        WGSL, not Milkdrop or AVS. There's no importer for either, and twenty years of
        presets don't come across.
      </li>
      <li>
        No MIDI or OSC control surface. The overlay pass and the panel passes are what
        exist, driven by the audio and the pointer.
      </li>
      <li>
        A full-window pass is a real GPU pass every frame. On a laptop on battery, that's
        a choice you're making.
      </li>
    </ul>
    <p class="aside">
      The distance between "I want the whole player to strobe on the kick" and having it is
      a band, a gate and a route, and none of the three needs a rebuild.
    </p>
  </div>
</section>

<section class="shell narrow block closer">
  <h2>Try it on your own library</h2>
  <p class="prose">
    Nothing here phones anywhere: the analysis is the audio already going through the
    player. More on
    <a href="{base}/workspaces">what a workspace carries</a>.
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

  .prose strong {
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
