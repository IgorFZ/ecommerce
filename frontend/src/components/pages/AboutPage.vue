<template lang="">
    <div>
        <section id="page-header" class="about-header">
            <h2>#KnowUs</h2>
            <p>Lorem ipsum, dolor sit amet consectetur!</p>
        </section>

        <section id="about-head" class="section-p1">
            <img src="/src/assets/img/about/a6.jpg" alt="">
            <div>
                <h2>Who We Are?</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Numquam eaque ut ullam in. Temporibus, laborum
                    similique praesentium aspernatur quidem blanditiis perferendis obcaecati quaerat, nulla eius velit
                    asperiores aperiam adipisci incidunt!
                </p>
                <abbr title="">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veritatis ullam dolorum iusto
                    atque, provident.
                </abbr>
                <br><br>
                <marquee bgcolor="#ccc" loop="-1"  scrollamount="5" width="100%">Lorem ipsum dolor sit!</marquee>
            </div>
        </section>

        <section id="about-app" class="section-p1">
            <h1>Download Or <a href="#">App</a> </h1>
            <div class="video">
                <video autoplay muted src="/src/assets/img/about/1.mp4"></video>
            </div>
        </section>

        <Feature />
    </div>
</template>


<script>
import Feature from '../banners/Feature.vue'
export default {
    name: 'About',
    components: {
        Feature,
    }
}
</script>
<style lang="">
    
</style>