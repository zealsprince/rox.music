<script lang="ts">
  // The rox mark, path lifted verbatim from crates/rox/assets/app/rox-music.svg
  // with the nested Serif transforms flattened into the viewBox. Fill is
  // currentColor so it takes whatever role the surrounding text is using.
  interface Props {
    size?: string
  }

  const { size = '1.1em' }: Props = $props()
</script>

<!-- viewBox is the path's measured bounding box plus a 2-unit bleed, so the mark
     fills the box with no baked-in padding. It is taller than it is wide. -->
<svg
  height={size}
  viewBox="122 11.7 336 464.8"
  fill="none"
  xmlns="http://www.w3.org/2000/svg"
  aria-hidden="true"
  focusable="false"
>
  <path
    d="M257.04,474.529C122.391,341.297 61.981,140.351 211.128,59C210.725,59.398 186.275,141.334 216.699,154.869C240.286,131.53 265.432,114.675 294.001,131.714C318.245,131.714 372.072,52.549 370.363,13.718C399.153,42.205 552.677,168.191 361.83,355.767C361.177,356.409 277.04,454.74 257.04,474.529Z"
    fill="currentColor"
  />
</svg>

<style>
  svg {
    display: block;
    flex: none;
    width: auto;
    aspect-ratio: 336 / 464.8;
  }
</style>
