<template>
   <div id="backend-view">
        <form @submit.prevent="submit">
            <h3>Sign Up Here</h3>
            <label for="name">Name</label>
            <input type="text" id="name" v-model="fields.name">
            <span v-if="errors.name" class="error">{{ errors.name[0] }}</span>
            <label for="email">Email</label>
            <input type="text" id="email" v-model="fields.email">
            <span v-if="errors.email" class="error">{{ errors.email[0] }}</span>

            <label for="password">Password</label>
            <input type="password" id="password" v-model="fields.password">
            <span v-if="errors.password" class="error">{{ errors.password[0] }}</span>

            <label for="password_confirm">Confirm Password</label>
            <input type="password" id="password_confirmation" v-model="fields.password_confirmation">

            <button type="submit">Sign up</button>
            <span>Don't have an account <a href="">Log In</a></span>
        </form>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    data() {
        return {
            fields: {
                name: '',
                email: '',
                password: '',
                password_confirmation: ''
            },
            errors: {}
        }
    },
    methods: {
    submit() {
        axios.post('/api/register', this.fields)
            .then(() => {
                this.$router.push({ name: "Dashboard" });
            })
            .catch((error) => {
                if (error.response.status === 422) {
                    // Handle validation errors
                    console.log(error.response.data.errors);
                    this.errors = error.response.data.errors;
                } else {
                    // Handle other errors
                    console.error(error);
                }
            });
    }
}

}
</script>

<style scoped>
h3 {
    font-size: 30px;
    text-align: center;
    margin: 50px 0;
    color: black;
}
.overlay {
    /* position: absolute; */
    background-color: rgba(0, 0, 0, 0.5);
    /* top: 93px; */
    padding: 140px;}
#backend-view {
    height: 100vh;
    background-color: #f3f4f6;
    display: grid;
    align-items: center;
    background-image: url('/images/foqm2rlr.png');
    background-size: 100% 100%;

}

form {
    width: 400px;
    background-color: #ffffff;
    margin: 0 auto;
    border-radius: 10px;
    border: 2px solid rgba(255, 255, 255, 0.1);
    padding: 50px 35px;
}

form * {
    letter-spacing: 0.5px;
    outline: none;
}

label {
    display: block;
    margin-top: 20px;
    font-size: 16px;
    font-weight: 500;
    text-align: left;
}

input {
    display: block;
    height: 50px;
    width: 100%;
    border-radius: 3px;
    padding: 0 10px;
    margin-top: 8px;
    font-size: 16px;
    font-weight: 300;
}

button {
    margin-top: 50px;
    width: 100%;
    background-color: rgba(0, 46, 173, 0.7);
    color: #ffffff;
    padding: 15px 0;
    font-size: 18px;
    font-weight: 600;
    border-radius: 5px;
    cursor: pointer;
}

form span {
    display: block;
    margin-top: 35px;
}

a {
    color: rgba(0, 46, 173, 0.8);
}</style>