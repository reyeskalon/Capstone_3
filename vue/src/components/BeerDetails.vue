
<template>
    <div>
        <h1>{{beerDetails.name}}</h1>
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
}

</style>