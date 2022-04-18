<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<!-- googlemap api 
"https://maps.googleapis.com/maps/api/js?key=AIzaSyAFvxjkFmpMry87XMtoIS54kWPHqkrAyxg&callback=myMap"></script>
-->

<script>
export default {
};
</script>


<style>
/* Place holder for app view */
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  max-width: 800px;
  margin: 60px auto 0 auto;
}

#map {
  height: 90%;
  width: 400px;
}
</style>