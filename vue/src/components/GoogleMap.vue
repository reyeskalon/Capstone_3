<template>
    <GmapMap
        :center="center"
        :zoom="11"
        map-type-id="terrain"
        style="width: 100%; height: 600px"
    >
        <GmapCluster :zoomOnClick="true">
            <GmapMarker v-for="marker in BreweryMarkers" :key="marker.id" :position="marker.position" :clickable="true" @click="center=marker.position; openMarker(marker.id)" @closeclick="openMarker(null)">
                <GmapInfoWindow :closeclick="true" @closeclick="openMarker(null)" :opened="openedMarkerID === marker.id">
                    <brewery-map-panel :breweryId="marker.id"/>
                </GmapInfoWindow>
            </GmapMarker>
        </GmapCluster>
    </GmapMap>
</template>


<script>
import {gmapApi} from 'vue2-google-maps'
import BreweryService from '../services/BreweryService'
import BreweryMapPanel from './BreweryMapPanel.vue';
 
export default {
  components: { BreweryMapPanel },
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
    created(){
        BreweryService.GetBreweries().then(response => {
              this.$store.commit("SET_BREWERIES", response.data);
          });
    },
    data() {
        return {
            center: {
                lat:40.442829,
                lng:-79.995888
            },
            openedMarkerID: null
        }
    },
    methods: {
        openMarker(id) {
            this.openedMarkerID = id;
        },
    }
}
</script>
