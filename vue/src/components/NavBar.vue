<template>
    <div id="nav-bar">
        <div id="logo-container" class="item">
            <router-link v-bind:to="{ name: 'home' }"><img src="../assets/pngs/drop_a_pint_logo_transparent.png" alt="" id="logo"></router-link>
        </div>
        <div id="logout-container" class="item">
            <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" id="logout">Sign out</router-link>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style>
#nav-bar {
    height: 100px;

    display: flex;
    align-items: center;
    background-image: url("https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80");
}

#logo {
    padding: 5px;
    height: 90px;
}

#logout {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 15px;
    border: white 2px solid;
    border-radius: 15px;
    color: white;
    text-decoration: none;
}

#logo-container {
    height: 100px;
}

#logout-container {
    display: flex;
    flex-grow: 1;
    height: 100px;
    justify-content: flex-end;
    align-items: center;
    padding-right: 15px;

}
</style>