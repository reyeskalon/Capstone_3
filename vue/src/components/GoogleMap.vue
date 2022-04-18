<template>
    <GmapMap
        :center="{lat:40.440624, lng:-79.995888}"
        :zoom="15"
        map-type-id="terrain"
        style="height: 100vh"
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
    name: "home"
}
</script>
