// The site's entire client runtime. Pages are prerendered with csr = false, so
// no Svelte reaches the browser and this is the only script that does: theme
// toggling and picking the download that matches the visitor's OS.
//
// Bundled by scripts/build-enhance.ts to static/js/enhance.js and loaded with
// defer. Everything here is an enhancement, so the pages are complete and
// usable with it blocked.

type Theme = 'dark' | 'light'
type PlatformId = 'linux' | 'macos' | 'windows'

const STORAGE_KEY = 'rox-theme'

function currentTheme(): Theme {
  return document.documentElement.classList.contains('dark') ? 'dark' : 'light'
}

/**
 * Screenshots with a light variant pick it through a `prefers-color-scheme`
 * media query, which is right at first paint but deaf to the manual toggle.
 * Forcing the media attribute to `all` or `not all` makes the browser
 * re-evaluate and swap the image without a reload.
 */
function applyThemeToImages(theme: Theme): void {
  const sources = document.querySelectorAll<HTMLSourceElement>('source[data-light]')
  for (const source of sources)
    source.media = theme === 'light' ? 'all' : 'not all'
}

/**
 * A themed image only ever downloads the half matching the current theme, so
 * the toggle points every one of them at a file the browser has never seen and
 * they blink in one after another. Once the page is loaded and idle, pull the
 * other half into cache so the swap is instant.
 *
 * Each warm is a clone of the real <picture> with its media queries inverted,
 * so the browser negotiates format and width exactly the way it would for the
 * live one instead of us reconstructing a URL and guessing at avif support.
 * They run one at a time: this is background work and has no business
 * competing with anything the visitor asked for.
 *
 * Clones rather than an IntersectionObserver on the real ones because the
 * workspaces page is a CSS radio-tab switcher. Its unselected panels have no
 * layout box, so they would never intersect and never warm.
 */
function warmOffThemeImages(): void {
  const queue = [...document.querySelectorAll<HTMLElement>('picture')]
    .filter(picture => picture.querySelector('source[data-light]'))
  if (!queue.length)
    return

  // Rendered, so the clones actually fetch, but a pixel across and invisible.
  const attic = document.createElement('div')
  attic.setAttribute('aria-hidden', 'true')
  attic.style.cssText
    = 'position:fixed;left:0;top:0;width:1px;height:1px;overflow:hidden;opacity:0;pointer-events:none'
  document.body.append(attic)

  // Read once up front. A toggle part way through would otherwise turn the rest
  // of the queue around to fetch the half that is now on screen and already in
  // cache, leaving the half we were warming for still missing.
  const wantLight = currentTheme() === 'dark'

  const next = (): void => {
    const picture = queue.shift()
    if (!picture) {
      attic.remove()
      return
    }

    const clone = picture.cloneNode(true) as HTMLElement
    for (const source of clone.querySelectorAll<HTMLSourceElement>('source[data-light]'))
      source.media = wantLight ? 'all' : 'not all'

    const img = clone.querySelector('img')
    if (!img) {
      next()
      return
    }

    // The clone exists to fill a cache, not to be content: no lazy gate holding
    // it back, no priority taken from anything real, and no second copy of the
    // alt text for a screen reader to walk into.
    img.loading = 'eager'
    img.removeAttribute('fetchpriority')
    img.alt = ''
    img.addEventListener('load', next, { once: true })
    img.addEventListener('error', next, { once: true })
    attic.append(clone)
  }

  next()
}

/** Runs work after the page has settled, so warming never delays first paint. */
function whenIdle(run: () => void): void {
  const start = (): void => {
    if ('requestIdleCallback' in window)
      requestIdleCallback(() => run(), { timeout: 3000 })
    else
      setTimeout(run, 500)
  }

  if (document.readyState === 'complete')
    start()
  else
    window.addEventListener('load', start, { once: true })
}

function applyTheme(theme: Theme): void {
  const root = document.documentElement
  root.classList.toggle('dark', theme === 'dark')
  root.classList.toggle('light', theme === 'light')
  applyThemeToImages(theme)
  try {
    localStorage.setItem(STORAGE_KEY, theme)
  }
  catch {
    // Storage blocked in private mode. The toggle still works for this page
    // view, it just will not survive a reload.
  }
}

function wireThemeToggle(): void {
  const buttons = document.querySelectorAll<HTMLButtonElement>('.theme-toggle')
  for (const button of buttons) {
    button.addEventListener('click', () => {
      applyTheme(currentTheme() === 'dark' ? 'light' : 'dark')
    })
  }
}

/**
 * Best guess at the visitor's OS from the UA. Only used to promote one download
 * card that is already on the page, so a wrong guess costs a scroll and never
 * hides anything.
 */
function detectPlatform(): PlatformId | null {
  const ua = navigator.userAgent
  // Order matters. Android carries "Linux" and iPadOS carries "Mac OS X", and
  // neither should match a desktop build.
  if (/Android|iPhone|iPad|iPod/i.test(ua))
    return null
  if (/Win/i.test(ua))
    return 'windows'
  if (/Mac/i.test(ua))
    return 'macos'
  if (/Linux|X11|CrOS/i.test(ua))
    return 'linux'
  return null
}

