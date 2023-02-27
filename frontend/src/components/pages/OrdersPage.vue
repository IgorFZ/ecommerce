<template>
    <div>
        <section id="page-header" class="about-header">
            <h2>#orders</h2>
            <p>Lorem ipsum, dolor sit amet consectetur!</p>
        </section>

        <div v-if="(getOrders.orders != null)">
            <OrdersTable :orders="getOrders.orders"/>
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
import OrdersTable from '../OrderTable.vue'

export default {
    name: 'Cart',
    computed: {
        ...mapGetters(["getOrders"]),
    },
    components: {
        OrdersTable,
    },
    methods: {
        ...mapActions(["getUserOrders"]),
        loadOrders() {
            this.getUserOrders();
        },
    },
    mounted() {
        this.loadOrders();
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