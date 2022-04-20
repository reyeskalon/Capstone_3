<template>
    <div id="card">
        <router-link id="brewery-link" v-bind:to="{ name: 'brewerypage' }" @click="SetBrewery">
            <h1>{{currentBrewery.name}}</h1>
        </router-link>
        <p>{{currentBrewery.history}}</p>
        <div id="contact-info">
            <p>{{currentBrewery.websiteURL}}</p>
            <p>{{currentBrewery.phoneNumber}}</p>
        </div>
    </div>
</template>

<script>

import BreweryService from '../services/BreweryService'
export default {
    props: ['breweryId'],
    created(){
        BreweryService.GetBreweryByBreweryId(this.breweryId).then(response => {
            this.currentBrewery = response.data;
        });
    },
    data(){
        return{
            currentBrewery: {}
        }
    },
    methods: {
        SetBrewery(){
            BreweryService.GetBreweryByBreweryId(this.currentBrewery.breweryId).then(response => {
            this.$store.commit("SET_BREWERY", response.data);
        });
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Duru+Sans&display=swap');
    #card{
        font-family: 'Duru Sans', sans-serif;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    h1{
        text-decoration: underline;
        margin: 0px;
    }
    p{
        line-height: 1.5rem;
    }
    #contact-info{
        display: flex;
        width: 100%;
        justify-content: space-around;
    }
    #brewery-link{
        color: black;
    }
</style>