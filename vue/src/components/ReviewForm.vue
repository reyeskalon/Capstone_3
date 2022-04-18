<template>
    <div id="main">
        <div id="form-container">
            <div id="review-container" class="container">
                <textarea name="review" id="review" cols="50" rows="10" v-model="reviewObject.reviewText"></textarea>
            </div>
            <div id="rating-container" class="container">
                <img class="beer-icon" v-for="n in reviewObject.rating" v-bind:key="'beer' + n" @click="OverrideRating(n)" src="../assets/pngs/BeerRatingIcon.png" alt="">
                <img class="beer-icon" id="empty-beer" v-for="n in emptyBeers" v-bind:key="'empty' + n" @click="AddToRating(n)" src="../assets/pngs/BeerRatingIconEmpty.png" alt="">
            </div>
            
        </div>
        <div>
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

        background: lightgray;
        border: 2px solid black;
        border-radius: 15px;
        margin: 15px;
    }
    .container{
        display: flex;
        justify-content: space-between;
        background: #7875AC;
        padding: 10px;
        width: 300px;
        border: 1px solid black;
        border-radius: 15px;
    }
    #review-container{
        margin-top: 10px;
        margin-left: 10px;
        margin-right: 10px;
    }
    #rating-container{
        margin: 10px;
    }
    .beer-icon{
        height: 40px;
        width: 40px;
    }
    template{
        display: flex;
        justify-content: center;
    }
    textarea{
        border: 1px solid black;
        border-radius: 15px;
        padding: 5px;
    }
    #empty-beer:hover {
        background-image: url("../assets/pngs/BeerRatingIcon.png");
    }
</style>