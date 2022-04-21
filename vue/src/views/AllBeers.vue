<template>
    <div>
        <div id="all-beers">
            <beer id="beer-cards" v-for="beer in AllBeers" v-bind:key="beer.id" v-bind:beer="beer"/>
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
    #all-beers{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        background-color: white;
        background-image: linear-gradient(to right,pink, cornflowerblue);
    }
    #beer-cards{
        margin: 20px;
    }
</style>