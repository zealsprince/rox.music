// Every page is prerendered to static HTML, and csr = false means SvelteKit
// emits no client bundle for them at all: no framework, no hydration, no
// per-route JS. The only script the browser gets is static/js/enhance.js.
//
// If a route ever needs real interactivity, flip csr on for that route alone
// rather than here.
export const prerender = true
export const csr = false
export const trailingSlash = 'never'
