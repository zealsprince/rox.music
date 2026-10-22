<script lang="ts">
  import { Volume2 } from '@lucide/svelte'

  /**
   * The bottom of the Default window: the seek and volume row, then the
   * spectrum and waveform panels, each on the shared 3px bar and 2px gap
   * rhythm. Shapes are drawn once here at prerender from a fixed seed, so
   * every build and every locale gets the same picture.
   *
   * The seek strip and the volume are real range inputs. The panel's played
   * share lives in one custom property, --progress, which the waveform's
   * unplayed shade and both playheads read, so moving the slider moves all of
   * them; enhance.js keeps the property and the clocks in step.
   *
   * The spectrum moves in CSS alone, on a drum kit's worth of rhythm: the
   * bass pumps on every beat, the mids snap on the backbeat with a small hit
   * in between, the top flickers at twice the beat like hats, and every cap
   * jumps to its bar's hit and falls until the next. The volume slider scales
   * the whole picture and each equalizer band scales the bars in its octave,
   * through custom properties the sliders set on the frame around them.
   */
  interface Props {
    /** How far through the track, 0 to 1. */
    progress?: number
    /** Track length in seconds, for the clocks. */
    duration?: number
    volume?: number
  }

  const { progress = 0.57, duration = 124, volume = 0.75 }: Props = $props()

  const BARS = 92
  const BEAT = 0.52
  const LO = 30
  const HI = 16000
  const EQ_HZ = [32, 64, 125, 250, 500, 1000, 2000, 4000, 8000, 16000]

  /** A small LCG, so the picture is fixed rather than fresh per build. */
  function rng(seed: number): () => number {
    let s = seed >>> 0
    return () => {
      s = (Math.imul(s, 1664525) + 1013904223) >>> 0
      return s / 2 ** 32
    }
  }

  const clamp = (v: number, lo: number, hi: number): number => Math.min(hi, Math.max(lo, v))

  function clock(secs: number): string {
    const whole = Math.max(0, Math.round(secs))
    return `${Math.floor(whole / 60)}:${String(whole % 60).padStart(2, '0')}`
  }

  // Spectrum. A log-spaced analyser on a chord is a comb: spikes where the
  // harmonics of each note land, deep valleys between, all on a floor that
  // falls off with frequency. Two notes a fifth apart, their harmonics laid
  // on the floor, then independent noise per bar so no two neighbours agree.
  const spectrumRandom = rng(7)
  const bin = (hz: number): number => (Math.log(hz / LO) / Math.log(HI / LO)) * BARS
  const harmonics: number[] = Array.from({ length: BARS }, () => 0)
  for (const [f0, weight] of [[98, 0.5], [146.8, 0.36]] as const) {
    for (let k = 1; k <= 28; k++) {
      const at = bin(f0 * k)
      if (at >= BARS)
        break
      const i = Math.round(at)
      const boost = (weight / Math.sqrt(k)) * (0.7 + spectrumRandom() * 0.6)
      harmonics[i] = Math.max(harmonics[i], boost)
      if (i > 0)
        harmonics[i - 1] = Math.max(harmonics[i - 1], boost * 0.35)
      if (i < BARS - 1)
        harmonics[i + 1] = Math.max(harmonics[i + 1], boost * 0.35)
    }
  }

  const SPECTRUM = Array.from({ length: BARS }, (_, i) => {
    const x = i / BARS
    const floor = 0.5 * Math.exp(-((x / 0.5) ** 2)) + 0.24 * (1 - x) + 0.1
    const noise = 0.45 + spectrumRandom() * 0.55
    const level = clamp(floor * noise + harmonics[i], 0.03, 0.95)

    // Which drum this band follows, and how far it swings: a different
    // amount per bar, so the row never pumps as one block.
    const hz = LO * (HI / LO) ** x
    const drum = hz < 160 ? 'kick' : hz < 5000 ? 'snare' : 'hat'
    const base = drum === 'kick' ? 0.16 : drum === 'snare' ? 0.18 : 0.26
    const swing = base * (0.5 + spectrumRandom())
    const hit = clamp(level * (1 + swing), 0.04, 1)
    const low = clamp(level * (1 - swing * (0.7 + spectrumRandom() * 0.6)), 0.03, 1)
    const cycle = drum === 'kick' ? BEAT : drum === 'snare' ? BEAT * 2 : BEAT / 2
    // The kick and snare land nearly together with a little scatter; hats
    // scatter over their whole cycle, which is what makes them shimmer.
    const phase = drum === 'hat' ? -spectrumRandom() * cycle : -spectrumRandom() * 0.07

    // The equalizer band this bar sits in, by nearest octave centre.
    const band = EQ_HZ.reduce((best, b) => (Math.abs(Math.log(hz / b)) < Math.abs(Math.log(hz / best)) ? b : best))
    return {
      drum,
      band,
      hit,
      low,
      cap: clamp(hit + 0.02, 0, 1),
      capLow: clamp(hit - 0.06, 0, 1),
      cycle: cycle.toFixed(2),
      phase: phase.toFixed(2),
    }
  })

  /** Octave marks between the panel's 30 Hz and 16 kHz, as rox labels them. */
  const OCTAVES = Array.from({ length: 9 }, (_, i) => {
    const hz = 32.703 * 2 ** i
    return { label: `C${i + 1}`, at: Math.log(hz / LO) / Math.log(HI / LO) }
  })

  // Waveform: a song's sections as plateaus of loudness, a quiet intro, a
  // verse, a chorus that fills the envelope, a drop, a last chorus, an outro,
  // with bar-to-bar jitter inside each and the odd transient over the top.
  // Each bar is the peak and, inside it, the RMS band, which is what the
  // panel's loudness option draws.
  const SECTIONS: [number, number][] = [
    [0, 0.22],
    [0.07, 0.58],
    [0.3, 0.9],
    [0.5, 0.48],
    [0.62, 0.96],
    [0.88, 0.35],
  ]
  const waveRandom = rng(11)
  const WAVEFORM = Array.from({ length: BARS }, (_, i) => {
    const x = i / BARS
    const section = SECTIONS.findLast(([start]) => x >= start)!
    const index = SECTIONS.indexOf(section)
    const next = SECTIONS[index + 1]
    const toNext = next ? clamp((x - (next[0] - 2 / BARS)) / (2 / BARS), 0, 1) : 0
    const level = section[1] + (next ? (next[1] - section[1]) * toNext : 0)
    const fade = index === 0 ? clamp(i / 5, 0.25, 1) : 1
    const jitter = 0.78 + waveRandom() * 0.22
    const transient = waveRandom() < 0.07 ? 1.18 : 1
    const peak = clamp(level * fade * jitter * transient, 0.04, 1)
    return { peak, rms: peak * (0.5 + waveRandom() * 0.18) }
  })

  const pct = (v: number): string => `${(v * 100).toFixed(1)}%`
  const SEEK_STEPS = 1000
