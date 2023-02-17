<template lang="">
    <div>
        <section id="page-header" class="about-header">
            <h2>#cart</h2>
            <p>Lorem ipsum, dolor sit amet consectetur!</p>
        </section>

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
                <tbody>
                    <tr>
                        <td><a href=""><i class="far fa-times-circle"></i></a></td>
                        <td><img src="/src/assets/img/products/f1.jpg" alt=""></td>
                        <td>Cartoon Astronaut T-Shirts</td>
                        <td>$118.19</td>
                        <td><input type="number" value="1"></td>
                        <td>$118.19</td>
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
                <h3>Cat Totals</h3>
                <table>
                    <tr>
                        <td>Cart Subtotal</td>
                        <td>$ 473</td>
                    </tr>
                    <tr>
                        <td>Shipping</td>
                        <td>Free</td>
                    </tr>
                    <tr>
                        <td><strong>Total</strong></td>
                        <td><strong>$ 473</strong></td>
                    </tr>
                </table>
                <button class="normal">Proceed to checkout</button>
            </div>
        </section>
    </div>
</template>
<script>
export default {
    
}
</script>
<style lang="">
    
</style>