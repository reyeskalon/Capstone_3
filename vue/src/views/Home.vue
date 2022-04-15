<template>
    <main>
        <h1>Drop-A-Pint</h1>

        <div id="googleMap"></div>
  </main>
</template>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFvxjkFmpMry87XMtoIS54kWPHqkrAyxg&callback=myMap"></script>

<script> 
    export default {
        name: "home",
    
    
    function: {

        myMap() {
                var mapProp = {
                    center: new google.maps.LatLng(40.440624, -79.995888),
                    zoom:5,
                };

                var map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
            }
        }
    }
</script>

<style>
#googleMap{
    height: 90%;
    width: 400px;
}
/* .dropbtn {
  background-color: #04AA6D;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.drop-options {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.drop-options a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.drop-options a:hover {background-color: #ddd;}

.dropdown:hover .drop-options {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}


#map {
    height: 400px;
    width: 100%;
} */
</style>
