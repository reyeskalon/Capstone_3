<template>
    <div id="nav-bar">
        <div id="logo-container" class="item">
            <router-link v-bind:to="{ name: 'home' }"><img src="../assets/pngs/drop_a_pint_logo_transparent.png" alt="" id="logo"></router-link>
        </div>
        <div id="links">
            <div id="logout-container" class="link-container" v-if="$store.state.token != ''">
                <router-link v-bind:to="{ name: 'logout' }"  id="logout" class="link">Sign out</router-link>
            </div>
            <div id="login-container" class="link-container" v-if="$store.state.token == ''">
                <router-link v-bind:to="{ name: 'login' }" id="login" class="link">Log in</router-link>
            </div>
            <div id="register-container" class="link-container" v-if="$store.state.token == ''">
                <router-link v-bind:to="{ name: 'register' }" id="register" class="link">Register</router-link>
            </div>
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
    justify-content: space-between;
    align-items: center;
    background-image: url("https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80");
}

#logo {
    padding: 5px;
    height: 90px;
}

#links {
    display: flex;
}

.link-container {
    height: 15px;
    border: white 2px solid;
    border-radius: 15px;
    margin: 15px;
    padding: 15px;

    display: flex;
    align-items: center;
    justify-content: flex-end;
    padding-right: 15px;
    
}

.link {
    text-decoration: none;
    color: white;
}

#logo-container {
    height: 100px;
}
</style>