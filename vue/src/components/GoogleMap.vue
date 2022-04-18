<template>
    <GmapMap
        :center="{lat:40.442829, lng:-79.995888}"
        :zoom="12"
        map-type-id="terrain"
        style="width: 100%; height: 500px"
    >
        <GmapMarker
            :key="index"
            v-for="(m, index) in markers"
            :position="m.position"
            :clickable="true"
            :draggable="true"
            @click="center=m.position"
        />
    </GmapMap>
</template>


<script>
export default {
}
</script>
