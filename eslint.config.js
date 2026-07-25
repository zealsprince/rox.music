import { fileURLToPath } from 'node:url'
import antfu from '@antfu/eslint-config'
import { includeIgnoreFile } from '@eslint/compat'

const gitignorePath = fileURLToPath(new URL('./.gitignore', import.meta.url))

// antfu's own svelte and typescript support rather than hand-wiring
// eslint-plugin-svelte: the manual route never hands `<script lang="ts">` to the
// TypeScript parser, so every typed component fails to parse.
export default antfu(
  {
    svelte: true,
    typescript: true,
  },
  includeIgnoreFile(gitignorePath),
  {
    rules: {
      // The site is served from the apex of rox.music with no base path, so
      // internal hrefs are already resolved absolute paths. The rule is aimed
      // at apps deployed under a subpath, which this never is.
      'svelte/no-navigation-without-resolve': 'off',
      // Markup is HTML, and HTML attributes take double quotes. antfu's single
      // quote preference is right for the script block and wrong for the
      // template, which this separates.
      'svelte/html-quotes': ['error', { prefer: 'double' }],
    },
  },
)
