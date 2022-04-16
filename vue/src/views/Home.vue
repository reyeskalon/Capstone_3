<template>
  <div class="home">
    <features />
    <featured-in />
  </div>
</template>

<script>
import FeaturedIn from '../components/FeaturedIn.vue';
import Features from '../components/Features.vue';

export default {
  components: { Features, FeaturedIn },
  name: "home",
};
</script>
