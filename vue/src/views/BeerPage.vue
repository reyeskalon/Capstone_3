<template>
    <div>
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
      BeerService.GetBeerById(27).then(response => {
            this.$store.commit("SET_BEER", response.data);
        });

  }
}
</script>

<style scoped>

</style>