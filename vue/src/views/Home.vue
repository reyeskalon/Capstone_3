<template>
  <main id="main">
    <GmapMap></GmapMap>
    <features id="features"/>
    <featured-in />
  </main>
</template>

<script>
import FeaturedIn from '../components/FeaturedIn.vue'
import Features from '../components/Features.vue'
import GmapMap from '../components/GoogleMap.vue'
import BreweryService from '../services/BreweryService'

export default {
  name: 'google-map',
  components: {
    GmapMap,
    Features,
    FeaturedIn
  },
  created(){
    BreweryService.GetBreweries().then(response => {
            this.$store.commit("SET_BREWERIES", response.data);
    });
  }
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