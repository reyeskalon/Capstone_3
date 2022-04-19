<template>
  <main id="main">
    <Map />
    <features id="features"/>
    <featured-in />
  </main>
</template>

<script>
import FeaturedIn from '../components/FeaturedIn.vue'
import Features from '../components/Features.vue'
import Map from '../components/GoogleMap.vue'

export default {
  name: 'google-map',
  components: {
    Map,
    Features,
    FeaturedIn
  },
}
</script>

<style scoped>
  #main {
    font-family: 'Duru Sans', sans-serif;
  }
  #features {
    background: black;
    border: 2px solid black;
}
</style>