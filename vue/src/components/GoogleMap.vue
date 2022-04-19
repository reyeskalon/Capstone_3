<template>
    <GmapMap
        :center="{lat:40.442829, lng:-79.995888}"
        :zoom="11"
        map-type-id="terrain"
        style="width: 100%; height: 600px"
    >
        <GmapCluster
            :zoomOnClick="true"
        >
            <GmapMarker
                ref="Marker"
                :position="google && new google.maps.LatLng(40.446786,-80.015761)"
                icon: 
            />
        </GmapCluster>
    </GmapMap>
</template>


<script>
import {gmapApi} from 'vue2-google-maps'
 
export default {
  computed: {
    google: gmapApi
  },
}
</script>
