<template lang="">
    <section id="login" class="section-p1">
        <h3>Sign in to Cara</h3>
        <div id="login-details">
            <form @submit="onLogin" class="login-form">
                <label for="email">Email:</label>
                <input class="input-form" type="email" v-model="loginEmail" />
                <label for="password">Password:</label>
                <input
                    type="password"
                    class="input-form"
                    v-model="loginPassword"
                />
                <span><a href="#">Forgot Password?</a></span>
                <input type="submit" value="Sign In" class="button-form" />
            </form>
        </div>
        <div id="login-new">
            <span>New User? <router-link to="/sign_up">Create an account</router-link></span>
        </div>    
    </section>
</template>


<script>
import '../../../store/index';
import { mapActions, mapGetters } from 'vuex';

export default {
    name: 'Login',
    computed: {
        ...mapGetters(["getAuthToken", "getUserEmail", "getUserID", "isLoggedIn"]),
    },
    data() {
        return {
            loginEmail: "",
            loginPassword: "",
        }
    },
    methods: {
        ...mapActions(["loginUser"]),
        onLogin(event) {
            event.preventDefault();
            if (this.loginEmail != "" && this.loginPassword != "") {
                let data = {
                    user: {
                        email: this.loginEmail,
                        password: this.loginPassword,
                    },
                };
                this.loginUser(data);
                this.resetData();
                this.$router.push({ name: 'Home', query: { redirect: '/' } });
            } else {
                alert('Invalid email or password!');
            }
        },
        resetData() {
            this.loginEmail = "";
            this.loginPassword = "";
        },
    }
}
</script>


<style lang="">
    
</style>