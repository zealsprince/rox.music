import { sveltekit } from '@sveltejs/kit/vite'
import { defineConfig } from 'vite'

export default defineConfig({
  plugins: [sveltekit()],
  server: {
    // Pinned here rather than passed on the command line. `npm run dev` wraps
    // vite in concurrently, so a trailing `--port` lands on concurrently and
    // vite quietly picks whatever port is free instead.
    port: 5178,
  },
  build: {
    // The site ships almost no JS. Inlining anything under 4k saves requests
    // on the handful of small assets that do get imported.
    assetsInlineLimit: 4096,
  },
})
