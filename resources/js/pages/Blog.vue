<template>
  <div class="row">
    <div class="col-8">
      <div>
        <h2 class="">All Blog Posts</h2>
        <div class="searchbar">
          <form action="">
            <input type="text" placeholder="Search..." name="search" v-model="title" />
            <button type="submit">
              <i class="fa fa-search"></i>
            </button>
          </form>
        </div>
        <div class="categories">
          <ul>
            <li v-for="category in categories" :key="category.id">
              <a href="" @click.prevent="filterByCategory(category.name)">{{ category.name }}</a>
            </li>
          </ul>
        </div>

        <section class="cards-blog latest-blog">
          <div class="card-blog-content" v-for="post in posts" :key="post.id">
            <img :src="post.imagePath" alt="" style="height: 215px; width: 100%" />
            <p>
              {{ post.created_at }}
              <span style="float: right">Written By {{ post.user }}</span>
            </p>
            <h4 style="font-weight: bolder">
              <router-link :to="{
              name: 'SingleBlog',
              params: { slug: post.slug },
            }">{{ post.title }}</router-link>
            </h4>
          </div>
        </section>
        <h3 v-if="!posts.length">Sorry, no match was found!</h3>
      </div>

      <div class="pagination" id="pagination">
        <a href="#" v-for="(link, index) in links" :key="index" v-html="link.label"
          :class="{ active: link.active, disabled: !link.url }" @click="changePage(link)"></a>
      </div>
    </div>

    <div class="col-4">
      <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3" style="margin-top: 317px">
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

          <img :src="post.imagePath" style="
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
  emits: ["updateSidbar"],
  data() {
    return {
      posts: [],
      categories: [],
      title: "",
      links: [],
      trending: [],
    };
  },
  methods: {
    filterByCategory(name) {
      axios
        .get("/api/posts", {
          params: {
            category: name,
          },
        })
        .then((response) => {
          this.posts = response.data.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    feature_post_trending() {
      axios
        .get("/api/posts-tending")
        .then((response) => {
          console.log(response.data);
          this.trending = response.data;
          console.log(this.trending)
        })
        .catch((error) => {
          console.error(error);
        });
    },
    changePage(link) {
      if (!link.url || link.active) {
        return;
      }
      axios
        .get(link.url)
        .then((response) => {
          this.posts = response.data.data;
          this.links = response.data.meta.links;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  mounted() {
    axios
      .get("/api/posts")
      .then((response) => {
        this.posts = response.data.data;
        console.log(response.data.meta.links);
        this.links = response.data.meta.links;
      })
      .catch((error) => {
        console.error(error);
      });

    axios
      .get("/api/categories")
      .then((response) => {
        this.categories = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
    this.feature_post_trending();

  },
  watch: {
    title() {
      console.log("Hello");
      axios
        .get("/api/posts", {
          params: {
            search: this.title,
          },
        })
        .then((response) => {
          this.posts = response.data.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
</script>
<style>
h3 {
  font-size: 30px;
  text-align: center;
  margin: 50px 0;
  color: #fff;
}

.disabled {
  pointer-events: none;
}
</style>
