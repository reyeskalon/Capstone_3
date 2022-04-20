<template>
    <div>
        <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id" v-bind:b="brewery"/>
    </div>
</template>

<script>
import Brewery from '../components/Brewery.vue'
import BreweryService from '../services/BreweryService'
export default {
    components: { Brewery },
    computed: {
        AllBreweries() {
            return this.$store.state.breweries;
        }
    },
    created(){
        BreweryService.GetAllBeers().then(response => {
          this.$store.commit("SET_ALL_BREWERIES", response.data);
        });
    }
}
</script>

<style scoped>

</style>