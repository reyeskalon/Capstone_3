<template>
    <div id="brewerCard">
        <h1>{{brewer.username}}</h1>
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
        background-color:#b3921e;
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