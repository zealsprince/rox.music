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
  const primary = document.querySelector<HTMLAnchorElement>('[data-download-primary]')
  const asset = document.querySelector<HTMLAnchorElement>(
    `[data-download-asset="${platform}"]`,
  )
  if (primary && asset) {
    primary.href = asset.href
    const label = primary.querySelector<HTMLElement>('[data-download-label]')
    const name = asset.dataset.platformLabel
    if (label && name)
      label.textContent = `Download for ${name}`
  }
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
  markPlatform()
}

main()
