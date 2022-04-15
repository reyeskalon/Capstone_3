<template>
  <div class="section">
      <div class="text-block">As seen in</div>
      <img class="image-3" src="../assets/pngs/fast_company_logo.png" loading="lazy" alt="">
      <img class="image-4" src="../assets/pngs/tech_crunch_logo.png" loading="lazy" alt="">
      <img class="image-5" src="../assets/pngs/wired_logo.png" loading="lazy" alt="">
      <img class="image-6" src="../assets/pngs/vice_logo.png" loading="lazy" alt="">
      <img class="image-7" src="../assets/pngs/zd_net_logo.png" loading="lazy" alt="">
  </div>
</template>

<script>
export default {

}
</script>

<style>
.section {
    height: 150px;
    border-top: 2px solid #000;
    background-color: #ffd12b;
}

.text-block {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    margin-right: auto;
    margin-left: auto;
    padding-top: 20px;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    color: #000;
    font-size: 16px;
    text-transform: uppercase;
}

.image-3{
    position: relative;
    display: inline-block;
    width: 182px;
    margin-right: 20px;
    margin-left: 133px;
    -o-object-fit: fill;
    object-fit: fill;
}

.image-4 {
    margin-right: 20px;
    width: 213px;
}

.image-5 {
    margin-right: 20px;
    width: 203px;
}

.image-6 {
    margin-right: 20px;
    width: 166px;
}

.image-7 {
    width: 193px;
}

</style>