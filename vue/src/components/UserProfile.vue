<template>
  <div class="body">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Roboto:wght@300;400;500;700;900&display=swap"
      rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&family=Roboto:wght@300;400;500;700;900&display=swap"
      rel="stylesheet"/>
    <section class="user-profile">
      <div class="background-gradient"></div>
      <div class="wrapper">
        <div class="sidebar sidebar-left">
          <div>
            <div class="user-profile-picture-container"><img class="user-profile-picture" src="../assets/images/UI-faces/customer-6.jpg" alt="" /></div>
            <div class="user-info-container">
              <h3 class="user-name">Nora Tsundoda</h3>
              <h4 class="user-role">Beer Lover</h4>
            </div>
          </div>
          <div class="user-menu-links">
            <div class="user-menu-item"><img class="icon" src="../assets/icons/user.png"> Profile</div>
            <div class="user-menu-item user-menu-text-light">
              <img class="icon" src="../assets/icons/icons8-messages-60.png"> Messages
            </div>
            <div class="user-menu-item user-menu-text-light">
              <img class="icon" src="../assets/icons/icons8-settings-100.png"> Settings
            </div>
            <div class="user-menu-item user-menu-text-light">
              <img class="icon" src="../assets/icons/sign-out.png"> Logout
            </div>
          </div>
        </div>
        <div class="main">
          <div class="main-features-container">
            <div class="main-features">
              <ul class="main-feature-fav-list">
                <h1 class="main-features-fav-title">Favorites<img class="main-features-fav-title_icon" src="../assets/icons/heart-full.png"></h1>
                <li class="main-feature-fav-list_item"><img class="main-features-fav_icon" src="../assets/icons/beer-icon.png">Beers</li>
                <li class="main-feature-fav-list_item"><img class="main-features-fav_icon" src="../assets/icons/double-boiler.png">Breweries</li>
                <li class="main-feature-fav-list_item"><img class="main-features-fav_icon" src="../assets/icons/rating.png">Reviews</li>
              </ul>
            </div>
            <div class="friends-container">
              <div class="main-features-friends">
                  <h1 class="main-features-title friends-title">Recently added friends <img class="friends-title_icon" src="../assets/icons/cheers.png" alt="">
                    </h1>
                <ul class="friends-list">
                  <li><img class="friends-img" src="../assets/images/UI-faces/customer-2.jpg" alt=""><div>Joe A.</div></li>
                  <li><img class="friends-img" src="../assets/images/UI-faces/customer-1.jpg" alt=""><div>Katie U.</div></li>
                  <li><img class="friends-img" src="../assets/images/UI-faces/customer-3.jpg" alt=""><div>Julia G.</div></li>
                  <li><img class="friends-img" src="../assets/images/UI-faces/ben.jpg" alt=""><div>Ben T.</div></li>
                  <li><img class="friends-img" src="../assets/images/UI-faces/customer-5.jpg" alt=""><div>Steve H.</div></li>
                  <li><img class="friends-img" src="../assets/images/UI-faces/hannah.jpg" alt=""><div>Hanna S.</div></li>
                  <li><img class="friends-img" src="../assets/images/UI-faces/dave.jpg" alt=""><div>Dave J.</div></li>
                </ul>
              </div>
            </div>
            <div class="recent-locations-container">
              <div class="recent-locations">
                <ul class="recent-locations_list">
                  <h1 class="recent-locations-title">Recent Locations  <img class="recent-locations-title_icon" src="../assets/icons/beer-location.png" alt=""></h1>
                  <li class="main-feature-fav-list_item"><img class="recent-locations-img" src="../assets/images/brewery-logos/burghers.png">Burgh'ers Brewing</li>
                  <li class="main-feature-fav-list_item"><img class="recent-locations-img" src="../assets/images/brewery-logos/hop-farm.png">Hop Farm Brewing Company</li>
                  <li class="main-feature-fav-list_item"><img class="recent-locations-img" src="../assets/images/brewery-logos/southern-tier.png">Southern Tier Brewing Co.</li>
                  <li class="main-feature-fav-list_item"><img class="recent-locations-img" src="../assets/images/brewery-logos/412-brewery.png">412 Brewery</li>
                  <li class="main-feature-fav-list_item"><img class="recent-locations-img" src="../assets/images/brewery-logos/2-frays.png">2 Frays Brewery</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="sidebar sidebar-right">
          <h3 class="bio-heading">Biography</h3>
          <div class="user-biography">
            Skateboarder, coffee addict, audiophile, Mad Men fan and holistic
            designer. Lover of life, art, self-expression, and people. Living my
            best life on the daily by creating the beauty I want to see in the
            world.
          </div>
          <h3>Location</h3>
          <div class="user-location">Pittsburgh, Pennsylvania</div>
          <h3>Favorite beers</h3>
          <div class="favorite-beers">
            <div class="favorited-beer beer-1">Stout</div>
            <div class="favorited-beer beer-2">Pilsner</div>
            <div class="favorited-beer beer-3">Lager</div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {

}
</script>

