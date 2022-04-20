<template>
    <div id="main">
        <div id="form-container">
            <textarea placeholder="write your review here" name="review" id="review" cols="50" rows="10" v-model="reviewObject.reviewText"></textarea>
            <div id="rating-container" class="container">
                <img class="beer-icon" v-for="n in reviewObject.rating" v-bind:key="'beer' + n" @click="OverrideRating(n)" src="../assets/pngs/BeerRatingIcon.png" alt="">
                <img class="beer-icon" id="empty-beer" v-for="n in emptyBeers" v-bind:key="'empty' + n" @click="AddToRating(n)" src="../assets/pngs/BeerRatingIconEmpty.png" alt="">
            </div>
            <button id="submit-button" @click="SubmitReview">Submit</button>
        </div>
    </div>
</template>

<script>
import ReviewService from '../services/ReviewService.js';
export default {
    data() {
        return{
            reviewObject: {
                rating: 1,
                reviewText: "",
                beerId: this.$store.state.beer.beerId,
                userId: this.$store.state.user.userId
            },       
        }
    },
    methods: {
        SubmitReview() {
            this.reviewObject.beerId = this.$store.state.beer.beerId;
            ReviewService.SubmitReview(this.reviewObject)
            this.reviewObject = {
                rating: 1,
                reviewText: "",
                beerId: this.$store.state.beer.beerId,
                userId: this.$store.state.user.userId
            }
        },
        OverrideRating(num) {
            this.reviewObject.rating = num;
        },
        AddToRating(num) {
            this.reviewObject.rating = this.reviewObject.rating + num;
        }
    },
    computed: {
        emptyBeers(){
            return (5 - this.reviewObject.rating);
        }
    }
}
</script>

<style scoped>
    #main{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    #form-container{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;

        background:black;
        border: 2px solid white;
        border-radius: 5px;
        padding: 15px;
        width: 300px;
        height: 200px;
    }
    .container{
        display: flex;
        justify-content: space-between;
        background: black;
        width: 100%;
    }
    #review{
        background: white;
        width: 100%;
    }
    #rating-container{
        width: 100%;
    }
    .beer-icon{
        height: 40px;
        width: 40px;
    }
    button{
        width: 100%;
    }
</style>