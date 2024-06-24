import { createRouter, createWebHistory } from "vue-router";

import About from '../pages/About.vue';
import Blog from '../pages/Blog.vue';
import Contact from '../pages/Contact.vue';
import Home from '../pages/Home.vue';
import SingleBlog from '../pages/SingleBlog.vue';
import Login from '../pages/Login.vue';
import Register from '../pages/Register.vue';
import Dashboard from '../pages/Dashboard.vue';
import CreateCategory from '../pages/CreateCategory.vue';
import CategoriesList from '../pages/CategoriesList.vue';
import EditCategories from '../pages/EditCategories.vue';
import CreatePost from '../pages/CreatePost.vue';
import DashboardPostsList from '../pages/DashboardPostsList.vue';
import EditPost from '../pages/EditPost.vue';
import UserPage from '../pages/UserPage.vue';

const routes = [
    {
        path: "/",
        name: "Home",
        component: Home
    },
    {
        path: "/about",
        name: "About",
        component: About
    },
    {
        path: "/blog",
        name: "Blog",
        component: Blog
    },
    {
        path: "/contact",
        name: "Contact",
        component: Contact
    },
    {
        path: "/blog/:slug",
        name: "SingleBlog",
        component: SingleBlog,
        props: true
    },    
    {
        path: "/login",
        name: "Login",
        component: Login,
        meta: { requiresGuest: true }
    },
    {
        path: "/register",
        name: "Register",
        component: Register,
        meta: { requiresGuest: true }
    },
    {
        path: "/dashboard",
        name: "Dashboard",
        component: Dashboard,
        meta: { requiresAuth: true }
    },
    {
        path: "/category/create",
        name: "CreateCategory",
        component: CreateCategory,
        meta: { requiresAuth: true }
    },
    {
        path: "/categories",
        name: "CategoriesList",
        component: CategoriesList,
        meta: { requiresAuth: true }
    },
    {
        path: "/categories/:id/edit",
        name: "EditCategories",
        component: EditCategories,
        meta: { requiresAuth: true },
        props: true
    },
    {
        path: "/posts/create",
        name: "CreatePost",
        component: CreatePost,
        meta: { requiresAuth: true }
    },
    {
        path: "/dashboard-posts",
        name: "DashboardPostsList",
        component: DashboardPostsList,
        meta: { requiresAuth: true }
    },
    {
        path: "/user-posts",
        name: "UserPage",
        component: UserPage,
        meta: { requiresAuth: true }
    },
    {
        path: "/posts/:slug/edit",
        name: "EditPost",
        component: EditPost,
        meta: { requiresAuth: true },
        props: true
    },
];


const router = createRouter({
    history: createWebHistory(),
    routes,
});

router.beforeEach((to, from, next) => {
    
    const authenticated = localStorage.getItem("authenticated");
    const user = JSON.parse(localStorage.getItem('user'));
    console.log(user);
    if (to.meta.requiresGuest && authenticated && user.role === 1) {
        next({ name: "Dashboard" });
    } else if (to.meta.requiresGuest && authenticated && user.role === 0) {
        next({ name: "UserPage" });
    } else if (to.meta.requiresAuth && !authenticated) {
        next({ name: "Login" });
    } else if (to.name === 'Dashboard' && user.role === 0) {
        next({ name: "UserPage" });
    } else if ((to.name === 'CreatePost' || to.name === 'EditPost' || to.name === 'CreateCategory' || to.name === 'EditCategories' || to.name === 'CategoriesList') && user.role === 0) {
        next({ name: "Home" });
    } else {
        next();
    }
});

export default router;
