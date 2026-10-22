<script lang="ts">
  /**
   * The ten-band equalizer on rox's own ISO octave centres and its 12 dB
   * ceiling. The curve is a gentle lift at both ends, which is what most
   * people's first preset looks like. Every band is a range input, so it
   * moves without a script; enhance.js keeps the readout above it honest.
   * The inputs are ordinary horizontal sliders turned on their side, since
   * a native vertical range still lays its thumb out differently per engine.
   */
  const BAND_HZ = [32, 64, 125, 250, 500, 1000, 2000, 4000, 8000, 16000]
  const GAIN_MAX = 12
  const GAINS = [3, 2, 0.5, -1, -2, -1, 1, 2.5, 3, 2]

  const label = (hz: number): string => (hz >= 1000 ? `${hz / 1000}k` : String(hz))
  const gain = (db: number): string => `${db > 0 ? '+' : ''}${db}`
  /** Slider position from the bottom, 0 to 1. */
  const pos = (db: number): number => (db + GAIN_MAX) / (2 * GAIN_MAX)

  const BANDS = BAND_HZ.map((hz, i) => ({
    hz,
    label: label(hz),
    db: GAINS[i],
    fill: `${(pos(GAINS[i]) * 100).toFixed(1)}%`,
  }))
</script>

<div class="eq">
  <div class="bar">
    <span>Equalizer</span>
    <span class="preset">Flat</span>
  </div>
  <div class="bands">
    <div class="scale" aria-hidden="true">
      <span>+{GAIN_MAX}</span>
      <span>0</span>
      <span>-{GAIN_MAX}</span>
    </div>
    {#each BANDS as band (band.hz)}
      <label class="band">
        <span class="db" data-out="band-{band.hz}">{gain(band.db)}</span>
        <span class="slider">
          <span class="zero"></span>
          <input
            class="rox-range"
            type="range"
            name="band-{band.hz}"
            min={-GAIN_MAX}
            max={GAIN_MAX}
            step="0.5"
            value={band.db}
            data-kind="db"
            data-var="--band-{band.hz}"
            style:--fill={band.fill}
            aria-label="{band.label} Hz"
          />
        </span>
        <span class="hz">{band.label}</span>
      </label>
    {/each}
  </div>
</div>

<style>
  .eq {
    background: var(--bg-panel);
    color: var(--text);
    line-height: 1;
  }

  .bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 1.875em;
    padding-inline: 0.75em;
    background: var(--bg-toolbar);
    border-bottom: var(--hairline) solid var(--border);
    font-size: 0.875em;
    color: var(--text-bright);
  }

  .preset {
    color: var(--text-secondary);
  }

  .bands {
    display: grid;
    grid-template-columns: 2em repeat(10, minmax(0, 1fr));
    gap: 0.25em;
    padding: 0.75em 0.75em 0.5em 0.5em;
  }

  .scale {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    /* Lines up with the slider's run: under the readout, over the label. */
    padding-block: 1.5em 1.625em;
    font-size: 0.625em;
    color: var(--text-faint);
    text-align: right;
  }

  .band {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5em;
  }

  .db,
  .hz {
    font-size: 0.6875em;
    font-variant-numeric: tabular-nums;
  }

  .db {
    color: var(--text-secondary);
  }

  .hz {
    color: var(--text-muted);
  }

  /* The run is 7em tall; the input is 7em wide and turned a quarter anti-
     clockwise about the box's centre, so its left end is the bottom. */
  .slider {
    --run: 7em;

    position: relative;
    width: 1.5em;
    height: var(--run);
  }

  .slider input {
    position: absolute;
    top: 50%;
    left: 50%;
    width: var(--run);
    transform: translate(-50%, -50%) rotate(-90deg);
  }

  .zero {
    position: absolute;
    top: 50%;
    left: 0;
    right: 0;
    height: var(--hairline);
    background: var(--gridline);
    opacity: 0.4;
  }
</style>
