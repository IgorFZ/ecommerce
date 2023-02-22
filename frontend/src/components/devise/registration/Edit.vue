<template lang="">
    <section id="login" class="section-p1 hg-90">
        <h3>Update Your Account</h3>
        <div id="login-details">
            <form @submit="editUser" class="login-form">
                <label for="name">Full Name:</label>
                <input class="input-form" type="name" v-model="full_name" />
                <input type="submit" value="Update" class="button-form" />
            </form>
        </div>     
    </section>
</template>


<script>
import '../../../store/index';
import { mapActions, mapGetters } from 'vuex';

export default {
    name: 'Edit',
    computed: {
        ...mapGetters(["getAuthToken", "getUserEmail", "getUserID", "isLoggedIn", "getUserName"]),
    },
    data() {
        return {
            full_name: "",
        }
    },
    methods: {
        ...mapActions(["editUserInfo"]),
        editUser(event) {
            event.preventDefault();
            if (this.full_name != "") {
                let data = {
                    user: {
                        full_name: this.full_name,
                    },
                };
                this.editUserInfo(data)
            } else {
                alert('Invalid Fields!');
            }
        },
    }
}
</script>


<style scoped>
    
.hg-90 {
    height: 60vh;
}

</style>