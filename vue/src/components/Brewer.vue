<template>
    <div id="brewerCard">
        <h>{{brewer.username}}</h>
    </div>
</template>

<script>
export default {
    props: ['brewer']
}
</script>

<style scoped>
    #brewerCard {
        display: flex;
        background-color:#7875AC;
        border: black 1px solid;
        border-radius: 10px;
        padding: 10px;
        width: 250px;
        margin: 10px;
        flex-wrap: wrap;
       
    }
    h1{
        font-size: 20px;
    }
</style>