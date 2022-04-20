<template>
    <div class="beer-page">
        <beer-details v-bind:beerDetails="Beer"/>
    </div>
</template>

<script>
import BeerService from '../services/BeerService.js'
import BeerDetails from '../components/BeerDetails.vue'
export default {
  components: { BeerDetails },
  computed: {
        Beer() {
            return this.$store.state.beer;
        }
    },
  created(){
      BeerService.GetBeerById(this.$store.state.selectedBeer.beerId).then(response => {
            this.$store.commit("SET_BEER", response.data);
        });

  }
}
</script>

<style scoped>
.beer-page {
    background-color: white;
    background-image: linear-gradient(135deg, rgba(128, 222, 253, 0.76), rgba(137, 43, 226, 0.753));
}
</style>