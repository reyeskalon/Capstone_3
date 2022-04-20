<template>
  <main id="main">
    <Map />
    <features id="features"/>
    <featured-in />
  </main>
</template>

<script>
import FeaturedIn from '../components/FeaturedIn.vue'
import Features from '../components/Features.vue'
import Map from '../components/GoogleMap.vue'

export default {
  name: 'google-map',
  components: {
    Map,
    Features,
    FeaturedIn
  },
}
</script>

<style scoped>
  body {
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
	height: 100vh;
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
  #main {
    font-family: 'Duru Sans', sans-serif;
  }
  #features {
    border-top: black 2px solid;
    border-bottom: black 2px solid;
}
</style>