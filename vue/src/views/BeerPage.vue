<template>
    <div id="main">
        <beer-details v-bind:beerDetails="Beer"/>
        <beer-review v-for="review in Reviews" v-bind:key="review.userId" v-bind:review="review"/>
    </div>
</template>

<script>
import BeerService from '../services/BeerService.js'
import BeerDetails from '../components/BeerDetails.vue'
import BeerReview from '../components/BeerReview.vue'
import ReviewService from '../services/ReviewService.js'
export default {
  components: { BeerDetails, BeerReview },
  computed: {
        Beer() {
            return this.$store.state.beer;
        },
        Reviews(){
            return this.$store.state.reviewsByBeer;
        }
    },
  created(){
      BeerService.GetBeerById(this.$store.state.selectedBeer.beerId).then(response => {
            this.$store.commit("SET_BEER", response.data);
        }),
      ReviewService.GetReviewByBeerId(this.$store.state.selectedBeer.beerId).then(response => {
            this.$store.commit("SET_REVIEWS_BY_BEERID", response.data);
        });

  }
}
</script>

<style scoped>
    #main {
        background-color: #ffffff83;
        background-image: linear-gradient(135deg, #db740db7, #100ddbb7);
        height: 100%;
        padding-bottom: 10px;
    }
</style>