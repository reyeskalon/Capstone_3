<template id="temp">
    <div id="brewery-card">
        <img :src="b.imgURL" alt="" id="brewery-img" :href="b.websiteURL"/>
        <div id ="namenum">
            <p id="name">{{b.name}}</p>
            <p id="number">{{b.phoneNumber}}</p>
        </div>
        <p id="hours">{{b.hoursOfOperation}}</p>
        <div id="gluten-free">
            <p v-if="hasGlutenFreeBeer == true"><img src="..\assets\pngs\GFBEER.png" alt="" id="gf-img"></p>
            <p v-if="hasGlutenFreeFood == true"><img src="..\assets\pngs\gfFood-removebg-preview.png" alt="" id="gf-food"></p>
        </div>
        
    </div>
</template>

<script>
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
    padding: 20px;
    margin: 10px;
    background: #7875AC;
    border: black 1px solid;
    flex-direction: row;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    column-gap: 20px;
    align-content: space-between;
}
#brewery-img {
    height: 50px;
    width: 50px;
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
    font-size: 9px;
    align-items: flex-end;
}
#namenum{
    display: flex;
    flex-direction: column;
    font-size: 12px;
}

</style>