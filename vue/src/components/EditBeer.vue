<template>
    <div>
        <button v-on:click="toggleShowForm()">Add A Beer</button>
        <button v-on:click="toggleShowForm(); updateBeer();">Update Beer</button>
        <form v-show="showForm" action="" id="beer-form">
            <div  class="flex-wrapper">
                <label for="beer-name" class="form-label">Name: </label>
                <input placeholder="Name" type="text" id="beer-name" v-model="currentBeer.name" class="form-input">
            </div>
            <div class="flex-wrapper">
                <label for="" class="form-label">Beer Type: </label>
                <input placeholder="'light' 'mild' or 'dark'" type="text" id="type" v-model="currentBeer.beerType" class="form-input">
            </div>
            <div class="flex-wrapper">
                <label for="" class="form-label">Description: </label>
                <input placeholder="Description" type="text" id="Description" v-model="currentBeer.description" class="form-input">
            </div>
            <div class="flex-wrapper">
                <label for="" class="form-label">Image URL: </label>
                <input placeholder="Please Link An Image" type="text" id="IMG" v-model="currentBeer.imgURL" class="form-input">
            </div>
            <div class="flex-wrapper">
                <label for="" class="form-label">ABV: </label>
                <input placeholder="Please Enter Just The Number" type="number" v-model.number="currentBeer.abv" class="form-input">
            </div>
            <div class="flex-wrapper">
                <label for="" class="form-label">Gluten Free: </label>
                <input type="checkbox" v-model="currentBeer.isGlutenFree">
                <label for="" class="form-label">Avaliable: </label>
                <input type="checkbox" v-model="currentBeer.isAvaliable">
            </div>
            <div class="flex-wrapper">
                <button type="submit" id="cancel" v-on:click.prevent="toggleShowForm(); ClearForm();">Cancel</button>
                <button type="submit" id="submit" v-on:click.prevent="AddBeerboi">Add New Beer</button>
                <button type="submit" id="update" v-on:click.prevent="UpdateBeerboi">Update Beer</button>
            </div>
            
        </form>
    </div>
</template>

<script>
import BeerService from '../services/BeerService'
export default {
    data(){
        return{
            currentBeer: {
                name: '',
                abv: null,
                beerType: '',
                description: '',
                isAvaliable: true,
                isGlutenFree: false,
                imgURL: '',
                breweryId: null
            },
            showForm: false
        }
    },
    methods:{
        toggleShowForm(){
            if(this.showForm == true){
                this.showForm = false;
            }
            else if(this.showForm == false){
                this.showForm = true;
            }
        },
        AddBeerboi() {
            BeerService
            .AddABeer(this.currentBeer)
            .then((response) => {
                if(response.status == 201) {
                    this.$router.push({
                        path: '/admin',
                    });
                }
            })
            .catch((error) => {
                const response = error.response;
                this.addBreweryErrors = true;
                if (response.status === 400){
                    this.addBeerErrorMessage = 'Validation Error'
                }
            });
        },
        UpdateBeerboi(){
            BeerService.UpdateBeer(this.currentBeer)
            .then((response) => {
                if(response.status == 201) {
                    this.$router.push({
                        path: '/admin',
                    });
                }
            })
        },
        ClearForm(){
            this.currentBeer = {
                name: '',
                abv: null,
                beerType: '',
                description: '',
                isAvaliable: true,
                isGlutenFree: false,
                imgURL: '',
                breweryId: null,
                beerId: null
            }
        },
        updateBeer(){
            this.currentBeer.name = this.$store.state.beer.name;
            this.currentBeer.abv = this.$store.state.beer.abv;
            this.currentBeer.beerType = this.$store.state.beer.beerType;
            this.currentBeer.description = this.$store.state.beer.description;
            this.currentBeer.isAvaliable = this.$store.state.beer.isAvaliable;
            this.currentBeer.isGlutenFree = this.$store.state.beer.isGlutenFree;
            this.currentBeer.imgURL = this.$store.state.beer.imgURL;
            this.currentBeer.breweryId = this.$store.state.beer.breweryId;
            this.currentBeer.beerId = this.$store.state.beer.beerId;

        }
    }
}
</script>

<style scoped>
.flex-wrapper {
        width: 460px;
        display: flex;
        margin: 10px;
        justify-content: space-between;
    }
    .flex-wrapper:nth-last-child(1) {
        justify-content: space-around;
    }
    .form-input {
        display: flex;
        flex-grow: 1;
        background: lightgray;
    }
    .form-label {
        width: 120px;
    }
    #beer-form {
        background: white;
        width: 500px;
        margin: 10px;
        border: 1px solid;
        border-radius: 15px;
    }
    button {
        margin: 5px;
    }
</style>