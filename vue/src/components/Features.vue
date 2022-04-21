<template>
  <div>
     <div class="container">
            <div class="grid-container directions">
                <div class="grid-item">
                    <div class="image"><img src="../assets/images/directions.jpeg" alt=""></div>
                </div>
            </div>

            <div class="grid-container directions_text">
                <div class="grid-item text-item">
                    <h1 class="grid-heading">Find yourself</h1>
                    <div class="text-block">Whether it's your first time visiting or you're a regular, make the most of
                        all we have to offer from the nation's leading brewery finder app on the market. Browse by
                        brewery, beer, or location.</div>
                </div>
            </div>

            <div class="grid-container vegan-text">
                <div class="grid-item text-item">
                    <h1 class="grid-heading">Find your community</h1>
                    <div class="text-block">New to an area but love a certain beer? Check out our menu and we'll find
                        you the closest retailer, restaurant, or pub instantly. Need directions? We'll get you there
                        each step or mile of the way. Looking for gluten-free, eco-friendly, or vegan establishments?
                        Add one of our built-in filters to your search.</div>
                </div>
            </div>

            <div class="grid-container vegan">
                <div class="grid-item">
                    <div class="image"><img src="../assets/images/vegan.jpeg" alt=""></div>
                </div>
            </div>

            <div class="grid-container social">
                <div class="grid-item">
                    <div class="image"><img src="../assets/images/social.jpeg" alt=""></div>
                </div>
            </div>

            <div class="grid-container social-text">
                <div class="grid-item text-item">
                    <h1 class="grid-heading">Make memories</h1>
                    <div class="text-block">Create an account to save locations, create your own library of favorite
                        beers and breweries, or rate and review locations. Once you're a user, you can also choose to
                        share your location with other users to make planning date night or an after-hour work meeting
                        as simple as pressing a button. Get started today by making your first search or by becoming a
                        member today.</div>
                </div>
            </div>
        </div>
  </div>
</template>

<script>
export default {
    name: 'grid-features'
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Duru+Sans&display=swap');
body {
    box-sizing: border-box;
    font-size: 14px;
    background-color: rgba(12, 12, 17, 0.027);
}

.container {
    font-family: 'Duru Sans', sans-serif;

    display: grid;
    grid-auto-flow: row;
    grid-column-gap: 0px;
    grid-row-gap: 0px;
    grid-template-columns: 3fr 3fr;
    grid-template-rows: auto auto auto;
    grid-template-areas: 
        "directions directions-text"
        "vegan-text vegan"
        "social social-text";
}

.grid-item {
    height: 100%;
    width: 100%;
    position: relative;
}

.grid-item .image {
    width: 100%;
    height: 100%;
    border-top: solid 4px black;
}

.grid-item .image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: 50% 50%;
}

.directions {
    grid-area: directions;

}

.directions_text {
    grid-area: directions-text;
}

.vegan-text {
    grid-area: vegan-text;

}

.vegan {
    grid-area: vegan;
}

.social {
    grid-area: social;

}

.social-text {
    grid-area: social-text;
}

.grid-heading {
    padding-top: 30px;
    text-align: center;
}

.text-block {
    padding-right: 40px;
    padding-left: 40px;
    padding-bottom: 40px;
    line-height: 1.5;
    text-align: center;
    letter-spacing: 0.5px;
    justify-content: center;
    font-size: 30px;
}

.text-item {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    background-size: 400% 400%;
    animation: gradient 15s ease infinite;
    text-shadow: 2px 2px rgba(97, 97, 97, 0.61);
   
    border-top: solid 4px black;
   
} 
@keyframes gradient {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

h1 {
    font-size: 50px;
}
</style>