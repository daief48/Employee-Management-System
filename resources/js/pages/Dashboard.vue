<template>
    <div id="backend-view">
        <div class="overlay">
            <a id="logout" @click="logout">Log Out</a>
        <h1 id="heading">Dashboard</h1>
        <span>Hi {{ name }} ?</span>
        <div id="links">
            <ul>
                <li>
                    <router-link :to="{name: 'CreatePost'}">Create Post</router-link>
                </li>
                <li>
                    <router-link :to="{name: 'DashboardPostsList'}">Posts List</router-link>
                </li>

                <li>
                    <router-link :to="{name: 'CreateCategory'}">Create Category</router-link>
                </li>
                
                <li>
                    <router-link :to="{name: 'CategoriesList'}">Category List</router-link>
                </li>
            </ul>
        </div>
        </div>
    </div>
</template>
<script>
import axios from 'axios'
export default {
    data() {
        return {
            name: ""
        }
    },
    methods: {
        logout() {
            // axios.post('/api/logout')
            //     .then((response) => {
                    this.$router.push({ name: "Home" });
                    localStorage.removeItem("authenticated");
                    localStorage.removeItem("user");
                    this.$emit('updateSidebar');
                // })
                // .catch((error) => console.log(error));
        }

    },
    mounted() {
        axios.get('/api/user')
            .then((response) => {
                this.name = response.data.name;
            })
            .catch((error) => {
                console.log(error);
                if (error.response && error.response.status === 401) {
                    this.$emit("updateSidebar");
                    localStorage.removeItem("authenticated");
                    this.$router.push({ name: "Login" });
                }
            });
    }
}
</script>
<style scoped>
#backend-view {
    
    text-align: center;
    background-color: #f3f4f6;
    height: 100vh;
    padding-top: 15vh;
    position: relative;
    background-image: url(https://images.unsplash.com/photo-1597557316084-d7f32839141e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y292ZXIlMjBhcnR8ZW58MHx8MHx8fDA%3D);
    background-size: 100% 100%;
}
.overlay {
    /* position: absolute; */
    background-color: rgba(0, 0, 0, 0.5);
    /* top: 93px; */
    padding: 140px;}
#logout {
    position: absolute;
    top: 30px;
    right: 40px;
    cursor: pointer;
    color:white;
}

#heading {
    margin-bottom: 5px;
    color: white;
}

#links {
    margin-top: 30px;
    margin-left: auto;
    margin-right: auto;
    background: #ffffff;
    max-width: 500px;
    padding: 15px;
    border-radius: 15px;
}

#links ul {
    list-style: none;
}

#links a {
    all: revert;
    font-size: 26px;
    display: inline-block;
    margin: 10px 0;
}
</style>