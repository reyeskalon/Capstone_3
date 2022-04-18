<template>
    <div id="main">
        <div id="title-for-brewer">
        <h1>List Of Brewers</h1>
            <div id="brewers">
                <brewer v-for="brewer in AllBrewers" v-bind:key="brewer.id" v-bind:brewer="brewer"/>
            </div>
        </div>
        <request-brewer v-for="user in RequestBrewer" v-bind:key="user.id" v-bind:user="user"/>
            <div id="breweries">
                <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id" v-bind:b="brewery" class="brewery-card"/>
            </div>
        <edit-brewery />
        
        
    </div>
</template>

<script>
import Brewery from '../components/Brewery.vue';
import EditBrewery from '../components/EditBrewery.vue';
import BreweryService from '../services/BreweryService';
import UserService from '../services/UserService';
import RequestBrewer from '../components/RequestBrewer.vue';
import Brewer from '../components/Brewer.vue';

export default {
  components: { EditBrewery, Brewery, RequestBrewer, Brewer},
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
      },
      AllBrewers(){
          return this.$store.state.users.filter((user) =>{
                return user.role === 'brewer';
          })
      }
  }

}

</script>

<style scoped>
#main {
    padding: 10px;
    background-image: url("https://images.unsplash.com/photo-1546484396-fb3fc6f95f98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80");
}
#breweries {
    border: 1px solid;
    margin: 10px;
    background: white;
    border-radius: 15px;
}
#brewers {
    display: flex;
    flex-wrap: wrap;
    background-color:whitesmoke;
    border: 1px solid;
    border-radius: 15px;
    opacity: 85%;
}
#title-for-brewer {
    background-color:#7875AC;
    margin: 10px;
    padding: 10px;
    border-radius: 15px;
    border: black 1px solid;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
</style>