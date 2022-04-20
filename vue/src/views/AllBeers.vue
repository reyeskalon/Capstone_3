<template>
    <div>
        <div id="allBrew">
            <beer v-for="beer in AllBeers" v-bind:key="beer.id" v-bind:beer="beer"/>
        </div>
    </div>
</template>

<script>
import Beer from '../components/Beer.vue'
import BeerService from '../services/BeerService'
export default {
    components: { Beer },
    computed: {
        AllBeers() {
            return this.$store.state.allBeers;
        }
    },
    created(){
        BeerService.GetAllBeers().then(response => {
          this.$store.commit("SET_ALL_BEERS", response.data);
        });
    }
}
</script>

<style scoped>

</style>