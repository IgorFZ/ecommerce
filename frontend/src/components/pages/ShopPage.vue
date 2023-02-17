<template lang="">
    <div>
        <section id="page-header">
            <h2>#stayhome</h2>
            <p>Save more with coupons & up to 70% off!</p>
        </section>
        <Shopping :filterActive="true" :limit='16'/>
    </div>
</template>


<script>
import Shopping from '../Shopping.vue'
export default {
    components: {
        Shopping,
    }
}
</script>


<style lang="">
    
</style>