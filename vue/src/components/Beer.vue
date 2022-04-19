<template>
    <div id="beer-card">
        <div id="beer-image" class="prop-wrapper">
            <img :src="beer.imgURL" alt="" id="beer-img"/>
        </div>
        <div id="beerType" class="beerType">
            <p>{{beer.beerType}}</p>
            <p>{{beer.name}}</p>
        </div>
        <div id="abv" class="beerAbv">
            <p>{{beer.abv}}%</p>
        </div>
        <div id="beerDescription" class="beer-description">
            <p>{{beer.description}}</p>
        </div>
        <div id="gluten-free-beer" v-show="beer.isGlutenFree" class="prop-wrapper">
            <img src="..\assets\pngs\GFBEER.png" alt="" id="gf-img" class="items">
        </div>
        <div>
            <button @click="ToggleForm(); SetBeer();" >Review</button>
        </div>
        <review-form v-show="showForm"/>
    </div>
    
</template>

<script>
import ReviewForm from './ReviewForm.vue'
import BeerService from '../services/BeerService'
export default {
  components: { ReviewForm },
    props: ['beer'],
    methods: {
        ToggleForm(){
            this.showForm = !this.showForm
        },
        SetBeer(){
            BeerService.GetBeerById(this.beer.beerId)
            .then(response => {
                this.$store.commit("SET_BEER", response.data)
            })
        }
    },
    data() {
        return {
            showForm: false
        }
    }
}
</script>


<style scoped>
#beer.name{
    height:50px;
    margin: none;
}
#beer.beerType{
    height:px;
    margin: none;
}
#beer-card {
    display: flex;
    border-radius: 5px;
    height: 100px;
    padding: 10px;
    margin:10px;
    background: #7875AC;
    border: black 1px solid;
    flex-direction: row;
    font-family: 'Gill Sans', 'Gill Sans MT', 'Trebuchet MS', sans-serif;
    column-gap: 20px;
    align-content: space-between;
    align-items: flex-end;
}
#beer-img {
    height: 80px;
    width: 80px;
    
}
#beer-image{
    display: flex;
    flex-direction: column;
}
.items {
    display: flex;
    align-items: flex-end;
    margin: 0;
}
.prop-wrapper {
    display: flex;
    align-items: flex-end;
}
.prop-wrapper:nth-child(1){
    align-items: flex-start;
}
#gf-img {
    height: 35px;
    display: flex;
    align-items: flex-end;
}
#abv {
display: flex;
flex-direction: column;
align-items: center;
height: 80px;
width: 80px;
}
#beerDescription {
display: flex;
flex-direction: column;
align-items: center;
}
</style>