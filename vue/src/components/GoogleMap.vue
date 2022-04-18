<template>
    <GmapMap
        :center="{lat:40.442829, lng:-79.995888}"
        :zoom="12"
        map-type-id="terrain"
        style="width: 100%; height: 500px"
    >
        <GmapCluster
            :zoomOnClick="true"
        >
            <GmapMarker
                ref="Marker1"
                :position="google && new google.maps.LatLng(40.446786,-80.015761)"
            />
            
            <GmapMarker
                ref="Marker2"
                :position="google && new google.maps.LatLng(40.439445,-79.989891)"
            />
        </GmapCluster>
    </GmapMap>
</template>


<script>
import {gmapApi} from 'vue2-google-maps'

 
export default {
  computed: {
    google: gmapApi
  }
}
</script>
