<template>
    <div id="nav-bar">
        <router-link v-bind:to="{ name: 'home' }"><img src="../assets/pngs/drop_a_pint_logo_transparent.png" alt="" id="logo"></router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" id="logout"><p>Logout</p></router-link>
    </div>
</template>

<script>
export default {

}
</script>

<style>
#nav-bar {
    background-color:lightgray;
    height: 100px;
    display: flex;
    align-content: center;
    justify-content: stretch;
}

.nav-menu {
    padding-top: 15px;
    color: #fff;
    font-size: 18px;
}

.nav-link {
    color: #fbf9f1;
}

.container {
    padding-bottom: 0px;
    -o-object-fit: cover;
    object-fit: cover;
}

.button {
    border-radius: 3px;
    background-color: #24c744;
}

#logo {
    padding: 5px;
    height: 90px;
}
#logout {
    display: flex;
    align-items: center;
}
</style>