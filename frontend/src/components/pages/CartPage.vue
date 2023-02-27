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
                        <input v-model="coupon" style="text-transform: uppercase" type="text" placeholder="Enter Your Coupon">
                        <button @click.prevent="applyCoupon()" class="normal">Apply</button>
                    </div>
                    <div id=coupon-alert v-if="getCoupon.code != null">
                        <span coupon-applied >Coupon Applied!</span>
                        <span @click="removeDiscount" class="remove">Remove</span>
                    </div>
                </div>
                <div id="subtotal">
                    <h3>Cart Totals</h3>
                    <table>
                        <tr>
                            <td>Cart Subtotal</td>
                            <td>$ {{  formatNumber(getCart.order.total) }}</td>
                        </tr>
                        <tr v-if="getCoupon.amount_off != null && getCoupon.amount_off != 0">
                            <td>Discount</td>
                            <td>$ {{ formatNumber(getCoupon.amount_off) }}</td>
                        </tr>
                        <tr v-else>
                            <td>Discount</td>
                            <td>$ {{ formatNumber(getCart.order.total * (getCoupon.percent_off/100.0)) }}</td>
                        </tr>
                        <tr>
                            <td>Shipping</td>
                            <td>Free</td>
                        </tr>
                        <tr>
                            <td><strong>Total</strong></td>
                            <td v-if="getCoupon.amount_off != null && getCoupon.amount_off != 0"><strong>$ {{  formatNumber(getCart.order.total-getCoupon.amount_off) }} </strong></td>
                            <td v-else><strong>$ {{  formatNumber(getCart.order.total - (getCart.order.total * (getCoupon.percent_off/100.0))) }} </strong></td>
                        </tr>
                    </table>
                    <button @click="checkout" class="normal">Proceed to checkout</button>
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
    data() {
        return {
            coupon: null,
            params: {},
        }
    },
    computed: {
        ...mapGetters(["getAuthToken", "getUserID", "getCart", "getCoupon"]),
    },
    methods: {
        ...mapActions(["getUserCart", "removeItemOrder", "checkoutCart", "checkCoupon", "removeCoupon"]),
        formatNumber (num) {
            return parseFloat(num/100).toFixed(2)
        },
        loadCart() {
            this.getUserCart();
        },
        removeItemFromCart(order_item_id) {
            this.removeItemOrder(order_item_id);
            this.loadCart();
            setTimeout(function () { window.location.reload() }.bind(this), 300)  
        },
        checkout() {
            this.params = {
                promo_code: this.getCoupon.stripe_promotion_code,
            }
            this.checkoutCart(this.params);
        },
        applyCoupon() {
            this.params = {
                promo_code: this.coupon.toUpperCase(),
            }
            this.checkCoupon(this.params);
            this.coupon = null;
        },
        removeDiscount() {
            this.removeCoupon();
        },
    },
    mounted() {
        this.loadCart();
    },
    beforeDestroy() {
        this.removeCoupon();
    }
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
    #coupon-alert {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        padding: 10px;
        width: 200px;
        font-size: 12px;
        font-weight: 400;
        color: #077069;
    }
    #coupon-alert .remove {
        color: blue;
        text-decoration: underline;
        cursor: pointer;
    }
    #coupon-alert .remove:hover {
        color: red;
    }
</style>