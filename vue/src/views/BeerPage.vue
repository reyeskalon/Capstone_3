<template>
    <div>
        <beer v-for="beer in Beers" v-bind:key="beer.id" v-bind:beer="beer"/>
    </div>
</template>

<script>
import Beer from '../components/Beer.vue'
import BeerService from '../services/BeerService.js'
export default {
  components: { Beer },
  computed: {
        Beers() {
            return this.$store.state.beers;
        }
    },
  created(){
      BeerService.SetLikedBeers(this.$store.state.user.userId).then(response => {
            this.$store.commit("SET_BEERS", response.data);
        });
  }
}
</script>

<style scoped>

</style>