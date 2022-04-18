<template>
    <div>
        <div id="favs">
            <h1>Favorite Beers</h1>
            <beer v-for="beer in LikedBeers" v-bind:key="beer.id" v-bind:beer="beer"/>
            
        </div>
        <beer v-for="beer in AllBeers" v-bind:key="beer.id" v-bind:beer="beer"/>
    </div>
</template>

<script>
import Beer from '../components/Beer.vue'
import BeerService from '../services/BeerService.js'
export default {
  components: { Beer },
  computed: {
        LikedBeers() {
            return this.$store.state.beers;
        },
        AllBeers() {
            return this.$store.state.allBeers;
        }
    },
  created(){
      BeerService.SetLikedBeers(this.$store.state.user.userId).then(response => {
            this.$store.commit("SET_BEERS", response.data);
        }),
      BeerService.GetAllBeers().then(response => {
          this.$store.commit("SET_ALL_BEERS", response.data);
      });
  }
}
</script>

<style scoped>
    #favs{
        background-color: #24C744;
        border: black solid 2px;
        border-radius: 15px;
        margin: 5px;
    }
    h1{
        padding: 10px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        
    }
</style>