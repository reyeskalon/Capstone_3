<template>
    <div id="rating-card">
            <img id="beer-icon" v-for="n in review.rating" v-bind:key="'review' + n"  src="../assets/pngs/BeerRatingIcon.png" alt="">      
        <p id="review-text">{{review.reviewText}}</p>
    </div>
    
</template>

<script>

export default {
    props: ['review'],
   
      
    }
</script>

<style scoped>
    #rating-card {
        background-color: black;
        color: white;
        padding: 10px;
        border-radius: 5px;
        margin: 10px;
        box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.473);
    }
    #rating-card:last-child{
        margin-bottom: 0;
        
    }
    #beer-icon{
        height: 25px;
    }
    #review-text{
        background-color: #fff;
        color: black;
        padding: 10px;
        border-radius: 5px;
    }
</style>