<template>
    <div id="wholethang">
        <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id" v-bind:b="brewery"/>
        <div id="forms">
            <edit-brewery />
            <edit-beer />
        </div>
        <beer v-for="beer in AllBeersByBrewery" v-bind:key="beer.id" v-bind:beer="beer"/>
    </div>
</template>

<script>
import Brewery from '../components/Brewery.vue';
import EditBrewery from '../components/EditBrewery.vue';
import BreweryService from '../services/BreweryService';
import BeerService from '../services/BeerService';
import Beer from '../components/Beer.vue'
import EditBeer from '../components/EditBeer.vue'
export default {
  components: { Brewery, EditBrewery, Beer, EditBeer },
  computed: {
        AllBreweries() {
            return this.$store.state.breweries;
        },
        AllBeersByBrewery(){
            return this.$store.state.beersByBrewer;
        }
    },
    created() {
    BreweryService.GetBreweriesByBrewer(this.$store.state.user.userId).then(response => {
            this.$store.commit("SET_BREWERIES", response.data);
        }),
    BeerService.GetBeersByBreweryId(1).then(response => {
        this.$store.commit("SET_BEERS_BY_BREWERY", response.data);
    });
    }
}
</script>

<style scoped>
    #wholethang {
        background-color: rgb(21, 14, 116);
        padding: 10px;
    }
    #forms {
        display: flex;
    }
</style>