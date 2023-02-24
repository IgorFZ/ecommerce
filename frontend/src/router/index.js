import { createRouter, createWebHistory } from 'vue-router'
import Home from '../components/pages/HomePage.vue'
import Blog from '../components/pages/BlogPage.vue'
import Post from '../components/pages/PostPage.vue'
import Shop from '../components/pages/ShopPage.vue'
import Product from '../components/pages/ProductPage.vue'
import About from '../components/pages/AboutPage.vue'
import Contact from '../components/pages/ContactPage.vue'
import Cart from '../components/pages/CartPage.vue'
import Orders from '../components/pages/OrdersPage.vue'

import Login from '../components/devise/session/Login.vue'
import SignUp from '../components/devise/registration/SignUp.vue'
import Edit from '../components/devise/registration/Edit.vue'

const routes = [
    { path: '/', name: 'Home', component: Home },

    { path: '/login', name: 'Login', component: Login },

    { path: '/sign_up', name: 'Sign Up', component: SignUp },
    
    { path: '/edit', name: 'Edit', component: Edit },

    { path: '/blog', name: 'Blog', component: Blog },

    { path: '/post/:id', name: 'Post', component: Post },

    { path: '/shop', name: 'Shop', component: Shop },

    { path: '/product/:id/:category_id', name: 'Product', component: Product, props: true },

    { path: '/about', name: 'About', component: About },

    { path: '/contact', name: 'Contact', component: Contact },
    
    { path: '/cart', name: 'Cart', component: Cart },

    { path: '/orders', name: 'Orders', component: Orders },
]

const router = createRouter({
    scrollBehavior (to, from, savedPosition) {
        return { top: 0 };
    },
    history: createWebHistory(),
    routes,
})

router.beforeEach((to, from, next) => {
    let localAuthToken = localStorage.auth_token;
    var isAuthenticated = ((localAuthToken != "undefined") && (localAuthToken != null));
    if ((to.name === 'Login' && isAuthenticated) || (to.name === 'Sign Up' && isAuthenticated)) {
        next({ name: 'Home' });
    } else if ((to.name === 'Edit') && (isAuthenticated === false)){
        next({ name: 'Login' })
    } else {
        next()
    }
});
  

export default router