function markPlatform(): void {
  const platform = detectPlatform()
  if (!platform)
    return

  document.documentElement.dataset.platform = platform

  // The hero's primary button is a generic "Download" link until we know
  // better. Swap its href and label for the matching asset.
  //
  // The label comes off the button as a whole sentence with `%s` where the
  // platform name goes, because this script has no idea what language the page
  // it landed on is in. Building it here out of a word and a name would work in
  // English and put the pieces in the wrong order everywhere else.
  const primary = document.querySelector<HTMLAnchorElement>('[data-download-primary]')
  const asset = document.querySelector<HTMLAnchorElement>(
    `[data-download-asset="${platform}"]`,
  )
  if (primary && asset) {
    primary.href = asset.href
    const label = primary.querySelector<HTMLElement>('[data-download-label]')
    const name = asset.dataset.platformLabel
    const template = primary.dataset.downloadTemplate
    if (label && name && template)
      label.textContent = template.replace('%s', name)
  }
}

/** Seconds as the seek panel's clock: m:ss. */
function clock(secs: number): string {
  const whole = Math.max(0, Math.round(secs))
  return `${Math.floor(whole / 60)}:${String(whole % 60).padStart(2, '0')}`
}

/**
 * The home page's drawn panels take input: the seek strip, the volume, the
 * equalizer bands. Each slider is a real range input, so it already moves
 * with no script. This keeps the rest of the panel honest about it: the fill
 * behind the knob, the clocks and readouts, and the waveform's played share,
 * which the markup reads off one custom property on the panel.
 */
function wireSliders(): void {
  const sliders = document.querySelectorAll<HTMLInputElement>('input.rox-range')

  const apply = (input: HTMLInputElement): void => {
    const min = Number(input.min || 0)
    const max = Number(input.max || 100)
    const value = Number(input.value)
    const share = (value - min) / (max - min)
    input.style.setProperty('--fill', `${share * 100}%`)

    const panel = input.closest<HTMLElement>('[data-live]')
    if (!panel)
      return
    // Three spellings of one value, since CSS can't convert between them: the
    // percentage for positions, the share for scale factors, the raw value
    // for anything in the slider's own unit.
    if (input.dataset.var) {
      panel.style.setProperty(input.dataset.var, `${share * 100}%`)
      panel.style.setProperty(`${input.dataset.var}-share`, String(share))
      panel.style.setProperty(`${input.dataset.var}-value`, String(value))
    }

    // What the panel prints next to the slider, by what the slider is.
    const out = (name: string, text: string): void => {
      const target = panel.querySelector<HTMLElement>(`[data-out="${name}"]`)
      if (target)
        target.textContent = text
    }
    switch (input.dataset.kind) {
      case 'seek': {
        const duration = Number(input.dataset.duration || 0)
        out('elapsed', clock(share * duration))
        out('ending', `-${clock(duration - share * duration)}`)
        break
      }

      case 'percent':
        out(input.name, `${Math.round(value)}%`)
        break

      case 'db':
        out(input.name, `${value > 0 ? '+' : ''}${value}`)
        break
    }
  }

  for (const input of sliders)
    input.addEventListener('input', () => apply(input))

  // The waveform is a seek strip too: a press anywhere on it moves the seek
  // slider there, and the slider does the rest.
  for (const wave of document.querySelectorAll<HTMLElement>('[data-waveform]')) {
    wave.addEventListener('pointerdown', (event) => {
      const seek = wave.closest('[data-live]')?.querySelector<HTMLInputElement>('input[data-kind="seek"]')
      if (!seek)
        return
      const box = wave.getBoundingClientRect()
      const share = Math.min(1, Math.max(0, (event.clientX - box.left) / box.width))
      const min = Number(seek.min || 0)
      const max = Number(seek.max || 100)
      seek.value = String(min + share * (max - min))
      apply(seek)
    })
  }
}

/**
 * The workspaces page is a CSS radio-tab switcher, so a link into it can only
 * name a tab by its radio's id in the hash, and a hash on its own just scrolls
 * there. Checking the radio it names is what opens the tab.
 */
function openHashTab(): void {
  const id = location.hash.slice(1)
  if (!id)
    return

  const input = document.getElementById(id)
  if (input instanceof HTMLInputElement && input.type === 'radio')
    input.checked = true
}

function main(): void {
  // Gates the CSS that reveals JS-only controls, so nothing dead ever renders.
  document.documentElement.classList.add('js')

  // A stored preference that disagrees with the OS means the inline script
  // already set the right class while the images resolved against the wrong
  // media query. Re-point them once, at the cost of one refetch for the
  // minority who have overridden their OS.
  applyThemeToImages(currentTheme())

  wireThemeToggle()
  wireSliders()
  markPlatform()
  openHashTab()
  window.addEventListener('hashchange', openHashTab)
  whenIdle(warmOffThemeImages)
}

main()
