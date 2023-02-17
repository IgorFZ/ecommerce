import { createRouter, createWebHistory } from 'vue-router'
import Home from '../components/pages/HomePage.vue'
import Blog from '../components/pages/BlogPage.vue'
import Post from '../components/pages/PostPage.vue'

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