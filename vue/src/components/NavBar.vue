<template>
    <div id="nav-bar">
        <div id="logo-container">
            <div id="circle">
                <router-link v-bind:to="{ name: 'home' }" id="logo-link"><img src="../assets/pngs/drop_a_pint_logo_transparent.png" alt="" id="logo"></router-link>
            </div>
        </div>
        <div id="links">
            <router-link id="test" v-if="$store.state.token != ''" v-bind:to="{ name: 'logout' }" class="link">Sign out</router-link>
            <router-link  v-if="$store.state.token == ''" v-bind:to="{ name: 'login' }" id="login" class="link">Log in</router-link>
            <router-link v-if="$store.state.token == ''" v-bind:to="{ name: 'register' }" id="register" class="link">Register</router-link>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style>
#nav-bar {
    font-family: 'Duru Sans', sans-serif;
    height: 100px;

    display: flex;
    justify-content: space-between;
    align-items: center;
    /* background: rgb(148,35,224);
    background: linear-gradient(25deg, rgba(148,35,224,1) 5%, rgba(255,14,250,1) 52%, rgba(252,176,69,1) 100%); */
    background: black;

    border-bottom: black solid 2px;
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
#circle {
    height: 90px;
    widows: 90px;
    border-radius: 50%;
    border: 5px solid black;
    background: white;
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
</style>