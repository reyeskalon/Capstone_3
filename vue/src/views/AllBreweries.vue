<template>
<div>
    <div id="all-beers">
        <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id" v-bind:b="brewery"/>
    </div>
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
        BreweryService.GetBreweries().then(response => {
          this.$store.commit("SET_BREWERIES", response.data);
        });
    }
}
</script>

<style scoped>
    #all-beers{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        background-color: white;
        background-image: linear-gradient(to right,pink, cornflowerblue);
        padding: 20px;
    }

</style>