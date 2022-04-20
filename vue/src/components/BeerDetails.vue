
<template>
    <div id="wholeting">

        <h1>{{beerDetails.name}}</h1>
        <div id="allinfo">
            <p id="description">{{beerDetails.description}}</p>
            <div id="info">
                <p>Type of Brew: {{beerDetails.beerType}}</p>
                <p>Alcohol Content: {{beerDetails.abv}}%</p>
                <img v-show="beerDetails.isGlutenFree" id="gfbeer" src="..\assets\pngs\GFBEER.png" alt="">
            </div>
        </div>
        <img id="beerpic" :src="beerDetails.imgURL" alt="">
    </div>
</template>

<script>
export default {
    props: ['beerDetails'],

}
</script>

<style scoped>
h1 {
    font-size: 50px;
    background-color: rgb(0, 0, 0);
    font-family: 'Duru Sans', sans-serif;
    margin: 0px 0px;
    border-top: #7875AC solid;
    border-bottom: solid;
    padding: 10px;
    color: white;
}
#description {
    width: 300px;
    padding: 15px;
    margin: 15px;
    background-color: rgb(0, 0, 0);
    font-family: 'Duru Sans', sans-serif;
    border: black solid 1px;
    border-radius: 15px;
    color: white;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.473);
}
#beerpic {
    widows: 350px;
    height: 450px;
    border: white (148, 140, 140) solid 5px;
    border-radius: 15px;
    margin: 15px;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.473);
}
#wholething {
    display: grid;
}
#info {
    width: 300px;
    padding: 15px;
    margin: 15px;
    background-color: rgb(0, 0, 0);
    border: black solid 1px;
    border-radius: 15px;
    font-family: 'Duru Sans', sans-serif;
    display: grid;
    color: white;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.473);
}
#allinfo {
    display: flex;
}
#gfbeer {
    height: 40px;
}


</style>