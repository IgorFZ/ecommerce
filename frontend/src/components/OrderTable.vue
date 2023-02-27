<template>
    <div>
        <section id="cart" class="section-p1" v-for="order in orders" :key="order.id">
            <p class="order">Order: {{ order.id }}</p>
            <table width="100%">
                <thead>
                    <tr>
                        <td><p class="order-status">{{ order.status }}</p></td>
                        <td>Product</td>
                        <td>Quantity</td>
                        <td>Price</td>
                        <td>Subtotal</td>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="product in order.products" :key="product.product_id">
                        <td><img :src="product.image_url" alt=""></td>
                        <td>
                            <router-link class="order-link" :to="{ name: 'Product', params: { id: product.product_id, category_id: product.category_id }}" >
                                {{ (product.name).slice(0, 25) }}
                            </router-link>
                        </td>
                        <td> {{ product.quantity }} </td>
                        <td>$ {{ formatNumber(product.price) }} </td>
                        <td>$ {{ formatNumber(product.quantity * product.price) }} </td>
                    </tr>
                </tbody>
                <thead class="order-total">
                    <tr>
                        <td>TOTAL</td>
                        <td colspan=3></td>
                        <td>$ {{  formatNumber(order.total) }}</td>
                    </tr>
                </thead>
            </table>
        </section>
    </div>
</template>



<script>

export default {
    name: 'TableOrders',
    props: ["orders"],
    methods: {
        formatNumber (num) {
            return parseFloat(num/100).toFixed(2)
        },
    },
}
</script>


<style scoped>
    .order-status {
        margin: 0;
    }
    .order {
        font-size: 13px;
    }
    .order-link {
        color: #456b52;
    }
</style>