<style>
.body {
 box-sizing: border-box;
  margin: 0;
  padding: 0;
  background-color: rgb(247, 246, 246);
  font-family: Roboto;
  color: rgba(71, 70, 70, 0.882);
}
.user-profile {
  position: absolute;
  background-image: linear-gradient(
      98deg,
      rgb(247, 246, 246) 50%,
      rgba(255, 255, 255, 0.446)
    ),
    url("../assets/images/PittsburghBackdropMap.jpg");
  background-size: cover;
  background-position: left;
  height: 250vh;
  width: 100vw;
  z-index: 1;
}
.background-gradient {
  position: absolute;
  height: 100%;
  width: 100%;
  background-image: linear-gradient(
    to bottom,
    rgb(247, 246, 246) 10%,
    rgba(255, 255, 255, 0.446)
  );
  z-index: 2;
}
.wrapper {
  position: relative;
  display: flex;
  justify-content: space-between;
  z-index: 9999;
}
.main,
.sidebar {
  padding: 15px;
  background-color: rgba(255, 255, 255, 0);
}
.main {
  width: 60%;
  height: 150vh;
}
.sidebar-left {
  margin: 0 auto;
  width: 25%;
  height: 100vh;
  position: sticky;
  padding-left: 50px;
  padding-right: 50px;
}
.user-profile-picture-container {
  height: 100%;
  width: 100%;
  margin: 0 auto;
  display: flex;
  justify-content: center;
}
.user-profile-picture {
  margin-top: 20px;
  text-align: center;
  width: 50%;
  border-radius: 50%;
  box-shadow: 0px 5px 7px 2px rgba(0, 0, 0, 0.152);
}
.user-info-container {
  height: 100%;
  width: 100%;
  margin: 0 auto;
}
.user-name {
  color: rgba(71, 70, 70, 0.882);
  text-align: center;
  text-transform: none;
  font-weight: 500;
  margin-bottom: 0;
  padding-bottom: 1px;
  font-size: 1.3rem;
}
.user-role {
  color: rgba(71, 70, 70, 0.757);
  text-align: center;
  font-weight: 400;
  margin-top: 0;
  font-size: 1rem;
}
.user-menu-links {
  display: flex;
  flex-direction: column;
  float: left;
  position: relative;
  left: 50%;
}
.user-menu-item {
  color: rgba(71, 70, 70, 0.882);
  font-size: 1.2rem;
  letter-spacing: 0.5px;
  display: flex;
  align-items: center;
  float: left;
  position: relative;
  left: -50%;
  padding-bottom: 10px;
  padding-left: 15px;
}
.user-menu-text-light {
  color: rgba(0, 0, 0, 0.392);
}
.icon {
  width: 20px;
  padding-right: 10px;
  opacity: 50%;
}
.sidebar-right {
  width: 25%;
  height: 100vh;
  position: sticky;
  padding-left: 50px;
  padding-right: 70px;
}
h3 {
  letter-spacing: 1px;
  color: rgba(110, 108, 108, 0.502);
  text-transform: uppercase;
  font-weight: 400;
  font-size: 0.9rem;
  margin-bottom: 4px;
}
.bio-heading {
  margin-top: 50px;
}
.user-biography {
  line-height: 20px;
  padding-bottom: 20px;
}
.user-location {
  padding-bottom: 20px;
}
.favorite-beers {
  display: flex;
  padding: 10px 0;
}
.favorited-beer {
  font-size: 1rem;
  letter-spacing: 0.75px;
  display: inline-block;
  height: 40px;
  line-height: 39px;
  text-align: center;
  padding: 0 20px;
  margin-right: 10px;
  border-radius: 40px;
  color: whitesmoke;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.183);
}
.beer-1 {
  background-color: hsla(271, 76%, 53%, 0.85);
}
.beer-2 {
  background-color: rgba(34, 109, 213, 0.85);
}
.beer-3 {
  background-color: rgba(255, 140, 0, 0.85);
}
.profile-logo-container {
  display: block;
  height: auto;
  width: 100%;
  margin: 0 auto;
  text-align: center;
}

