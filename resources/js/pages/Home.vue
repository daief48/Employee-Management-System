<template>
    <!-- Top News Slider Start -->
    <!-- {{ product }} -->
    <section class="">
        <div style="width: 91%; margin: auto">
            <div class="row">
                <div class="col-12 p-0 mt-2" style="position: relative">
                    <a class="btn btn-outline-primary prev mr-1" href="#carouselExampleIndicators1" role="button"
                        data-slide="prev" style="left: -54px; position: absolute; top: 17px">
                        <i class="fa fa-arrow-left"></i>
                    </a>
                    <a class="btn btn-outline-primary next mx-1" href="#carouselExampleIndicators1" role="button"
                        data-slide="next" style="right: -54px; position: absolute; top: 17px">
                        <i class="fa fa-arrow-right"></i>
                    </a>
                    <div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item" :class="{ active: index === 0 }"
                                v-for="(chunk, index) in chunkedPosts" :key="index">
                                <div class="row">
                                    <div class="col-md-4 mb-4" v-for="post in chunk" :key="post.id">
                                        <div class="d-flex">
                                            <img :src="post.imagePath" style="
                                                    width: 80px;
                                                    height: 80px;
                                                    object-fit: cover;
                                                " />
                                            <div class="d-flex align-items-center bg-light px-3"
                                                style="height: 80px; width: 100%;">
                                                <router-link
                                                    :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">{{post.title }}</router-link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Top News Slider End -->
    <!-- Main News Slider Start -->
    <div class="container-fluid m-0">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="slideContainer">
                        <div class="Slide" v-for="(slide, index) in feature_posts" :key="index"
                            v-show="index === currentIndex">
                            <router-link :to="{ name: 'SingleBlog', params: { slug: slide.slug }, }">
                                <img :src="slide.imagePath" style="height: 435px" />
                                <div class="Caption">{{ slide.title }}</div>
                            </router-link>
                        </div>

                        <a class="prevBtn" @click="changeSlide(-1)">❮</a>
                        <a class="nextBtn" @click="changeSlide(1)">❯</a>
                    </div>
                    <br />
                    <div style="text-align: center">
                        <span class="Navdot" v-for="(slide, index) in feature_posts" :key="index"
                            @click="currentSlide(index)" :class="{ selected: index === currentIndex }"></span>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                        <h3 class="m-0">Categories</h3>
                        <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
                    </div>
                    <div class="position-relative overflow-hidden mb-3" style="height: 80px">
                        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-1.jpg"
                            style="object-fit: cover" />
                        <a href=""
                            class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
                            Business
                        </a>
                    </div>
                    <div class="position-relative overflow-hidden mb-3" style="height: 80px">
                        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-2.jpg"
                            style="object-fit: cover" />
                        <a href=""
                            class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
                            Technology
                        </a>
                    </div>
                    <div class="position-relative overflow-hidden mb-3" style="height: 80px">
                        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-3.jpg"
                            style="object-fit: cover" />
                        <a href=""
                            class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
                            Entertainment
                        </a>
                    </div>
                    <div class="position-relative overflow-hidden" style="height: 80px">
                        <img class="img-fluid w-100 h-100" src="http://127.0.0.1:8000/img/cat-500x80-4.jpg"
                            style="object-fit: cover" />
                        <a href=""
                            class="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none">
                            Sports
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main News Slider End -->

    <!-- Featured News Slider Start -->
    <div class="container-fluid py-3">
        <div class="container">
            <section class="">
                <div class="container">
                    <div class="row">
                        <div data-v-94144473="" class="container d-flex justify-content-between"
                            style="padding: 11px 0px; background: white">
                            <div class="p-0 m-0">
                                <h3 class="p-0 m-0 ml-2">Featured News</h3>
                            </div>
                            <div class="d-flex align-items-end">
                                <a class="btn btn-primary mr-1" href="#carouselExampleIndicators11" role="button"
                                    data-slide="prev">
                                    <i class="fa fa-arrow-left"></i>
                                </a>
                                <a class="btn btn-primary mx-1" href="#carouselExampleIndicators11" role="button"
                                    data-slide="next">
                                    <i class="fa fa-arrow-right"></i>
                                </a>
                            </div>
                        </div>
                        <div class="col-12 p-0 mt-2">
                            <div id="carouselExampleIndicators11" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item" :class="{ active: index === 0 }"
                                        v-for="(chunk, index) in chunkedFeature" :key="index">
                                        <div class="row">
                                            <div class="col-md-4 mb-4" v-for="post in chunk" :key="post.id">
                                                <router-link :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">

                                                    <div class="card">
                                                        <img class="card-img-top img-fluid h-75" :src="post.imagePath"
                                                            alt="Card image cap" />
                                                        <div class="card-body">
                                                            <h5 class="card-title">
                                                                {{ post.title }}
                                                            </h5>
                                                            <p class="card-text"></p>
                                                        </div>
                                                    </div>
                                                </router-link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <a href="/" class="text-white float-right" style="clear: both">View All</a>
        </div>
    </div>

    <!-- Featured News Slider End -->

    <!-- Category News Slider Start -->
    <div class="container-fluid" style="clear: both">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <section class="pt-5">
                        <div class="container">
                            <div class="row">
                                <div data-v-94144473="" class="container d-flex justify-content-between"
                                    style="padding: 11px 0px; background: white">
                                    <div class="p-0 m-0">
                                        <h3 class="p-0 m-0 ml-2">Product</h3>
                                    </div>
                                    <div class="d-flex align-items-end">
                                        <a class="btn btn-primary mr-1" href="#carouselExampleIndicators111"
                                            role="button" data-slide="prev">
                                            <i class="fa fa-arrow-left"></i>
                                        </a>
                                        <a class="btn btn-primary mx-1" href="#carouselExampleIndicators111"
                                            role="button" data-slide="next">
                                            <i class="fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 p-0 mt-2">
                                    <div id="carouselExampleIndicators111" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item" :class="{ active: index === 0 }" v-for="(
                                                    chunk, index
                                                ) in chunkedProduct" :key="index">
                                                <div class="row">
                                                    <div class="col-md-4 mb-4" v-for="post in chunk" :key="post.id">
                                                        <router-link
                                                            :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">

                                                            <div class="card">
                                                                <img class="img-fluid" alt="100%x280"
                                                                    :src="post.imagePath" style="height: 218px;" />

                                                                <div class="card-body">
                                                                    <h4 class="card-title">
                                                                        {{ post.title }}
                                                                    </h4>
                                                                    <p class="card-text">
                                                                    <div v-html="postParsedContent(post.body)"></div>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </router-link>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="/" class="text-white float-right mb-3">View All</a>
                        </div>
                    </section>
                </div>

                <div class="col-md-6">
                    <section class="pt-5 pb-5">
                        <div class="container">
                            <div class="row">
                                <div data-v-94144473="" class="container d-flex justify-content-between"
                                    style="padding: 11px 0px; background: white">
                                    <div class="p-0 m-0">
                                        <h3 class="p-0 m-0 ml-2">Games</h3>
                                    </div>
                                    <div class="d-flex align-items-end">
                                        <a class="btn btn-primary mr-1" href="#carouselExampleIndicators2" role="button"
                                            data-slide="prev">
                                            <i class="fa fa-arrow-left"></i>
                                        </a>
                                        <a class="btn btn-primary mx-1" href="#carouselExampleIndicators2" role="button"
                                            data-slide="next">
                                            <i class="fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 p-0 mt-2">
                                    <div id="carouselExampleIndicators2" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="row">
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532712938310-34cb3982ef74?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3d2e8a2039c06dd26db977fe6ac6186a" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532771098148-525cefe10c23?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3f317c1f7a16116dec454fbc267dd8e4" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532715088550-62f09305f765?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ebadb044b374504ef8e81bdec4d0e840" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=0754ab085804ae8a3b562548e6b4aa2e" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ee8417f0ea2a50d53a12665820b54e23" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532777946373-b6783242f211?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=8ac55cf3a68785643998730839663129" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532763303805-529d595877c5?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=5ee4fd5d19b40f93eadb21871757eda6" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="/" class="text-white float-right mb-3">View All</a>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <!-- Category News Slider End -->

    <!-- Category News Slider Start -->
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <section class="">
                        <div class="container">
                            <div class="row">
                                <div data-v-94144473="" class="container d-flex justify-content-between"
                                    style="padding: 11px 0px; background: white">
                                    <div class="p-0 m-0">
                                        <h3 class="p-0 m-0 ml-2">Sports</h3>
                                    </div>
                                    <div class="d-flex align-items-end">
                                        <a class="btn btn-primary mr-1" href="#carouselExampleIndicators3" role="button"
                                            data-slide="prev">
                                            <i class="fa fa-arrow-left"></i>
                                        </a>
                                        <a class="btn btn-primary mx-1" href="#carouselExampleIndicators3" role="button"
                                            data-slide="next">
                                            <i class="fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 p-0 mt-2">
                                    <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="row">
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532712938310-34cb3982ef74?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3d2e8a2039c06dd26db977fe6ac6186a" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532771098148-525cefe10c23?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3f317c1f7a16116dec454fbc267dd8e4" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532715088550-62f09305f765?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ebadb044b374504ef8e81bdec4d0e840" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=0754ab085804ae8a3b562548e6b4aa2e" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ee8417f0ea2a50d53a12665820b54e23" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532777946373-b6783242f211?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=8ac55cf3a68785643998730839663129" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532763303805-529d595877c5?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=5ee4fd5d19b40f93eadb21871757eda6" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="/" class="text-white float-right mb-3">View All</a>
                        </div>
                    </section>
                </div>

                <div class="col-md-6">
                    <section>
                        <div class="container">
                            <div class="row">
                                <div data-v-94144473="" class="container d-flex justify-content-between"
                                    style="padding: 11px 0px; background: white">
                                    <div class="p-0 m-0">
                                        <h3 class="p-0 m-0 ml-2">Culture</h3>
                                    </div>
                                    <div class="d-flex align-items-end">
                                        <a class="btn btn-primary mr-1" href="#carouselExampleIndicators4" role="button"
                                            data-slide="prev">
                                            <i class="fa fa-arrow-left"></i>
                                        </a>
                                        <a class="btn btn-primary mx-1" href="#carouselExampleIndicators4" role="button"
                                            data-slide="next">
                                            <i class="fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-12 p-0 mt-2">
                                    <div id="carouselExampleIndicators4" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <div class="row">
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532781914607-2031eca2f00d?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=7c625ea379640da3ef2e24f20df7ce8d" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1517760444937-f6397edcbbcd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=42b2d9ae6feb9c4ff98b9133addfb698" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-4">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532712938310-34cb3982ef74?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3d2e8a2039c06dd26db977fe6ac6186a" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532771098148-525cefe10c23?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=3f317c1f7a16116dec454fbc267dd8e4" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532715088550-62f09305f765?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ebadb044b374504ef8e81bdec4d0e840" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1506197603052-3cc9c3a201bd?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=0754ab085804ae8a3b562548e6b4aa2e" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=ee8417f0ea2a50d53a12665820b54e23" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532777946373-b6783242f211?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=8ac55cf3a68785643998730839663129" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 mb-3">
                                                        <div class="card">
                                                            <img class="img-fluid" alt="100%x280"
                                                                src="https://images.unsplash.com/photo-1532763303805-529d595877c5?ixlib=rb-0.3.5&amp;q=80&amp;fm=jpg&amp;crop=entropy&amp;cs=tinysrgb&amp;w=1080&amp;fit=max&amp;ixid=eyJhcHBfaWQiOjMyMDc0fQ&amp;s=5ee4fd5d19b40f93eadb21871757eda6" />
                                                            <div class="card-body">
                                                                <h4 class="card-title">
                                                                    Special
                                                                    title
                                                                    treatment
                                                                </h4>
                                                                <p class="card-text">
                                                                    With
                                                                    supporting
                                                                    text below
                                                                    as a natural
                                                                    lead-in to
                                                                    additional
                                                                    content.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="/" class="text-white float-right mb-3">View All</a>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <!-- Category News Slider End -->

    <!-- News With Sidebar Start -->
    <div class="container-fluid py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row mb-3">
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                                <h3 class="m-0">Popular</h3>

                                <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3" :class="{ 'position-relative': index === 0, 'd-flex': index !== 0, }"
                                v-for="(post, index) in popular_posts.slice(0, Math.ceil(popular_posts.length / 2))"
                                :key="index" :style="{ height: index !== 0 ? '87px' : '', }">

                                <img :class="{
                                    'img-fluid': index === 0,
                                    'w-100': index === 0,
                                }" :src="post.imagePath" :style="{
                                    'object-fit':
                                        index === 0 ? 'cover' : 'cover',
                                    width: index !== 0 ? '100px' : '',
                                    height: index !== 0 ? '87px' : '227px',
                                }" />

                                <div class="overlay position-relative bg-light">
                                    <div class="mb-2" style="font-size: 14px">
                                        <a href="">Technology</a>
                                        <span class="px-1">/</span>
                                        <span>{{ formatDate(post.created_at) }}</span>
                                    </div>
                                    <router-link :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">

                                        <a class="h4" href="your_link_here"
                                            :style="{ 'font-size': index !== 0 ? '16px' : '' }">{{ post.title }}</a>
                                        <p class="m-0" v-if="index === 0">
                                            Rebum dolore duo et vero ipsum clita,
                                            est ea sed duo diam ipsum, clita at
                                            justo, lorem amet vero eos sed sit...
                                        </p>
                                    </router-link>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3" :class="{
                                    'position-relative': index === 0,
                                    'd-flex': index !== 0,
                                }" v-for="(post, index) in popular_posts.slice(
                                    Math.ceil(popular_posts.length / 2)
                                )" :key="index" :style="{
                                    height: index !== 0 ? '87px' : '',
                                }">
                                <img :class="{
                                    'img-fluid': index === 0,
                                    'w-100': index === 0,
                                }" :src="post.imagePath" :style="{
                                    width: index !== 0 ? '100px' : '',
                                    height: index !== 0 ? '87px' : '227px',
                                }" />
                                <div class="overlay position-relative bg-light">
                                    <div class="mb-2" style="font-size: 14px">
                                        <a href="">Technology</a>
                                        <span class="px-1">/</span>
                                        <span>{{ formatDate(post.created_at) }}</span>
                                    </div>
                                    <router-link :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">
                                        <a class="h4" href="your_link_here"
                                            :style="{ 'font-size': index !== 0 ? '16px' : '' }">{{ post.title }}</a>
                                        <p class="m-0" v-if="index === 0">
                                            Rebum dolore duo et vero ipsum clita,
                                            est ea sed duo diam ipsum, clita at
                                            justo, lorem amet vero eos sed sit...
                                        </p>
                                    </router-link>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3 pb-3">
                        <a href=""><img class="img-fluid w-100" src="http://127.0.0.1:8000/img/ads-700x70.jpg"
                                alt="" /></a>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                                <h3 class="m-0">Latest</h3>
                                <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3" :class="{
                                    'position-relative': index === 0,
                                    'd-flex': index !== 0,
                                }" v-for="(post, index) in posts.slice(
                                    0,
                                    Math.ceil(posts.length / 2)
                                )" :key="index" :style="{
                                    height: index !== 0 ? '87px' : '',
                                }">
                                <img :class="{
                                    'img-fluid': index === 0,
                                    'w-100': index === 0,
                                }" :src="post.imagePath" :style="{
                                    'object-fit':
                                        index === 0 ? 'cover' : 'cover',
                                    width: index !== 0 ? '100px' : '',
                                    height: index !== 0 ? '87px' : '227px',
                                }" />
                                <div class="overlay position-relative bg-light">
                                    <div class="mb-2" style="font-size: 14px">
                                        <a href="">Technology</a>
                                        <span class="px-1">/</span>
                                        <span>{{ formatDate(post.created_at) }}</span>
                                    </div>
                                    <router-link :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">

                                        <a class="h4" href="your_link_here"
                                            :style="{ 'font-size': index !== 0 ? '16px' : '' }">{{ post.title }}</a>
                                        <p class="m-0" v-if="index === 0">
                                            Rebum dolore duo et vero ipsum clita,
                                            est ea sed duo diam ipsum, clita at
                                            justo, lorem amet vero eos sed sit...
                                        </p>
                                    </router-link>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="mb-3" :class="{
                                    'position-relative': index === 0,
                                    'd-flex': index !== 0,
                                }" v-for="(post, index) in posts.slice(
                                    Math.ceil(posts.length / 2)
                                )" :key="index" :style="{
                                    height: index !== 0 ? '87px' : '',
                                }">
                                <img :class="{
                                    'img-fluid': index === 0,
                                    'w-100': index === 0,
                                }" :src="post.imagePath" :style="{
                                    'object-fit':
                                        index === 0 ? 'cover' : 'cover',
                                    width: index !== 0 ? '100px' : '',
                                    height: index !== 0 ? '87px' : '227px',
                                }" />
                                <div class="overlay position-relative bg-light">
                                    <div class="mb-2" style="font-size: 14px">
                                        <a href="">Technology</a>
                                        <span class="px-1">/</span>
                                        <span>{{ formatDate(post.created_at) }}</span>
                                    </div>
                                    <router-link :to="{ name: 'SingleBlog', params: { slug: post.slug }, }">

                                        <a class="h4" href="your_link_here"
                                            :style="{ 'font-size': index !== 0 ? '16px' : '' }">{{ post.title }}</a>
                                        <p class="m-0" v-if="index === 0">
                                            Rebum dolore duo et vero ipsum clita,
                                            est ea sed duo diam ipsum, clita at
                                            justo, lorem amet vero eos sed sit...
                                        </p>
                                    </router-link>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 pt-3 pt-lg-0">
                    <!-- Social Follow Start -->
                    <div class="pb-3">
                        <div class="bg-light py-2 px-4 mb-3">
                            <h3 class="m-0">Follow Us</h3>
                        </div>
                        <div class="d-flex mb-3">
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none mr-2"
                                style="background: #39569e">
                                <small class="fab fa-facebook-f mr-2"></small><small>12,345 Fans</small>
                            </a>
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none ml-2"
                                style="background: #52aaf4">
                                <small class="fab fa-twitter mr-2"></small><small>12,345 Followers</small>
                            </a>
                        </div>
                        <div class="d-flex mb-3">
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none mr-2"
                                style="background: #0185ae">
                                <small class="fab fa-linkedin-in mr-2"></small><small>12,345 Connects</small>
                            </a>
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none ml-2"
                                style="background: #c8359d">
                                <small class="fab fa-instagram mr-2"></small><small>12,345 Followers</small>
                            </a>
                        </div>
                        <div class="d-flex mb-3">
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none mr-2"
                                style="background: #dc472e">
                                <small class="fab fa-youtube mr-2"></small><small>12,345 Subscribers</small>
                            </a>
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none ml-2"
                                style="background: #1ab7ea">
                                <small class="fab fa-vimeo-v mr-2"></small><small>12,345 Followers</small>
                            </a>
                        </div>
                    </div>
                    <!-- Social Follow End -->

                    <!-- Newsletter Start -->
                    <div class="pb-3">
                        <div class="bg-light py-2 px-4 mb-3">
                            <h3 class="m-0">Newsletter</h3>
                        </div>
                        <div class="bg-light text-center p-4 mb-3">
                            <p>
                                Aliqu justo et labore at eirmod justo sea erat
                                diam dolor diam vero kasd
                            </p>
                            <div class="input-group" style="width: 100%">
                                <input type="text" class="form-control form-control-lg" placeholder="Your Email" />
                                <div class="input-group-append">
                                    <button class="btn btn-primary">
                                        Sign Up
                                    </button>
                                </div>
                            </div>
                            <small>Sit eirmod nonumy kasd eirmod</small>
                        </div>
                    </div>
                    <!-- Newsletter End -->

                    <!-- Ads Start -->
                    <div class="mb-3 pb-3">
                        <a href=""><img class="img-fluid" src="http://127.0.0.1:8000/img/news-500x280-4.jpg"
                                alt="" /></a>
                    </div>
                    <!-- Ads End -->

                    <!-- Popular News Start -->
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
                            <div class="w-100 d-flex flex-column justify-content-center bg-light px-3"
                                style="height: 100px">
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
                    <!-- Popular News End -->

                    <!-- Tags Start -->
                    <div class="pb-3">
                        <div class="bg-light py-2 px-4 mb-3">
                            <h3 class="m-0">Tags</h3>
                        </div>
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
                    <!-- Tags End -->
                </div>
            </div>
        </div>
    </div>
    <!-- News With Sidebar End -->

    <!-- Back to Top -->
