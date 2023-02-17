<template lang="">

    <section id="product1">
        <h2>Featured Products</h2>
        <p>Summer Collection New Modern Design</p>

        <Filter :filterAdvancedActive="true" v-if="filterActive" @search="searchProductByName"/>

        <div class="pro-container">
            <div v-if="getProducts[0] != undefined || getProducts[0] != null" class="pro" v-for="product in getProducts" :key="product.id">
                <img :src="product['image_url'][0]" :alt="product['name']">
                <div class="des">
                    <span>{{ product['brand'] }}</span>
                    <h5>{{ product['name'] }}</h5>
                    <div class="star">
                        <div v-for="n in 5" >
                            <i v-if="n <= product['stars']" class="fas fa-star"></i>
                            <i v-if="n > product['stars']" class="fas fa-star" id="gray"></i>
                        </div>
                    </div>
                    <h4>${{ formatNumber(product['price']/100) }}</h4>
                </div>
                <router-link :to="{ name: 'Product', params: { id: product.id, category_id: product.category_id }}">
                    <i class="fal fa-shopping-cart cart"></i>
                </router-link>
            </div>
            <div v-else class="not-found">
                <div>
                    <span>No products found.</span>
                </div>
            </div>
        </div>
    </section>
</template>


<script>
import { mapActions, mapGetters } from 'vuex';
import Filter from './Filter.vue';

export default {
    name: 'Shopping',
    props: {
        filterActive: Boolean,
    },
    data(){
        return {
            linkImage: '../src/assets/img/blog/b1.jpg',
            search_value: null,
        }
    },
    components: { Filter },
    computed: {
        ...mapGetters(["getProducts"]),
    },
    methods: {
        ...mapActions(["getAllProducts"]),
        searchProductByName(searchValue) {
            console.log(searchValue)
            let data = {
                name: searchValue.value,
                mode: searchValue.mode ,
                direction: searchValue.direction,
            }
            this.getAllProducts(data);
        },
        formatNumber (num) {
            return parseFloat(num).toFixed(2)
        },
    },
    mounted() {
        var data = {
            mode: 'stars' ,
            direction: 'desc',
        }
        this.getAllProducts(data);
    }
}
</script>


<style scoped>
    .star {
        display: flex;   
        flex-direction: row;
    }
    #gray {
	font-size: 12px;
	color: rgb(184, 184, 184);
    }
    .not-found {
        width: 100%;
        height: 30vh;
        border: 1px solid #cce7d0;
        border-radius: 25px;
        box-shadow: 20px 20px 30px rgba(0, 0, 0, 0.02);
        display: flex;
    }
    .not-found div {
        margin: auto;
    }
    .not-found span {
        font-size: 15px;
        color: black;
    }
</style>