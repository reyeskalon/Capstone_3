<template>
    <div id="main">
        <div id="beer-card">
            <img id="beer-image" :src="beer.imgURL" alt="">
            <div id="bottom">
                <div id="name-gf-icon">
                    <p id="beer-name" class="beer-props">{{beer.name}}</p>
                    <img id="gf-beer-icon" src="..\assets\pngs\GFBEER.png" alt="" v-show="beer.isGlutenFree">
                </div>
                <div id="type-abv">
                    <p id="beer-type" class="beer-props">{{beer.beerType}}</p>
                    <p id="beer-abv" class="beer-props">{{beer.abv}}%</p>
                </div>
                <div id="clickable-items">
                    <div class="clickable-divs">
                        <router-link id="view-details" v-bind:to="{ name: 'beerpage' }" v-on:click="changeStoreValueForSelectedBeer">
                            <p  class="clickable">Details</p>
                        </router-link>
                    </div>
                    <div class="clickable-divs">
                        <img id="favorite-icon" class="clickable" src="../assets/icons/heart-empty.png" alt="" v-on:click.prevent="FavoriteBeer">
                    </div>
                    <div class="clickable-divs">
                        <p  id="review" class="clickable" @click.prevent="ToggleForm(); SetBeer();">Review</p>
                    </div>
                    
                </div>
                <!-- <button id="update-button" class="clickable" v-on:click.prevent="methodToUpdateBeer">Update</button> -->
            </div>
        </div>
        <div id="review-container">
            <review-form id="review" v-show="showForm"/>
        </div>
    </div>
</template>

<script>
import ReviewForm from './ReviewForm.vue'
import BeerService from '../services/BeerService'
import FavoriteService from '../services/FavoriteService'
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
        },
        changeStoreValueForSelectedBeer(){
            this.$store.state.selectedBeer = this.beer;
        },
        FavoriteBeer(){
            FavoriteService.AddFavBeer(this.newFav)
        },
        methodToUpdateBeer(){
            BeerService.GetBeerById(this.beer.beerId)
            .then(response => {
                this.$store.commit("SET_BEER", response.data)
            })
        }
    },
    data() {
        return {
            showForm: false,
            newFav: {
                userId: this.$store.state.user.userId,
                beerId: this.beer.beerId
            },
        }
    }
}
</script>


<style scoped>
#beer-card {
    font-family: 'Duru Sans', sans-serif;
    font-weight: bold;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items: center;
    text-align: center;

    height: 450px;
    width: 255px;
    background: white;
    border-radius: 5px;

    position: relative;
    box-shadow: 0px 5px 7px 2px rgba(0, 0, 0, 0.152);
    overflow: hidden;
}
#beer-card:hover {
    transform: scale(102%);
}

#beer-image{
    height: 200px;
    width: 200px;
}
#beer-name{
    width: 100%;
    display: flex;
    justify-content: center;
    padding-top: 50px;
    margin: 5px;
    font-size: 20px;
}
#gf-beer-icon{
    height: 40px;
    width: 40px;
}
.beer-props{
    margin: 0%;
}
#favorite-icon{
    height: 20px;
    width: 20px;
}

#favorite-icon:hover {
    cursor: pointer;
}

#review:hover {
    cursor: pointer;
}

#view-details{
    text-decoration: none;
    color: black;
}
.clickable{
    margin: 0px;
}
#type-abv{
    display: flex;
    justify-content: center;

    width: 100%;
}
#beer-abv{
    margin-left: 10px;
}
#beer-type{
    margin-right: 10px;
}
#beer-image{
    object-fit: fill;
    position: center;
    height: 100%;
    width: 100%;
    overflow: hidden;

}
#name-gf-icon{
    display: flex;
}
#clickable-items{
    display: flex;
    width: 100%;
    justify-content: space-around;
    align-content: center;
    border-top: 1px solid rgba(0, 0, 0, 0.103);
    margin-top: 30px;
    padding-top: 15px;
    padding-bottom: 15px;
    box-shadow: 5px 0px 10px 0px rgba(0, 0, 0, 0.137);
}
#bottom{
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    height: 100%;
    width: 100%;
}
#clickable-divs{
    
}
</style>