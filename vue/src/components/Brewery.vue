<template id="temp">
    <div id="brewery-card">
        
        <div id="logo-name" class="prop-wrapper">
            <img :src="b.imgURL" alt="" id="brewery-img" :href="b.websiteURL"/>
            <strong id="name">{{b.name}}</strong>
        </div>
      
<div id="bottom-stuff">
       <div id="gf-things">
            <div id="gluten-free-beer" v-if="hasGlutenFreeBeer == true" class="prop-wrapper">
                <img src="..\assets\pngs\GFBEER.png" alt="" id="gf-img" class="items">
            </div>
            <div id="gluten-free-food" v-if="hasGlutenFreeFood == true" class="prop-wrapper">
                <img src="..\assets\pngs\gfFood-removebg-preview.png" alt="" id="gf-food" class="items">
            </div>
        </div>
        <button class="button-48" role="button" id="update-button" v-on:click.prevent="methodToCallTheThing"><span class="text">Modify</span></button>
    </div>
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

.button-48 {
  appearance: none;
  background-color: #FFFFFF;
  border-width: 0;
  box-sizing: border-box;
  color: #000000;
  cursor: pointer;
  display: inline-block;
  font-family: Clarkson,Helvetica,sans-serif;
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0;
  line-height: 1em;
  margin: 0;
  opacity: 1;
  outline: 0;
  padding: 1.5em 2.2em;
  position: relative;
  text-align: center;
  text-decoration: none;
  text-rendering: geometricprecision;
  text-transform: uppercase;
  transition: opacity 300ms cubic-bezier(.694, 0, 0.335, 1),background-color 100ms cubic-bezier(.694, 0, 0.335, 1),color 100ms cubic-bezier(.694, 0, 0.335, 1);
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: baseline;
  white-space: nowrap;
}

.button-48:before {
  animation: opacityFallbackOut .5s step-end forwards;
  backface-visibility: hidden;
  background-color: #EBEBEB;
  clip-path: polygon(-1% 0, 0 0, -25% 100%, -1% 100%);
  content: "";
  height: 100%;
  left: 0;
  position: absolute;
  top: 0;
  transform: translateZ(0);
  transition: clip-path .5s cubic-bezier(.165, 0.84, 0.44, 1), -webkit-clip-path .5s cubic-bezier(.165, 0.84, 0.44, 1);
  width: 100%;
}

.button-48:hover:before {
  animation: opacityFallbackIn 0s step-start forwards;
  clip-path: polygon(0 0, 101% 0, 101% 101%, 0 101%);
}

.button-48:after {
  background-color: #FFFFFF;
}

.button-48 span {
  z-index: 1;
  position: relative;
}
#bottom-stuff{
    display: flex;
}
#brewery-card {
    font-family: 'Duru Sans', sans-serif;
    font-weight: bold;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    height: 320px;
    width: 250px;
    background: white;
    border-radius: 5px;
    position: relative;
    box-shadow: 0px 5px 7px 2px rgba(0, 0, 0, 0.152);
    overflow: hidden;
    padding: 10px;
    margin:10px;
   
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}
#gf-things{
    display: flex;
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
    align-items: center;
    
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
#gluten-free-beer{
    display: flex;
    justify-content: center;
    align-items: center;
}
#gluten-free-food{
    display: flex;
    justify-content: center;
    align-items: center;
}

</style>