</template>
<script>
import axios from "axios";
import $ from "jquery";
import { Carousel, initMDB } from "mdb-ui-kit";

initMDB({ Carousel });

export default {
    emits: ["updateSidbar"],
    data() {
        return {
            posts: [],
            feature_posts: [],
            popular_posts: [],
            currentIndex: 0,
            product: [],
            trending: [],
            slides: [
                {
                    image:
                        "https://images.pexels.com/photos/3540375/pexels-photo-3540375.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    caption: "Photo 1",
                },
                {
                    image:
                        "https://images.unsplash.com/photo-1558981001-5864b3250a69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                    caption: "Photo 2",
                },
                {
                    image:
                        "https://images.unsplash.com/photo-1584910758141-f7993f9e203d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80",
                    caption: "Photo 3",
                },
            ],
        };
    },
    mounted() {
        setInterval(() => {
            this.currentIndex += 1;
            if (this.currentIndex >= this.slides.length) {
                this.currentIndex = 0;
            } else if (this.currentIndex < 0) {
                this.currentIndex = this.slides.length - 1;
            }
        }, 3000);

        axios
            .get("/api/posts")
            .then((response) => {
                this.posts = response.data.data;
            })
            .catch((error) => {
                console.error(error);
            });

        this.feature_post();
        this.fetchPostsByCategory("Coding", this.product);
        this.feature_post_popular();
        this.feature_post_trending();
    },
    methods: {
        formatDate(dateTimeString) {
            const date = new Date(dateTimeString);
            const options = { year: "numeric", month: "long", day: "numeric" };
            return date.toLocaleDateString("en-US", options);
        },
        postParsedContent(body) {
            try {
                const parsedBody = JSON.parse(body);
                // Limit to 15 characters
                return parsedBody.substring(0, 54);
            } catch (error) {
                console.error("Error parsing JSON:", error);
                return "";
            }
        },

        fetchPostsByCategory(category, product) {
            axios
                .get(`api/posts-category/${category}`)
                .then((response) => {
                    // Handle successful response
                    product.splice(0, product.length, ...response.data); // Replace array elements with fetched data
                    // console.log(product); // Log the updated product array
                })
                .catch((error) => {
                    // Handle error
                    console.error("Error fetching posts by category:", error);
                });
        },
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
        feature_post_popular() {
            axios
                .get("/api/posts-popular")
                .then((response) => {
                    // console.log(response.data);
                    this.popular_posts = response.data;
                })
                .catch((error) => {
                    console.error(error);
                });
        },
        feature_post() {
            axios
                .get("/api/feature-posts")
                .then((response) => {
                    // console.log(response.data);
                    this.feature_posts = response.data;
                })
                .catch((error) => {
                    console.error(error);
                });
        },
        changeSlide(n) {
            this.currentIndex += n;
            if (this.currentIndex >= this.slides.length) {
                this.currentIndex = 0;
            } else if (this.currentIndex < 0) {
                this.currentIndex = this.slides.length - 1;
            }
        },
        currentSlide(n) {
            this.currentIndex = n;
        },
    },
    computed: {
        chunkedPosts() {
            const chunkSize = 3;
            const resultArray = [];
            let chunk = [];
            for (let i = 0; i < this.posts.length; i++) {
                if (i % chunkSize === 0 && i !== 0) {
                    resultArray.push(chunk);
                    chunk = [];
                }
                chunk.push(this.posts[i]);
            }
            if (chunk.length > 0) {
                resultArray.push(chunk);
            }
            return resultArray;
        },

        chunkedFeature() {
            const chunkSize = 3;
            const resultArray = [];
            let chunk = [];
            for (let i = 0; i < this.feature_posts.length; i++) {
                if (i % chunkSize === 0 && i !== 0) {
                    resultArray.push(chunk);
                    chunk = [];
                }
                chunk.push(this.feature_posts[i]);
            }
            if (chunk.length > 0) {
                resultArray.push(chunk);
            }
            return resultArray;
        },
        chunkedProduct() {
            const chunkSize = 3;
            const resultArray = [];
            let chunk = [];
            for (let i = 0; i < this.product.length; i++) {
                if (i % chunkSize === 0 && i !== 0) {
                    resultArray.push(chunk);
                    chunk = [];
                }
                chunk.push(this.product[i]);
            }
            if (chunk.length > 0) {
                resultArray.push(chunk);
            }
            return resultArray;
        },
    },
};
</script>
<style scoped>
h3 {
    color: black;
}

