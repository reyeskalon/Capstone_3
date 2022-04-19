<template>
<div>
    <button v-on:click.prevent="toggleShowForm">Add A Brewery</button>
    <button v-on:click.prevent=" updateBrewer(); toggleShowForm(); ">Update Brewery</button>
    <form v-show="showForm" action="" id="brewery-form">
        <div class="flex-wrapper">
            <label for="brewery-name" class="form-label">Name: </label>
            <input placeholder="Name" type="text" id="brewery-name" v-model="currentBrewery.Name" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Hours: </label>
            <input placeholder="Hours" type="text" id="hours" v-model="currentBrewery.HoursOfOperation" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Phone Number: </label>
            <input placeholder="Phone Number" type="text" id="phone-number" v-model="currentBrewery.PhoneNumber" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Website: </label>
            <input placeholder="Website" type="text" id="Website" v-model="currentBrewery.WebsiteURL" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Address: </label>
            <input placeholder="Address" type="text" v-model="currentBrewery.Address" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Longitude: </label>
            <input placeholder="Longitude" type="text" v-model.number="currentBrewery.Longitude" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Latitude: </label>
            <input placeholder="Latitude" type="text" v-model.number="currentBrewery.Latitude" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">History: </label>
            <input placeholder="History" type="text" v-model="currentBrewery.History" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Brewery Image: </label>
            <input placeholder="Please link an image" type="text" v-model="currentBrewery.ImgURL" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Gluten Free Beer: </label>
            <input type="checkbox" v-model="currentBrewery.HasGlutenFreeBeer">
            <label for="" class="form-label">Gluten Free Food: </label>
            <input type="checkbox" v-model="currentBrewery.HasGlutenFreeFood">
        </div>
        <div class="flex-wrapper">
            <button type="submit" id="cancel" v-on:click.prevent="toggleShowForm(); resetBreweryForm();">Cancel</button>
            <button type="submit" id="submit" v-on:click.prevent="AddBrewboi">Add New Brewery</button>
            <button type="submit" id="update" v-on:click.prevent="UpdateBrewboi">Update Current</button>
        </div>
        
    </form>
</div>
</template>

<script>
import BreweryService from '../services/BreweryService.js';
export default {
    data(){
        return {
            
            currentBrewery: {
                Name: "",
                HoursOfOperation: "",
                PhoneNumber: "",
                WebsiteURL: "",
                Address: "",
                Longitude: null,
                Latitude: null,
                History: "",
                ImgURL: "",
                HasGlutenFreeFood: false,
                HasGlutenFreeBeer: false,
                IsOpen: true,
                id: null
            },
            addBreweryErrors: false,
            addBreweryErrorMessage: 'There were problems adding this brewer',
            showForm: false,
        };
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
        resetBreweryForm(){
            this.currentBrewery = {
                Name: "",
                HoursOfOperation: "",
                PhoneNumber: "",
                WebsiteURL: "",
                Address: "",
                Longitude: null,
                Latitude: null,
                History: "",
                ImgURL: "",
                HasGlutenFreeFood: false,
                HasGlutenFreeBeer: false,
                IsOpen: true,
                id: null
            }
        },
        updateBrewer(){
            this.currentBrewery.Name = this.$store.state.brewery.name;
            this.currentBrewery.Address = this.$store.state.brewery.address;
            this.currentBrewery.HasGlutenFreeBeer = this.$store.state.brewery.hasGlutenFreeBeer;
            this.currentBrewery.HasGlutenFreeFood = this.$store.state.brewery.hasGlutenFreeFood;
            this.currentBrewery.History = this.$store.state.brewery.history;
            this.currentBrewery.HoursOfOperation = this.$store.state.brewery.hoursOfOperation;
            this.currentBrewery.ImgURL = this.$store.state.brewery.imgURL;
            this.currentBrewery.Latitude = this.$store.state.brewery.latitude;
            this.currentBrewery.Longitude = this.$store.state.brewery.longitude;
            this.currentBrewery.PhoneNumber = this.$store.state.brewery.phoneNumber;
            this.currentBrewery.WebsiteURL = this.$store.state.brewery.websiteURL;
            this.currentBrewery.id = this.$store.state.brewery.id
        },
        UpdateBrewboi() {
            BreweryService
            .UpdateBrewery(this.currentBrewery)
            .then((response) => {
                if(response.status == 201) {
                    this.$router.push( {
                        path: '/admin',
                    });
                }
            })
            .catch((error) => {
                const response = error.response;
                this.addBreweryErrors = true;
                if (response.status === 400){
                    this.addBreweryErrorMessage = 'Validation Error'
                }
            });
        },
        AddBrewboi() {
            BreweryService
            .AddBrewery(this.currentBrewery)
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
                    this.addBreweryErrorMessage = 'Validation Error'
                }
            });
        },
        clearErrors() {
            this.addBreweryErrors = false;
            this.addBreweryErrorMessage = 'There were problems registering this brewer.';
    }
    },
    props: ['Brewery']
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
    #brewery-form {
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