import adapter from '@sveltejs/adapter-static'
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte'

export default {
  preprocess: vitePreprocess(),
  kit: {
    adapter: adapter({
      pages: 'build',
      assets: 'build',
      // No fallback on purpose. Every route is prerendered, so there is no SPA
      // shell worth writing, and `fallback: '404.html'` actively hurt: it wrote
      // an empty app shell that csr = false never fills in, so every 404 was a
      // blank untitled page. src/routes/404 prerenders to build/404.html
      // instead, which is the file GitHub Pages serves for unmatched paths.
      strict: true,
    }),
    paths: {
      // The site lives at the apex, so absolute asset paths are correct and
      // survive Pages serving /download either with or without a trailing slash.
      relative: false,
    },
    alias: {
      $components: 'src/components',
      $data: 'src/data',
      $types: 'src/types',
    },
  },
}
