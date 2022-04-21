<template>
    <div class="beer-page">
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
.beer-page {
    background-color: white;
    background-image: linear-gradient(135deg, rgba(128, 222, 253, 0.76), rgba(137, 43, 226, 0.753));
}
</style>