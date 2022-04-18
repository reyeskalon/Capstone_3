<template>
    <div>
        <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id" v-bind:b="brewery"/>
        <edit-brewery />
    </div>
</template>

<script>
import Brewery from '../components/Brewery.vue';
import EditBrewery from '../components/EditBrewery.vue';
import BreweryService from '../services/BreweryService';
export default {
  components: { Brewery, EditBrewery },
  computed: {
        AllBreweries() {
            return this.$store.state.breweries;
        }
    },
    created() {
    BreweryService.GetBreweriesByBrewer(this.$store.state.user.userId).then(response => {
            this.$store.commit("SET_BREWERIES", response.data);
        });
    }
}
</script>

<style scoped>

</style>