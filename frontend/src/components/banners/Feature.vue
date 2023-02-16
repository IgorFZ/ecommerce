<template lang="">
    <section id="feature" class="section-p1">
        <div class="fe-box">
            <img :src="f1" alt="">
            <h6>Free Shipping</h6>
        </div>
        <div class="fe-box">
            <img :src="f2" alt="">
            <h6>Online Order</h6>
        </div>
        <div class="fe-box">
            <img :src="f3" alt="">
            <h6>Save Money</h6>
        </div>
        <div class="fe-box">
            <img :src="f4" alt="">
            <h6>Promotions</h6>
        </div>
        <div class="fe-box">
            <img :src="f5" alt="">
            <h6>Happy Sell</h6>
        </div>
        <div class="fe-box">
            <img :src="f6" alt="">
            <h6>F24/7 Support</h6>
        </div>
    </section>
</template>


<script>
export default {
    name: 'Feature',
    data() {
        return {
            f1: '../src/assets/img/features/f1.png',
            f2: '../src/assets/img/features/f2.png',
            f3: '../src/assets/img/features/f3.png',
            f4: '../src/assets/img/features/f4.png',
            f5: '../src/assets/img/features/f5.png',
            f6: '../src/assets/img/features/f6.png',
        }
    }
}
</script>


<style lang="">
    
</style>