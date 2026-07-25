import adapter from '@sveltejs/adapter-static'
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte'

export default {
  preprocess: vitePreprocess(),
  kit: {
    adapter: adapter({
      pages: 'build',
      assets: 'build',
      // Every route is prerendered, so there is no SPA shell to fall back to.
      // 404.html lets Pages serve a real 404 instead of a 200 with an empty page.
      fallback: '404.html',
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
