<template lang="">
    <div>
        <Hero />
        <Feature />
        <Shopping :filterActive="false" />
        <Banner />
        <Shopping />
        <SummerBanner />
        <TripleBanner />
    </div>
</template>


<script>
import Hero from '../banners/Hero.vue';
import Feature from '../banners/Feature.vue';
import Shopping from '../Shopping.vue';
import Banner from '../banners/Banner.vue';
import SummerBanner from '../banners/SummerBanner.vue';
import TripleBanner from '../banners/TripleBanner.vue';

export default {
    name: 'Home',
    components: {
        Hero,
        Feature,
        Shopping,
        Banner,
        SummerBanner,
        TripleBanner,
    },
}
</script>


<style lang="">
    
</style>