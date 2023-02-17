<template lang="">
    <section v-if="(getProduct['image_url'] != null || getProduct['image_url'] != undefined)" id="prodetails" class="section-p1">
        <div class="single-pro-image">
            <img :src="getProduct['image_url'][0]" style="width: 100%" id="MainImg" alt="">
            <div class="small-img-group">
                <div :class="{'small-img-col-first': index == 0, 'small-img-col': index > 0}" v-for="(image, index) in getProduct['image_url']">
                    <img :src="getProduct['image_url'][index]" style="width: 100%" class="small-img" alt="">
                </div>
            </div>
        </div>
        <div class="single-pro-details">
            <h6>Home / {{ getCategory['name'] }}</h6>
            <h4> {{ getProduct['name'] }} </h4>
            <span class="brand"> {{ getProduct['brand'] }} </span>
            <Stars :stars="getProduct['stars']" />
            <h2>${{ getProduct['price'] }} </h2>
            <select>
                <option value="">Select Size</option>
                <option value="">XL</option>
                <option value="">XXL</option>
                <option value="">Small</option>
                <option value="">Large</option>
            </select>
            <input type="number" value="1">
            <button class="normal">Add To Cart</button>
            <h4>Product Details</h4>
            <span> {{ getProduct['desc'] }} </span>
        </div>
    </section>
</template>


<script>
import Stars from '../Stars.vue'
import { mapActions, mapGetters } from 'vuex';

export default {
    name: 'Product',
    props: ["id", "category_id"],
    components: {
        Stars,
    },
    computed: {
        ...mapGetters(["getProduct", "getCategory"]),
    },
    methods: {
        ...mapActions(["getProductById", "getCategoryById"]),
        changeImage() {

        }
    },
    mounted() {
        this.getProductById(this.id);
        this.getCategoryById(this.category_id);
    }
}
</script>


<style scoped>
    #prodetails .single-pro-details h4 {
	    padding: 40px 0 5px 0;
    }
    #prodetails .single-pro-details .star,
    #prodetails .single-pro-details .brand {
        font-size: 13px;
    }

    #prodetails .single-pro-details .star {
        padding: 0px 0px 20px 0px;
        color: rgb(243, 181, 25);
    }

</style>