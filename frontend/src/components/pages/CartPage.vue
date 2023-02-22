<template lang="">
    <div>
        <section id="page-header" class="about-header">
            <h2>#cart</h2>
            <p>Lorem ipsum, dolor sit amet consectetur!</p>
        </section>

        <div v-if="(getCart.order != null)">
            <section id="cart" class="section-p1">
                <table width="100%">
                    <thead>
                        <tr>
                            <td>Remove</td>
                            <td>Image</td>
                            <td>Product</td>
                            <td>Price</td>
                            <td>Quantity</td>
                            <td>Subtotal</td>
                        </tr>
                    </thead>
                    <tbody v-if="getCart.product != null">
                        <tr v-for="(item, index) in getCart.order_items">
                            <td @click.prevent="removeItemFromCart((getCart['order_items'][index]['id']))"><a href=""><i class="far fa-times-circle"></i></a></td>
                            <td><img :src="getCart['product'][index]['image_url'][0]" alt=""></td>
                            <td> {{ getCart['product'][index]['name'] }} </td>
                            <td>$ {{ formatNumber(getCart['product'][index]['price']) }}</td>
                            <td> {{ getCart['order_items'][index]['quantity'] }} </td>
                            <td>$ {{ formatNumber((getCart['order_items'][index]['quantity']) * (getCart['product'][index]['price'])) }} </td>
                        </tr>
                    </tbody>
                </table>
            </section>
            <section id="cart-add" class="section-p1">
                <div id="coupon">
                    <h3>Apply Coupon</h3>
                    <div>
                        <input type="text" placeholder="Enter Your Coupon">
                        <button class="normal">Apply</button>
                    </div>
                </div>
                <div id="subtotal">
                    <h3>Cart Totals</h3>
                    <table>
                        <tr>
                            <td>Cart Subtotal</td>
                            <td>$ {{  formatNumber(getCart.order.total) }}</td>
                        </tr>
                        <tr>
                            <td>Shipping</td>
                            <td>Free</td>
                        </tr>
                        <tr>
                            <td><strong>Total</strong></td>
                            <td><strong>$ {{  formatNumber(getCart.order.total) }} </strong></td>
                        </tr>
                    </table>
                    <button @click.prevent="checkout" class="normal">Proceed to checkout</button>
                </div>
            </section>
        </div>
        <div v-else class="section-p1">
            <div class="not-found">
                <div>
                    <span>No products at cart.</span>
                </div>
            </div>
        </div>
    </div>
</template>


<script>
import { mapActions, mapGetters } from 'vuex';

export default {
    name: 'Cart',
    props: ["id", "category_id"],
    computed: {
        ...mapGetters(["getAuthToken", "getUserID", "getCart"]),
    },
    methods: {
        ...mapActions(["getCartOrder", "removeItemOrder", "checkoutCart"]),
        formatNumber (num) {
            return parseFloat(num/100).toFixed(2)
        },
        loadCart(user_id) {
            this.getCartOrder(user_id);
        },
        removeItemFromCart(order_item_id) {
            this.removeItemOrder(order_item_id);
            this.loadCart(this.getUserID);
            setTimeout(function () { window.location.reload() }.bind(this), 300)  
        },
        checkout() {
            this.checkoutCart();
        }
    },
    mounted() {
        this.loadCart(this.getUserID);
    },
}
</script>


<style scoped>
    .not-found {
        width: 100%;
        height: 30vh;
        border: 1px solid #cce7d0;
        border-radius: 25px;
        box-shadow: 20px 20px 30px rgba(0, 0, 0, 0.02);
        display: flex;
        overflow: hidden;
    }
    .not-found div {
        margin: auto;
    }
    .not-found span {
        font-size: 15px;
        color: black;
    }
</style>