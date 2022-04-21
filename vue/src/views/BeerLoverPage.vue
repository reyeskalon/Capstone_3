<template>
    <div id="beerlover">
        <user-profile id="profile"/>
        <div id="favs">
            <beer id="favorited-beers" v-for="beer in LikedBeers" v-bind:key="beer.id" v-bind:beer="beer"/>
        </div>
    </div>
</template>

<script>
import UserProfile from '../components/UserProfile.vue';
import BeerService from '../services/BeerService.js'
import Beer from '../components/Beer.vue'
export default {
  components: { UserProfile, Beer },
  computed: {
        LikedBeers() {
            return this.$store.state.beers;
        },
    },
  created(){
      BeerService.SetLikedBeers(this.$store.state.user.userId).then(response => {
            this.$store.commit("SET_BEERS", response.data);
        })
  }
}
</script>

<style scoped>
    #favs{
        border: black solid 2px;
        border-radius: 5px;
        background-image: linear-gradient(135deg, rgba(128, 222, 253, 0.76), rgba(137, 43, 226, 0.753));
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        padding: 20px;
    }
    h1{
        padding: 10px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        
    }
    #allBrew {
        background-color: #be7118;
        border: black solid 2px;
        border-radius: 15px;
        margin: 5px;
    }
    #beer-lover{
        display: flex;
        flex-direction: column;
    }
    #profile{
        height: 200vh;
    }
    #favorited-beers{
        margin: 20px;
    }
</style>