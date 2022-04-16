<template>
    <div>
        <request-brewer v-for="user in RequestBrewer" v-bind:key="user.id" v-bind:user="user"/>
        <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id" v-bind:b="brewery"/>
        <edit-brewery />
        
    </div>
</template>

<script>
import Brewery from '../components/Brewery.vue';
import EditBrewery from '../components/EditBrewery.vue';
import BreweryService from '../services/BreweryService';
import UserService from '../services/UserService';
import RequestBrewer from '../components/RequestBrewer.vue';

export default {
  components: { EditBrewery, Brewery, RequestBrewer},
  data() {
      return {

      }
  },
  created() {
    BreweryService.GetBreweries().then(response => {
              this.$store.commit("SET_BREWERIES", response.data);
          }),
    UserService.GetUsers().then(response => {
              this.$store.commit("SET_USERS", response.data);
          });
  },
  computed: {
      AllBreweries() {
          return this.$store.state.breweries
      },
      AllUsers(){
          return this.$store.state.users
      },
      RequestBrewer(){
          return this.$store.state.users.filter((user) =>{
              return user.requestBrewer;
          })
      }
  }

}

</script>

<style scoped>

</style>