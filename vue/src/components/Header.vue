<template>
    <div data-animation="default" data-collapse="medium" data-duration="400" data-easing2="ease" role="banner" class="navbar w-nav">
        <div class="container w-container">
            <nav role="navigation" class="nav-menu w-nave-menu">
                <a href="#" class="nav-link w-nav-link">Home</a>
                <a href="#" class="nav-link w-nav-link">About</a>
                <a href="#" class="nav-link w-nav-link">Contact</a>
            </nav>
            <div class="w-nav-button">
                <div class="w-icon-nav-menu"></div>
            </div><img src="../assets/pngs/drop_a_pint_logo.png" loading="lazy" width="79" alt="" class="image-7">
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style>
.navbar {
    background-color: #24c744;
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

.image-7 {
    padding-top: 5px;
    padding-bottom: 5px;
}
</style>