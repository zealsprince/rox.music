<script lang="ts">
  // simple-icons dropped the Windows mark over trademark, so it lives here to
  // complete the platform trio. Drawn to match the package's conventions
  // exactly: 24x24 viewBox, currentColor fill, same prop names, so it drops into
  // PlatformIcon.svelte beside SiApple and SiLinux with no special casing.
  //
  // The four panes of the Windows 11 logo, a plain 2x2 grid.
  // Rest props so callers can pass aria-hidden, class, and friends, matching
  // the API the simple-icons components exposed.
  interface Props {
    color?: string
    size?: number
    title?: string
    [key: string]: unknown
  }

  const { color = 'currentColor', size = 24, title = 'Windows', ...rest }: Props = $props()
</script>

<svg
  xmlns="http://www.w3.org/2000/svg"
  width={size}
  height={size}
  fill={color}
  viewBox="0 0 24 24"
  {...rest}
>
  <title>{title}</title>
  <path
    d="M2 2h9.2v9.2H2V2Zm10.8 0H22v9.2h-9.2V2ZM2 12.8h9.2V22H2v-9.2Zm10.8 0H22V22h-9.2v-9.2Z"
  />
</svg>
