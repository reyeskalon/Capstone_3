<template>
  <main>
    <GmapMap></GmapMap>
  </main>
</template>

<script>
import GmapMap from '../components/GoogleMap.vue'

export default {
  name: 'google-map',
  components: {
    GmapMap
  }
}
</script>