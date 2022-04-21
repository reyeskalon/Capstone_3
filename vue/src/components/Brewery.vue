<template id="temp">
    <div id="brewery-card">
        
        <div id="logo-name" class="prop-wrapper">
            <img :src="b.imgURL" alt="" id="brewery-img" :href="b.websiteURL"/>
            <strong id="name">{{b.name}}</strong>
        </div>
        <div id="num" class="prop-wrapper">
            <p id="number" class="items">{{b.phoneNumber}}</p>
        </div>
       
        <div id="gluten-free-beer" v-if="hasGlutenFreeBeer == true" class="prop-wrapper">
            <img src="..\assets\pngs\GFBEER.png" alt="" id="gf-img" class="items">
        </div>
        <div id="gluten-free-food" v-if="hasGlutenFreeFood == true" class="prop-wrapper">
            <img src="..\assets\pngs\gfFood-removebg-preview.png" alt="" id="gf-food" class="items">
        </div>
        <button id="update-button" v-on:click.prevent="methodToCallTheThing">Edit</button>
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


#brewery-card {
    font-family: 'Duru Sans', sans-serif;
    font-weight: bold;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    height: 450px;
    width: 350px;
    background: white;
    border-radius: 5px;
    position: relative;
    box-shadow: 0px 5px 7px 2px rgba(0, 0, 0, 0.152);
    overflow: hidden;
    margin: 10px;
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
    height: 200px;
    width: 200px;
}
#name {
    width: 100%;
    display: flex;
    justify-content: center;

    margin: 5px;
    font-size: 20px;

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
#bottom{
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    height: 100%;
    width: 100%;
}

</style>