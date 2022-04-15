<template>
    <div>
        <p>{{beer.name}}</p>
        <img :src="beer.imgURL" alt="">
    </div>
</template>

<script>
export default {
    props: ['beer'],

}
</script>

<style scoped>

</style>