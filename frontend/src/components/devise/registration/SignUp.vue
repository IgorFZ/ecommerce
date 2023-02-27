<template lang="">
    <section id="login" class="section-p1">
        <h3>Sign Up to Cara</h3>
        <div id="login-details">
            <form @submit="onSignUp" class="login-form">
                <label for="email">Full Name:</label>
                <input class="input-form" type="name" v-model="full_name" />
                <label for="email">Email:</label>
                <input class="input-form" type="email" v-model="email" />
                <label for="password">Password:</label>
                <input
                    type="password"
                    class="input-form"
                    v-model="password"
                />
                <span><a href="#">Forgot Password?</a></span>
                <input type="submit" value="Sign Up" class="button-form" />
            </form>
        </div>
        <div id="login-new">
            <span>Have an account? <router-link to="/login">Login</router-link></span>
        </div>


        
    </section>
</template>


<script>
import '../../../store/index';
import { mapActions} from 'vuex';

export default {
    name: 'SignUp',
    data() {
        return {
            full_name: "",
            email: "",
            password: "",
        }
    },
    methods: {
        ...mapActions(["registerUser"]),
        onSignUp(event) {
            event.preventDefault();
            if (this.email != "" && this.password != "" && this.full_name != "") {
                let data = {
                    user: {
                        full_name: this.full_name,
                        email: this.email,
                        password: this.password,
                    },
                };
                this.registerUser(data);
                this.resetData();
            } else {
                alert('Invalid Fields!');
            }
        },
        resetData() {
            this.full_name = "";
            this.email = "";
            this.password = "";
        },
    }
}
</script>


<style lang="">
    
</style>