<template>
  <div>
    <Header />
    <router-view></router-view>
    <Newsletter />
    <Footer />
  </div>
</template>


<script>
import Header from './components/static/Header.vue'
import Newsletter from './components/static/Newsletter.vue'
import Footer from './components/static/Footer.vue'

export default {
  name: 'App',
  components: {
    Header,
    Newsletter,
    Footer,
  }
}
</script>


<style lang="">
  
</style>