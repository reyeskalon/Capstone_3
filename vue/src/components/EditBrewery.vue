<template>
    <form action="" id="brewery-form">
        <div class="flex-wrapper">
            <label for="brewery-name" class="form-label">Name: </label>
            <input type="text" id="brewery-name" v-model="currentBrewery.Name" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Hours: </label>
            <input type="text" v-model="currentBrewery.Hours" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Phone Number: </label>
            <input type="text" v-model="currentBrewery.PhoneNumber" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Website: </label>
            <input type="text" v-model="currentBrewery.Website" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Address: </label>
            <input type="text" v-model="currentBrewery.Address" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Longitude: </label>
            <input type="text" v-model="currentBrewery.Longitude" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Latitude: </label>
            <input type="text" v-model="currentBrewery.Latitude" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">History: </label>
            <input type="text" v-model="currentBrewery.History" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Brewery Image: </label>
            <input type="text" v-model="currentBrewery.Image" class="form-input">
        </div>
        <div class="flex-wrapper">
            <label for="" class="form-label">Gluten Free Beer: </label>
            <input type="checkbox" v-model="currentBrewery.GlutenFreeBeer">
            <label for="" class="form-label">Gluten Free Food: </label>
            <input type="checkbox" v-model="currentBrewery.GlutenFreeFood">
        </div>
        <div class="flex-wrapper">
            <button type="submit" id="cancel">Cancel</button>
            <button type="submit" id="submit">Submit</button>
        </div>
        
    </form>
</template>

<script>
export default {
    data(){
        return {
            currentBrewery: {
                Id: null,
                Name: "",
                Hours: "",
                PhoneNumber: "",
                Website: "",
                Address: "",
                Longitude: null,
                Latitude: null,
                History: "",
                Image: "",
                GlutenFreeFood: false,
                GlutenFreeBeer: false,
                IsOpen: true
            }
        }
    },
    methods:{

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