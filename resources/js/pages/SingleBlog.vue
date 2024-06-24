<template>
  <div class="row">
    <div class="col-8">
      <section class="single-blog-post">
        <h1>{{ post.title }}</h1>

        <div class="time-and-author">
          {{ post.created_at }}
          <span>Written By {{ post.user }}</span>
        </div>

        <div class="single-blog-post-ContentImage" data-aos="fade-left">
          <img :src="`/${post.imagePath}`" alt="" style="width: 401px; height: 387px" />
        </div>
        <div class="about-text mt-4">
          <div v-html="post.body"></div>
        </div>
        <!-- <img src="/images/47e4eff9a1d5750a7111a24329e5347c52981baa.jpg" alt="" srcset=""> -->
      </section>

      <section class="recommended">
        <p>Related</p>
        <div class="recommended-cards">
          <router-link v-for="relatedPost in relatedPosts" :key="relatedPost.id" :to="{
          name: 'SingleBlog',
          params: { slug: relatedPost.slug },
        }">
            <div class="recommended-card">
              <img :src="`/${relatedPost.imagePath}`" alt="" loading="lazy" />
              <h4>{{ relatedPost.title }}</h4>
            </div>
          </router-link>
        </div>
      </section>
    </div>
    <div class="col-4">
      <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
        <h3 class="m-0 text-dark">Categories</h3>
        <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
      </div>
      <div class="position-relative overflow-hidden mb-3" style="height: 80px">
        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-1.jpg" style="object-fit: cover" />
        <a href="" class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
          Business
        </a>
      </div>
      <div class="position-relative overflow-hidden mb-3" style="height: 80px">
        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-2.jpg" style="object-fit: cover" />
        <a href="" class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
          Technology
        </a>
      </div>
      <div class="position-relative overflow-hidden mb-3" style="height: 80px">
        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-3.jpg" style="object-fit: cover" />
        <a href="" class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
          Entertainment
        </a>
      </div>
      <div class="position-relative overflow-hidden" style="height: 80px">
        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-4.jpg" style="object-fit: cover" />
        <a href="" class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
          Sports
        </a>
      </div>

      <div class="pb-3">
        <div class="bg-light py-2 px-4 mb-3">
          <h3 class="m-0">Trending</h3>
        </div>
        <div class="d-flex mb-3" v-for="post in trending" :key="post.id">

          <img :src="`/${post.imagePath}`" style="
                                    width: 100px;
                                    height: 100px;
                                    object-fit: cover;
                                " />
          <div class="w-100 d-flex flex-column justify-content-center bg-light px-3" style="height: 100px">
            <div class="mb-1" style="font-size: 13px">
              <a href="">Technology</a>
              <span class="px-1">/</span>
              <span>January 01, 2045</span>
            </div>
            <router-link :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">
              {{ post.title }}</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  emits: ["updateSidebar"],
  props: ["slug"],
  data() {
    return {
      post: {}, // Change to object
      relatedPosts: [],
      trending: [],

    };
  },
  created() {
    // Use created hook
    this.fetchPostData();
  },
  watch: {
    slug(newValue, oldValue) {
      // If the slug has changed, fetch post data again
      if (newValue !== oldValue) {
        this.fetchPostData();
      }
    },
  },
  mounted() {
    this.feature_post_trending();
  },
  methods: {
    feature_post_trending() {
      axios
        .get("/api/posts-tending")
        .then((response) => {
          console.log(response.data);
          this.trending = response.data;
          console.log(this.trending);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    fetchPostData() {
      axios
        .get("/api/posts/" + this.slug)
        .then((response) => {
          this.post = response.data.data;
          this.post.body = JSON.parse(this.post.body);
        })
        .catch((error) => {
          console.error(error);
        });

      axios
        .get("/api/related-posts/" + this.slug)
        .then((response) => {
          console.log(response);
          this.relatedPosts = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
};
</script>
<style scoped>
.recommended {
  clear: both;
}

.single-blog-post p span {
  float: right;
  width: 100%;
}

.single-blog-post {
  color: white;
}

.time-and-author {
  display: flex;
  justify-content: space-between;
  color: gray;
}

."fr-class-code" {
  color: red !important;
}
</style>
