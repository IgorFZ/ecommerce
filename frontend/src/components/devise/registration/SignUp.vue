<template lang="">
    <section id="login" class="section-p1">
        <h3>Sign Up to Cara</h3>
        <div id="login-details">
            <form @submit="onSignUp" class="login-form">
                <label for="email">Full Name:</label>
                <input class="input-form" type="name" v-model="fullName" />
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
            fullName: "",
            email: "",
            password: "",
        }
    },
    methods: {
        ...mapActions(["registerUser"]),
        onSignUp(event) {
            event.preventDefault();
            if (this.email != "" && this.password != "" && this.fullName != "") {
                let data = {
                    user: {
                        full_name: this.fullName,
                        email: this.email,
                        password: this.password,
                    },
                };
                console.log("DATA:")
                console.log(data)
                this.registerUser(data);
                this.resetData();
            } else {
                alert('Invalid Fields!');
            }
        },
        resetData() {
            this.signUpEmail = "";
            this.signUpPassword = "";
        },
    }
}
</script>


<style lang="">
    
</style>