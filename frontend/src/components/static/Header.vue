<template lang="">
    <section id="header">
        <a href="#"><img :src="logoLink" class="logo" alt="Store Tek Logo"></a> 
        <div>
            <ul id="navbar" v-bind:class="{ active: isActive }">
                <li><router-link :class="{'active': currentRouteName == 'Home'}" to="/">Home</router-link></li>
                <li><router-link :class="{'active': currentRouteName == 'Shop'}" to="/shop">Shop</router-link></li>
                <li><router-link :class="{'active': currentRouteName == 'Blog'}" to="/blog">Blog</router-link></li>
                <li><router-link :class="{'active': currentRouteName == 'About'}" to="/about">About</router-link></li>
                <li><router-link :class="{'active': currentRouteName == 'Contact'}" to="/contact">Contact</router-link></li>
                <div v-if="isLoggedIn" class="dropdown">
                    <div>
                        <li><router-link class="dropbtn" to="/">Hello, {{ (this.getUserName).split(' ')[0] }}</router-link></li>
                        <div class="dropdown-content">
                            <router-link to="/orders">
                                <i class="fas fa-clipboard-list"></i>
                                <span>Orders</span>
                            </router-link>
                            <router-link to="/edit">
                                <i class="fas fa-user-edit"></i>
                                <span>Account</span>
                            </router-link>
                            <router-link to="/">
                                <i class="far fa-times-circle"></i>
                                <span @click="logoutUser" >Logout</span>
                            </router-link>
                        </div>
                    </div>
                    <li id="lg-bag"> 
                        <router-link to="/cart">
                            <i class="far fa-shopping-bag"></i>
                        </router-link>
                    </li>
                </div>
                <div v-else style="display: flex">
                    <li><router-link :class="{'active': currentRouteName == 'Sign Up'}" to="/sign_up">Sign Up</router-link></li>
                    <li><router-link :class="{'active': currentRouteName == 'Login'}" to="/login">Login</router-link></li>
                </div>
                <a href="#" id="close" @click="nav" class="fas fa-times"></a>
            </ul>
        </div>
        <div id="mobile">
            <router-link to="/cart"> <i class="far fa-shopping-bag"></i> </router-link>
            <i id="bar" @click="nav" class="fas fa-outdent" ></i>
        </div>
    </section>
</template>




<script>
import { mapGetters, mapActions } from 'vuex';

export default {
    data() {
        return {
            isActive: false,
            logoLink: '/src/assets/img/logo.png',
        }
    },
    computed: {
        ...mapGetters(["getAuthToken", "getUserEmail", "getUserID", "isLoggedIn", "getUserName"]),
        currentRouteName() {
            return this.$route.name;
        }
    },
    methods: {
        ...mapActions(["registerUser", "loginUser", "logoutUser"]),
        nav() {
            this.isActive = !this.isActive
        },
    },
}

const bar = document.getElementById('bar');
const close = document.getElementById('close');
const nav = document.getElementById('navbar');

if (bar) {
    bar.addEventListener('click', () => {
        nav.classList.add('active');
    })
}

if (close) {
    close.addEventListener('click', () => {
        nav.classList.remove('active');
    })
}
</script>





<style scoped>
.dropdown {
    float: left;
    overflow: hidden;
    display: flex;
}
.dropdown #dropbtn {
    font-size: 16px;
    border: none;
    outline: none;
    padding: 14px 16px;
    background-color: inherit;
    font-family: inherit; /* Important for vertical align on mobile phones */
    margin: 0; /* Important for vertical align on mobile phones */
}
/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
    color: #088178;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
    display: none;
    position: absolute;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    background: #e3e6f3;
}

/* Links inside the dropdown */
.dropdown-content a {
    font-size: 14px;
    font-weight: 500;
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    padding-left: 20px;
}

/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
    color: #088178;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

.fas,
.far{
    width: 25px;
    font-size: 15px
}

</style>