<template>
  <div>
      <section class="section-featured">
        <div class="container-featured">
            <h2 class="heading-featured-in">As featured In</h2>
            <div class="logos">
                <img src="../assets/pngs/fast_company_logo.png" alt="fast_company_logo">
                <img src="../assets/pngs/tech_crunch_logo.png" alt="tech_crunch_logo">
                <img src="../assets/pngs/vice_logo.png" alt="vice_logo">
                <img src="../assets/pngs/wired_logo.png" alt="wired_logo">
                <img src="../assets/pngs/zd_net_logo.png" alt="zd_net_logo">
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
.section-featured {
    padding: 2.4rem 4rem 3.2rem 4rem;
    background-color: blueviolet;
    font-family: Arial, Helvetica, sans-serif;
    
}

.heading-featured-in {
    font-size: 1.2rem;
    text-transform: uppercase;
    letter-spacing: 0.75px;
    font-weight: 700;
    text-align: center;
    margin-bottom: 2.4rem;
    display: block;
}

.logos {
    display: flex;
    justify-content: space-around;
}

.logos img {
    height: 4rem;
    filter: brightness(0);
}

.logos img:nth-child(2) {
    height: 2rem;
    align-self: center;
}
</style>