<template>
    <div>
        <div id="all-beers" v-if="isReady">
            <beer id="beer-cards" v-for="beer in AllBeers" v-bind:key="beer.id" v-bind:beer="beer"/>
        </div>
    </div>
</template>

<script>
import Beer from '../components/Beer.vue'
import BeerService from '../services/BeerService'
import FavoriteService from '../services/FavoriteService'
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
        FavoriteService.ListOfFavs(this.$store.state.user.userId).then(response => {
            this.$store.commit("SET_FAVS_BY_USER", response.data);
            this.isReady = true;
        });
    },
    data(){
        return{
            isReady: false
        }
    }
}
</script>

<style scoped>
    #all-beers{
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        background: linear-gradient(90deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
        background-size: 400% 400%;
        animation: gradient 15s ease infinite;
    }
    @keyframes gradient {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}
    #beer-cards{
        margin: 20px;
    }
</style>