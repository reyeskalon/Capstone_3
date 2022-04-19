
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
    background-color: rgb(224, 25, 231);
    font-family: 'Duru Sans', sans-serif;
    margin: 0px 0px;
    border-top: solid;
    border-bottom: solid;
    padding: 10px;
}
#description {
    width: 300px;
    padding: 15px;
    margin: 15px;
    background-color: rgb(206, 86, 236);
    font-family: 'Duru Sans', sans-serif;
    border: black solid 1px;
    border-radius: 15px;
}
#beerpic {
    widows: 350px;
    height: 450px;
    border: black solid 5px;
    border-radius: 15px;
    margin: 15px;
}
#wholething {
    display: grid;
    
}
#info {
    width: 300px;
    padding: 15px;
    margin: 15px;
    background-color: rgb(206, 86, 236);
    border: black solid 1px;
    border-radius: 15px;
    font-family: 'Duru Sans', sans-serif;
    display: grid;
}
#allinfo {
    display: flex;
}
#gfbeer {
    height: 40px;
}

</style>