</script>

<!-- The drawn position is a fallback only: the sliders write --progress on
     the frame around the panel, and an inline value here would shadow it. -->
<div class="playback" style:--progress-drawn={pct(progress)}>
  <div class="row">
    <label class="seek">
      <span class="clock" data-out="elapsed">{clock(progress * duration)}</span>
      <input
        class="rox-range seek"
        type="range"
        min="0"
        max={SEEK_STEPS}
        value={Math.round(progress * SEEK_STEPS)}
        data-kind="seek"
        data-var="--progress"
        data-duration={duration}
        style:--fill={pct(progress)}
        style:--track="color-mix(in srgb, var(--accent) 35%, var(--bg-control))"
        aria-label="Seek"
      />
      <span class="clock" data-out="ending">-{clock(duration - progress * duration)}</span>
    </label>
    <label class="volume">
      <span class="glyph"><Volume2 size="1em" strokeWidth={2} /></span>
      <input
        class="rox-range"
        type="range"
        name="volume"
        min="0"
        max="100"
        value={Math.round(volume * 100)}
        data-kind="percent"
        data-var="--volume"
        style:--fill={pct(volume)}
        aria-label="Volume"
      />
      <span class="percent" data-out="volume">{Math.round(volume * 100)}%</span>
    </label>
  </div>

  <div class="spectrum">
    {#each OCTAVES as octave (octave.label)}
      <span class="octave" style:left={pct(octave.at)}>{octave.label}</span>
    {/each}
    <div class="bars">
      {#each SPECTRUM as bar, i (i)}
        <span
          class="bar {bar.drum}"
          style:--hit={pct(1 - bar.hit)}
          style:--low={pct(1 - bar.low)}
          style:--gain="var(--band-{bar.band}-value, 0)"
          style:animation-duration="{bar.cycle}s"
          style:animation-delay="{bar.phase}s"
        ></span>
      {/each}
    </div>
    <div class="holds">
      {#each SPECTRUM as bar, i (i)}
        <span
          class="hold {bar.drum}"
          style:--cap={pct(bar.cap)}
          style:--cap-low={pct(bar.capLow)}
          style:--gain="var(--band-{bar.band}-value, 0)"
          style:animation-duration="{bar.cycle}s"
          style:animation-delay="{bar.phase}s"
        ></span>
      {/each}
    </div>
  </div>

  <div class="waveform" data-waveform>
    {#each WAVEFORM as bar, i (i)}
      <span class="wave" style:height={pct(bar.peak)}>
        <span class="rms" style:height={pct(bar.rms / bar.peak)}></span>
      </span>
    {/each}
    <span class="unplayed"></span>
    <span class="playhead"></span>
  </div>
</div>

<style>
  .playback {
    display: flex;
    flex-direction: column;
    gap: var(--hairline);
    background: var(--border);
    color: var(--text);
    line-height: 1;
  }

  .playback > * {
    background: var(--bg-panel);
  }

  .row {
    display: flex;
    gap: var(--hairline);
    background: var(--border);
    height: 2.5em;
  }

  .seek,
  .volume {
    display: flex;
    align-items: center;
    gap: 0.75em;
    padding-inline: 0.75em;
    background: var(--bg-panel);
  }

  .seek {
    flex: 1;
    min-width: 0;
  }

  .volume {
    flex: none;
    width: 9.5em;
    color: var(--text-secondary);
  }

  /* A box of its own, since a bare svg in a flex row shrinks under the
     page's global svg rule. */
  .glyph {
    display: inline-flex;
    flex: none;
    width: 1.125em;
    height: 1.125em;
    align-items: center;
    justify-content: center;
  }

  .glyph :global(svg) {
    width: 100%;
    height: 100%;
  }

  .clock,
  .percent {
    flex: none;
    min-width: 2.4em;
    font-size: 0.8125em;
    font-variant-numeric: tabular-nums;
  }

  .clock:last-child,
  .percent {
    text-align: right;
  }

  .spectrum,
  .waveform {
    position: relative;
    overflow: hidden;
  }

  .spectrum {
    height: var(--spectrum-h, 6em);
  }

  /* The octave marks: a label and a faint rule at each C, on the panel's
     gridline at the alpha rox paints it with. */
  .octave {
    position: absolute;
    bottom: 0.25em;
    padding-left: 0.25em;
    border-left: var(--hairline) solid color-mix(in srgb, var(--gridline) 16%, transparent);
    font-size: 0.625em;
    color: var(--text-faint);
  }

  /* The whole picture scales with the volume slider, from the floor, with
     the slider's starting 75% as the drawn size. */
  .bars,
  .holds {
    position: absolute;
    inset: 0.5em 0.5em 1.125em;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    transform: scaleY(calc(var(--volume-share, 0.75) / 0.75));
    transform-origin: bottom;
  }

  /* And each bar scales with its own equalizer band: 12 dB either way is
     sixty percent taller or shorter, which is what a boost looks like on a
     meter rather than what it measures. */
  .bar,
  .hold {
    width: 0.1875em;
    flex: none;
    transform: scaleY(calc(1 + var(--gain, 0) / 20));
    transform-origin: bottom;
  }

  /* A full-height bar in 3px blocks on 1px gaps, cut from the top to its
     level. Clipping rather than scaling keeps the blocks square while it
     moves. Every drum rises fast and falls slow, the way a meter does. */
  .bar {
    height: 100%;
    background: repeating-linear-gradient(
      to top,
      var(--text-faint) 0 0.1875em,
      transparent 0.1875em 0.25em
    );
    clip-path: inset(var(--low) 0 0 0);
    animation: kick ease-out infinite;
  }

  .bar.snare {
    animation-name: snare;
  }

  .bar.hat {
    animation-name: hat;
  }

  @keyframes kick {
    0% {
      clip-path: inset(var(--low) 0 0 0);
    }

    12% {
      clip-path: inset(var(--hit) 0 0 0);
    }

    100% {
      clip-path: inset(var(--low) 0 0 0);
    }
  }

  /* Two beats long: a small hit on the one, the full hit on the two. */
  @keyframes snare {
    0% {
      clip-path: inset(var(--low) 0 0 0);
    }

    6% {
      clip-path: inset(calc(var(--low) * 0.6 + var(--hit) * 0.4) 0 0 0);
    }

    45% {
      clip-path: inset(var(--low) 0 0 0);
    }

    50% {
      clip-path: inset(var(--low) 0 0 0);
    }

    56% {
      clip-path: inset(var(--hit) 0 0 0);
    }

    100% {
      clip-path: inset(var(--low) 0 0 0);
    }
  }

  @keyframes hat {
    0% {
      clip-path: inset(var(--low) 0 0 0);
    }

    25% {
      clip-path: inset(var(--hit) 0 0 0);
    }

    100% {
      clip-path: inset(var(--low) 0 0 0);
    }
  }

  .holds {
    pointer-events: none;
  }

  .hold {
    position: relative;
    height: 100%;
  }

  /* The peak cap: thrown to the hit, then let fall until the next one. Same
     timing as its bar's drum. */
  .hold::after {
    content: '';
    position: absolute;
    left: 0;
    right: 0;
    bottom: var(--cap);
    height: 0.1875em;
    background: var(--accent);
    animation: cap-kick linear infinite;
    animation-duration: inherit;
    animation-delay: inherit;
  }

  .hold.snare::after {
    animation-name: cap-snare;
  }

  .hold.hat::after {
    animation-name: cap-hat;
  }

  @keyframes cap-kick {
    0% {
      bottom: var(--cap-low);
    }

    12% {
      bottom: var(--cap);
    }

    40% {
      bottom: var(--cap);
    }

    100% {
      bottom: var(--cap-low);
    }
  }

  @keyframes cap-snare {
    0% {
      bottom: var(--cap-low);
    }

    6% {
      bottom: calc(var(--cap-low) * 0.6 + var(--cap) * 0.4);
    }

    45% {
      bottom: var(--cap-low);
    }

    56% {
      bottom: var(--cap);
    }

    75% {
      bottom: var(--cap);
    }

    100% {
      bottom: var(--cap-low);
    }
  }

  @keyframes cap-hat {
    0% {
      bottom: var(--cap-low);
    }

    25% {
      bottom: var(--cap);
    }

    60% {
      bottom: var(--cap);
    }

    100% {
      bottom: var(--cap-low);
    }
  }

  .waveform {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: var(--waveform-h, 5.5em);
    padding-inline: 0.5em;
    cursor: pointer;
    user-select: none;
  }

  /* The Default look: amber bars with the loudness band a shade apart
     inside, and everything past the playhead sunk toward the panel by the
     shade laid over it. */
  .wave {
    position: relative;
    flex: none;
    width: 0.1875em;
    background: var(--accent);
  }

  .rms {
    position: absolute;
    left: 0;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    background: color-mix(in srgb, var(--accent) 72%, var(--bg-panel));
  }

  .unplayed {
    position: absolute;
    top: 0;
    bottom: 0;
    left: var(--progress, var(--progress-drawn));
    right: 0;
    background: color-mix(in srgb, var(--bg-panel) 60%, transparent);
    pointer-events: none;
  }

  .playhead {
    position: absolute;
    top: 0;
    bottom: 0;
    left: var(--progress, var(--progress-drawn));
    width: 0.125em;
    transform: translateX(-50%);
    background: var(--text-bright);
    pointer-events: none;
  }
</style>
