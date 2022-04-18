<template id="temp">
    <div id="brewery-card">
        
        <div id="logo-name" class="prop-wrapper">
            <img :src="b.imgURL" alt="" id="brewery-img" :href="b.websiteURL"/>
            <strong id="name">{{b.name}}</strong>
        </div>
        <div id="num" class="prop-wrapper">
            <p id="number" class="items">{{b.phoneNumber}}</p>
        </div>
        <div class="prop-wrapper">
            <p id="hours" class="items">{{b.hoursOfOperation}}</p>
        </div>
        <div id="gluten-free-beer" v-if="hasGlutenFreeBeer == true" class="prop-wrapper">
            <img src="..\assets\pngs\GFBEER.png" alt="" id="gf-img" class="items">
        </div>
        <div id="gluten-free-food" v-if="hasGlutenFreeFood == true" class="prop-wrapper">
            <img src="..\assets\pngs\gfFood-removebg-preview.png" alt="" id="gf-food" class="items">
        </div>
        <button v-on:click.prevent="methodToCallTheThing">Update Brewery</button>
    </div>
</template>

<script>
import BreweryService from '../services/BreweryService';
export default {
    props: ['b'],
    computed: {
        hasGlutenFreeBeer(){
            if(this.b.hasGlutenFreeBeer === true){
                return true;
            }
            return false;
        },
        hasGlutenFreeFood(){
            if(this.b.hasGlutenFreeFood === true){
                return true;
            }
            return false;
        }
    },
    methods: {
        methodToCallTheThing(){
            BreweryService.GetBreweryByBreweryId(this.b.id)
            .then(response => {
                this.$store.commit("SET_BREWERY", response.data)
            })
        }
    }
}
</script>
<style scoped>
#temp{
    background-color: #FFD12B;
}
#brewery-card {
    display: flex;
    border-radius: 5px;
    height: 100px;
    padding: 10px;
    margin:10px;
    background: #7875AC;
    border: black 1px solid;
    flex-direction: row;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    column-gap: 20px;
    align-content: space-between;
    align-items: flex-end;
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
#logo-name {
    padding: 0;
    height: 100px;
    display: flex;
    flex-direction: column;

}
#brewery-img {
    height: 80px;
    width: 80px;
}
#name {
    height: 10px;
    margin: none;
}
#gf-img {
    height: 35px;
}
#gf-food{
    height: 45px;
}
#gluten-free{
    display: flex;
}
#hours{
    font-size: 15px;
    align-items: flex-end;
}


</style>