.main-features-container {
  margin-top: 10px;
  border-radius: 5px;
  height: 310px;
  padding-top: 1px;
  background-color: white;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.136);
}
.main-features-fav-title {
  color: rgba(0, 0, 0, 0.537);
  letter-spacing: 1px;
  font-weight: 500;
  font-size: 1.3rem;
  padding: 5px;
  display: flex;
  align-items: center;
}
.main-features-fav-title_icon {
  width: 20px;
  align-self: center;
  padding-left: 5px;
}
.main-feature-fav-list {
  list-style: none;
}
.main-features-fav_icon {
  width: 40px;
  padding-right: 20px;
}
.main-feature-fav-list_item {
  margin-bottom: 10px;
  font-size: 1.5rem;
  display: flex;
  align-items: center;
  margin-right: 35px;
}
.main-feature-fav-list li {
  background-color: rgba(83, 83, 83, 0.072);
  padding: 10px;
  border-radius: 5px;
}
.friends-container {
  border-radius: 5px;
  height: 180px;
  margin-top: 60px;
  padding-top: 16px;
  background-color: white;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.136);
}
.friends-title {
  color: rgba(0, 0, 0, 0.537);
  letter-spacing: 1px;
  font-weight: 500;
  font-size: 1.3rem;
  padding: 5px;
  display: block;
  margin: 0;
  padding-left: 25px;
  margin-left: 20px;
  margin-bottom: 20px;
}

.friends-title_icon {
  width: 30px;
  align-self: center;
  padding-left: 5px;
  transform: translateY(10px);
}
.friends-list {
  padding: 0;
  margin: 0;
  padding-left: 20px;
  padding-right: 20px;
  list-style: none;
  display: flex;
  justify-content: space-around;
  text-align: center;
}
.friends-img {
  width: 70px;
  border-radius: 50%;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.183);
}
.recent-locations-container {
  border-radius: 5px;
  height: 750px;
  margin-top: 30px;
  background-color: white;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.136);
}
.recent-locations_list {
  margin: 16px;
  padding-right: 40px;
  padding-top: 10px;
}
.recent-locations_list h1 {
  color: rgba(0, 0, 0, 0.537);
  letter-spacing: 1px;
  font-weight: 500;
  font-size: 1.3rem;
  padding: 5px;
}
.recent-locations-title_icon {
  width: 30px;
  align-self: center;
  padding-left: 5px;
  transform: translateY(5px);
}

.recent-locations_list li {
  background-color: rgba(83, 83, 83, 0.072);
  padding: 10px;
  border-radius: 5px;
}
.recent-locations-img {
  height: 100px;
  width: 100px;
  padding-right: 20px;
}
</style>