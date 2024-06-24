<template>
  <div id="wrapper">
    <!-- sidebar -->
    <div class="sidebar" :class="{ showOverlay: overlayVisibility }">
      <span class="closeButton" @click="hideOverlay">&times;</span>
      <img :src="imagePath" alt="TechTrendSpot Logo" class="sidebarImg">
      <p class="brand-title" style="margin: 0;display: flex;justify-content: center;padding: 26px;">
        <a href="" style="color: #343a40;background: #dc3545;padding: 4px;border: 4px blue solid;font-weight: 500;">
          <span data-v-7de8e9d9=""
            style="color: #ec0f0f;background: yellow;padding: 7px;font-weight: bold;">TechTrendSpot</span>
          Blog</a>
      </p>

      <div class="side-links">
        <ul>
          <li>
            <router-link @click=" reloadPage" :to="{ name: 'Home' }">Home</router-link>
          </li>
          <li>
            <router-link @click="hideOverlay" :to="{ name: 'Blog' }">Blog</router-link>
          </li>
          <li>
            <router-link @click="hideOverlay" :to="{ name: 'About' }">About</router-link>
          </li>
          <li>
            <router-link @click="hideOverlay" :to="{ name: 'Contact' }">Contact</router-link>
          </li>
          <li v-if="!loggedIn">
            <router-link @click="hideOverlay" :to="{ name: 'Register' }">Register</router-link>
          </li>
          <li v-if="!loggedIn">
            <router-link @click="hideOverlay" :to="{ name: 'Login' }">Login</router-link>
          </li>
          <li v-if="loggedIn">
            <router-link @click="hideOverlay" :to="{ name: 'Dashboard' }">Dashboard</router-link>
          </li>

          <li v-if="loggedIn">
            <a id="logout" class="btn btn-danger" @click="logout">Log Out</a>
            >
          </li>

        </ul>
      </div>


    </div>
    <!-- Menu Button -->
    <div class="menuButton" @click="ShowOverlay">
      <div class="bar"></div>
      <div class="bar"></div>
      <div class="bar"></div>
    </div>
    <!-- main -->
    <main class="container-fluid">
      <!-- render components depending on the page visited -->

      <router-view @update-sidebar="updateSidebar" @show-edit-success="showEditSuccess" :editSuccess="editSuccess"
        :key="$route.path"></router-view>
    </main>
    <!-- Footer Start -->
    <div class="container-fluid bg-light pt-5 px-sm-3 px-md-5">
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-5">
                <p class="brand-title" style="
                        margin: 0;
                        display: flex;
                        justify-content: center;
                        padding: 26px;
                    ">
                    <a href="" style="
                            color: #343a40;
                            background: #dc3545;
                            padding: 4px;
                            border: 4px blue solid;
                            font-weight: 500;
                        ">
                        <span data-v-7de8e9d9="" style="
                                color: #ec0f0f;
                                background: yellow;
                                padding: 7px;
                                font-weight: bold;
                            ">TechTrendSpot</span>
                        Blog</a>
                </p>
                <p>
                    Volup amet magna clita tempor. Tempor sea eos vero ipsum.
                    Lorem lorem sit sed elitr sed kasd et
                </p>
                <div class="d-flex justify-content-start mt-4">
                    <a class="btn btn-outline-secondary text-center mr-2 px-0" style="width: 38px; height: 38px"
                        href="#"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-outline-secondary text-center mr-2 px-0" style="width: 38px; height: 38px"
                        href="#"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-outline-secondary text-center mr-2 px-0" style="width: 38px; height: 38px"
                        href="#"><i class="fab fa-linkedin-in"></i></a>
                    <a class="btn btn-outline-secondary text-center mr-2 px-0" style="width: 38px; height: 38px"
                        href="#"><i class="fab fa-instagram"></i></a>
                    <a class="btn btn-outline-secondary text-center mr-2 px-0" style="width: 38px; height: 38px"
                        href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="font-weight-bold mb-4">Categories</h4>
                <div class="d-flex flex-wrap m-n1">
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Politics</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Business</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Corporate</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Sports</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Health</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Education</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Science</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Technology</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Foods</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Entertainment</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Travel</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Lifestyle</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="font-weight-bold mb-4">Tags</h4>
                <div class="d-flex flex-wrap m-n1">
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Politics</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Business</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Corporate</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Sports</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Health</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Education</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Science</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Technology</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Foods</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Entertainment</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Travel</a>
                    <a href="" class="btn btn-sm btn-outline-secondary m-1">Lifestyle</a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h4 class="font-weight-bold mb-4">Quick Links</h4>
                <div class="d-flex flex-column justify-content-start">
                    <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right text-dark mr-2"></i>About</a>
                    <a class="text-secondary mb-2" href="#"><i
                            class="fa fa-angle-right text-dark mr-2"></i>Advertise</a>
                    <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right text-dark mr-2"></i>Privacy
                        & policy</a>
                    <a class="text-secondary mb-2" href="#"><i class="fa fa-angle-right text-dark mr-2"></i>Terms &
                        conditions</a>
                    <a class="text-secondary" href="#"><i class="fa fa-angle-right text-dark mr-2"></i>Contact</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid py-4 px-sm-3 px-md-5">
        <p class="m-0 text-center text-white">
            &copy;
            <a class="font-weight-bold" href="#">techtrendspotBlog.com</a>. All
            Rights Reserved.

            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
            Designed by
            <a class="font-weight-bold" href="https://htmlcodex.com">Jubair Islam Daief</a>
        </p>
    </div>
    <!-- Footer End -->

  </div>
</template>
<script>
export default {
  data() {
    return {
      overlayVisibility: false,
      loggedIn: false,
      editSuccess: false,
      imagePath: '/images/Default_TechTrendSpot_4.jpg'

    };
  },
  methods: {
    logout() {
      // axios.post('/api/logout')
      //   .then((response) => {
          this.$router.push({ name: "Home" });
          localStorage.removeItem("authenticated");
          localStorage.removeItem("user");
          this.updateSidebar();
        // })
        // .catch((error) => console.log(error));
    },
    ShowOverlay() {
      this.overlayVisibility = true;
    },

    hideOverlay() {
      this.overlayVisibility = false;
    },
    reloadPage()
    {
      this.overlayVisibility = false;

      this.$router.push('/')
    },
    updateSidebar() {
      this.loggedIn = !this.loggedIn;
    },

    showEditSuccess() {
      this.editSuccess = true;
    },
  },

  mounted() {
    if (localStorage.getItem("authenticated")) {
      this.loggedIn = true;
    } else {
      this.loggedIn = false;
    }
  },
};
</script>
<style scoped>
.sidebarImg {
  border-radius: 167px;
  padding: 28px 28px 0 28px;

}

.showOverlay {
  width: 100%;
  z-index: 5;
}
</style>