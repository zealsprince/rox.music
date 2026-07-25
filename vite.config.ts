import { sveltekit } from '@sveltejs/kit/vite'
import { defineConfig } from 'vite'

export default defineConfig({
  plugins: [sveltekit()],
  build: {
    // The site ships almost no JS. Inlining anything under 4k saves requests
    // on the handful of small assets that do get imported.
    assetsInlineLimit: 4096,
  },
})
