<template>
    <div id="main">
        <div id="brewery-info">
            <div id="header">
                <div id="logo-name">
                    <img id="brewery-image" :src="CurrentBrewery.imgURL" alt="" />
                    <h1>{{CurrentBrewery.name}}</h1>
                </div>
                <div id="is-gf">
                    <img class="gf-logos" src="..\assets\pngs\gfFood-removebg-preview.png" alt="" v-if="CurrentBrewery.hasGlutenFreeFood">  
                    <img class="gf-logos" src="..\assets\pngs\GFBEER.png" alt="" v-if="CurrentBrewery.hasGlutenFreeBeer">
                </div>
            </div>
            <div id="text-area">
                <p id="description">{{CurrentBrewery.history}}</p>
            </div>
            <div id="footer">
                <div id="contact-info">
                    <p>{{CurrentBrewery.address}}</p>
                    <p>{{CurrentBrewery.phoneNumber}}</p>
                    <a :href="CurrentBrewery.websiteURL"><img id="website-icon" src="..\assets\pngs\website_icon_purple.png" alt=""></a>
                </div>
                <p id="hours">{{CurrentBrewery.hoursOfOperation}}</p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    computed: {
        CurrentBrewery(){
            return this.$store.state.brewery;
        }
    }
}
</script>

<style scoped>
    #main{
        background-image: url(../assets/images/hero_resized.jpg);
        background-repeat: no-repeat;
        background-position: right;
        
    }
    #brewery-info{
        height: 89vh;
        width: 50vw;
        display: flex;
        flex-direction: column;
        justify-content: space-between;

        color: black;
        font-family: 'Duru Sans', sans-serif;
        font-weight: bold;

        background-color: rgb(255, 255, 255);
    }
    #footer{
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        border-top: black 2px solid;
        background-color: white;
    }
    #brewery-image{
        height: 100px;
        width: 100px;
        margin-right: 20px;
        margin-left: 20px;
    }
    #header{
        display: flex;
        align-items: center;
        justify-content: space-between;
        background-color: white;
        box-shadow: 0px 5px 7px 2px rgba(0, 0, 0, 0.152);
    }
    .gf-logos{
        height: 50px;
        width: 50px;
        margin: 10px;
    }
    #is-gf{
        display: flex;
        align-items: center;
    }
    #logo-name{
        display: flex;
        align-items: center;
    }
    #contact-info{
        display: flex;
        width: 100%;
        justify-content: space-around;
        align-items: center;
    }
    #description{
        margin:40px;
        padding: 10px;
        line-height: 2em;
        
        font-size: 20px;
        background-color: white;
    }
    #hours{
        margin: 20px;
    }
    a{
        text-decoration: none;
        color: black;
    }
    #website-icon{
        height: 25px;
        width: 25px;
    }
</style>