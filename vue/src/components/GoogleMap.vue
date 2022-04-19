<template>
    <GmapMap
        :center="{lat:40.442829, lng:-79.995888}"
        :zoom="11"
        map-type-id="terrain"
        style="width: 100%; height: 600px"
    >
        <GmapCluster :zoomOnClick="true">
            <GmapMarker v-for="marker in BreweryMarkers" :key="marker.id" :position="marker.position"/>
        </GmapCluster>
    </GmapMap>
</template>


<script>
import {gmapApi} from 'vue2-google-maps'
 
export default {
  computed: {
    google: gmapApi,
    BreweryMarkers(){
          let breweryInfo = [];
          let allBreweries = this.$store.state.breweries;
          allBreweries.forEach(element => {
              let newObj = {};
              let position = {};
              position.lat = element.latitude;
              position.lng = element.longitude;
              newObj.id = element.id;
              newObj.position = position;
              breweryInfo.push(newObj);
          });
          return breweryInfo;
      }
  },
}
</script>
