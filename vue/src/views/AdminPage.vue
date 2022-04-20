<template>
    <div id="main">
        <div id="title-for-brewer">
        <h1>List Of Brewers</h1>
            <div id="brewers">
                <brewer v-for="brewer in AllBrewers" v-bind:key="brewer.id" v-bind:brewer="brewer"/>
            </div>
            
        </div>
        <div id="submit-forms">
                <edit-brewery />
                <edit-beer />
            </div> 
        <request-brewer v-for="user in RequestBrewer" v-bind:key="user.id" v-bind:user="user"/>
            <div id="breweries">
                <brewery v-for="brewery in AllBreweries" v-bind:key="brewery.id" v-bind:b="brewery" class="brewery-card"/>
            </div>

        
        
        
    </div>
</template>

<script>
import Brewery from '../components/Brewery.vue';
import EditBrewery from '../components/EditBrewery.vue';
import BreweryService from '../services/BreweryService';
import UserService from '../services/UserService';
import RequestBrewer from '../components/RequestBrewer.vue';
import Brewer from '../components/Brewer.vue';
import EditBeer from '../components/EditBeer.vue';

export default {
  components: { EditBrewery, Brewery, RequestBrewer, Brewer, EditBeer},
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
    background-color: black;
}
#breweries {
    border: 1px solid;
    margin: 10px;
    background: grey;
    border-radius: 15px;
}
#brewers {
    display: flex;
    flex-wrap: wrap;
    background-color:rgb(0, 0, 0);
    border: 1px solid;
    border-radius: 15px;
    
}
#title-for-brewer {
    background-color:#b3921e;
    margin: 10px;
    padding: 10px;
    border-radius: 15px;
    border: black 1px solid;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
#submit-forms {
    display: flex;
    background-color: #b3921e;
    border:black 1px solid;
    border-radius: 15px;
    margin: 10px;
}
</style>