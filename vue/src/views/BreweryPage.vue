<template>
    <div>
        <p>{{CurrentBrewery.name}}</p>
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

</style>