<template>
    <div id="brewery-card">
        <p>{{b.name}}</p>
        <img :src="b.imgURL" alt="" id="brewery-img"/>
        <p></p>
    </div>
</template>

<script>
export default {
    props: ['b']
}
</script>
<style scoped>
#brewery-card {
    display: grid;
    height: 400px;
    padding: 50px;
    margin: 10px;
    background: lightgray;
    border: red 1px solid;

}
#brewery-img {
    height: 400px;
}
</style>