<template>
    <div>
        <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id"/>
        <edit-brewery />
        <button @click="LogBreweries"></button>
    </div>
</template>

<script>
import Brewery from '../components/Brewery.vue';
import EditBrewery from '../components/EditBrewery.vue';
import BreweryService from '../services/BreweryService';

export default {
  components: { EditBrewery, Brewery },
  data() {
      return {

      }
  },
  computed: {
      AllBreweries() {
          return this.$store.breweries
      }
  },
  methods: {
      LogBreweries(){
          console.log(this.$store.breweries)
      }
  },
      created() {
      BreweryService.GetBreweries().then(response => {
              this.$store.commit("SET_BREWERIES", response.data);
          });
  }
}

</script>

<style scoped>

</style>