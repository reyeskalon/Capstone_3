<template>
    <form action="">
        <div>
            <label for="brewery-name">Name: </label>
            <input type="text" id="brewery-name" v-model="currentBrewery.Name">
        </div>
        <div>
            <label for="">Hours: </label>
            <input type="text" v-model="currentBrewery.Hours">
        </div>
        <div>
            <label for="">Phone Number: </label>
            <input type="text" v-model="currentBrewery.PhoneNumber">
        </div>
        <div>
            <label for="">Website: </label>
            <input type="text" v-model="currentBrewery.Website">
        </div>
        <div>
            <label for="">Address: </label>
            <input type="text" v-model="currentBrewery.Address">
        </div>
        <div>
            <label for="">Longitude: </label>
            <input type="text" v-model="currentBrewery.Longitude">
        </div>
        <div>
            <label for="">Latitude: </label>
            <input type="text" v-model="currentBrewery.Latitude">
        </div>
        <div>
            <label for="">History: </label>
            <input type="text" v-model="currentBrewery.History">
        </div>
        <div>
            <label for="">Brewery Image: </label>
            <input type="text" v-model="currentBrewery.Image">
        </div>
        <div>
            <label for="">Gluten Free Beer: </label>
            <input type="checkbox" v-model="currentBrewery.GlutenFreeBeer">
        </div>
        <div>
            <label for="">Gluten Free Food: </label>
            <input type="checkbox" v-model="currentBrewery.GlutenFreeFood">
        </div>
        <button type="submit"></button>
        <button type="submit"></button>
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

</style>