.carousel-item img {
    height: 441px;
}

* {
    box-sizing: border-box;
}

/* .Slide {
      display: none;
   } */
.Slide img {
    vertical-align: middle;
    width: 100%;
    height: 400px;
}

.slideContainer {
    position: relative;
    margin: auto;
}

.prevBtn {
    position: absolute;
    top: 50%;
    left: 0;
    width: auto;
    padding: 10px;
    background-color: rgb(255, 255, 75);
    color: rgb(50, 0, 116);
    font-weight: bolder;
    font-size: 18px;
    cursor: pointer;
}

.nextBtn {
    position: absolute;
    top: 50%;
    width: auto;
    padding: 10px;
    background-color: rgb(255, 255, 75);
    color: rgb(50, 0, 116);
    font-weight: bolder;
    font-size: 18px;
    cursor: pointer;
}

.nextBtn {
    right: 0;
}

.Caption {
    color: #fbff09;
    font-weight: bold;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    font-size: 25px;
    padding: 8px 12px;
    position: absolute;
    bottom: 8px;
    width: 100%;
    text-align: center;
}

.Navdot {
    cursor: pointer;
    height: 15px;
    width: 15px;
    margin: 0 2px;
    background-color: rgb(54, 5, 117);
    border-radius: 50%;
    display: inline-block;
    transition: background-color 0.6s ease;
}

.selected,
.Navdot:hover {
    background-color: #d9ff00;
}

@media only screen and (max-width: 450px) {

    .prevBtn,
    .nextBtn,
    .Caption {
        font-size: 16px;
    }
}

.card {
    height: 382px;
}

a:hover {
    text-decoration: underline;
    color: blue !important;
}
</style>
