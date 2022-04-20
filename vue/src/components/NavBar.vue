<template>
    <div id="nav-bar">
        <div id="logo-container">
            <div id="circle">
                <router-link v-bind:to="{ name: 'home' }" id="logo-link"><img src="../assets/icons/DAP-logo.png" alt="" id="logo"></router-link>
            </div>
        </div>
        <div id="beer-brewery">
            <router-link v-bind:to="{ name: 'allbeers' }" id="all-beers-link">Beers</router-link>
            <p id="line">|</p>
            <router-link v-bind:to="{ name: 'allbreweries' }" id="all-breweries-link">Breweries</router-link>
        </div>
        <div id="links">
            <router-link id="test" v-if="$store.state.token != ''" v-bind:to="{ name: 'logout' }" class="link">Sign out</router-link>
            <router-link  v-if="ShowLogin" v-bind:to="{ name: 'login' }" id="login" class="link">Log in</router-link>
            <router-link v-if="$store.state.token == ''" v-bind:to="{ name: 'register' }" id="register" class="link">Register</router-link>
            <router-link id="profile" v-if="$store.state.token != ''" v-bind:to="{ name: 'beerlover' }"><img id="profile_icon" src="../assets/images/profile_icon_removebg_white.png" alt=""></router-link>
        </div>
    </div>
</template>

<script>
export default {
    computed: {
        ShowLogin(){
            return (this.$store.state.token == '')
        },
        ShowRegister(){
            return true
        },
        ShowProfile(){
            return true;
        }
    }

}
</script>

<style>
#nav-bar {
    font-family: 'Duru Sans', sans-serif;
    height: 100px;

    display: flex;
    justify-content: space-between;
    align-items: center;
    background: black;

    border-bottom: white solid 2px;
}
#logo-link{
    height: 90px;
    width: 90px;
}
#logo {
    height: 80px;
    widows: 80px;
    padding: 5px;
}
#logo:hover {
    transform: scale(1.05);
}
#logo:active {
    transform: scale(1);
}
#logo:hover:after {
    transform: scale(1);
}

#circle {
    height: 90px;
    widows: 90px;
    border-radius: 50%;
    border: 5px solid black;
    background-color: white;
    background-image: linear-gradient(135deg, rgb(255, 255, 255), rgb(68, 228, 240), blueviolet, pink);
    display: flex;
    align-items: center;
    justify-content: center;
}
#links {
    display: flex;
}

#logo-container {
    height: 90px;
    widows: 90px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-left: 15px;
}
.link {
    display: flex;
    align-items: center;

    margin: 18px;
    padding: 10px;

    text-decoration: none;
    color: white;
    font-size: 25px;

    border: solid 3px white;
    border-radius: 15px;

    transition: background .5s;
    transition: color .5s;

}
.link:hover {
    background: white;
    color: black;
}

.link:active {
    transform: scale(.95);
}

#profile_icon {
    height: 90px;
}
#beer-brewery{
    display: flex;
    color: white;
    justify-content: center;
    align-items: center;
    font-size: 35px;
}
#all-beers-link{
    display: flex;
    justify-content: center;
    text-decoration: none;
    color: white;
    padding-right: 40px;
}
#all-breweries-link{
    color:white;
    display: flex;
    justify-content: center;
    text-decoration: none;
    padding-left: 40px;
}
#all-breweries-link:hover{
    transform: scale(1.1);
}

#all-breweries-link:active {
    transform: scale(1.05);
}
#all-beers-link:hover{
    transform: scale(1.1);
}
#all-beers-link:active {
    transform: scale(1.05);
}
#line{
    font-size: 50px;
}
</style>