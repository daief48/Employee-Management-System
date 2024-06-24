<template>
    <main class="create-post">
        <div class="container">
            <h1>Create Post!</h1>
            <div class="success-msg" v-if="success">
                <i class="fa fa-check"></i>
                Post created successfully
            </div>
            <!-- Contact Form  -->
            <div class="contact-form">
                <form @submit.prevent="submit">

                    <!-- title  -->
                    <label for="title"><span>Title</span></label>
                    <input type="text" id="title" name="title" v-model="fields.title">
                    <span v-if="errors.title" class="error">{{ errors.title[0] }}</span>
                    <br>
                    <label for="image"><span>Image</span></label>
                    <input type="file" id="image" @change="grabFile">
                    <span v-if="errors.file" class="error">{{ errors.file[0] }}</span>
                    <div class="preview">
                        <img :src="url" alt="">
                    </div>
                    <br>

                    <label for="categories"><span>Choose a category:</span></label>
                    <select name="category_id" id="categories" v-model="fields.category_id">
                        <option disabled value="">Select Option</option>
                        <option :value="category.id" v-for="category in categories" :key="category.id">{{ category.name }}
                        </option>
                    </select>
                    <span v-if="errors.category_id" class="error">{{ errors.category_id[0] }}</span>

                    <br>
                    <label for="body"><span>Body</span></label>
                    <div class="editor">
                        <froala id="edit" :tag="'textarea'" :config="config" v-model:value="fields.body" @input="hello()">
                        </froala>
                    </div>
                    <span v-if="errors.body" class="error">{{ errors.body[0] }}</span>


                    <input type="submit" value="Submit" class="add-post-btn">
                </form>

                <div v-html="fields.body"></div>
            </div>
        </div>
    </main>
</template>

<script>
import axios from 'axios';

export default {

    data() {
        return {
            csrfToken: '{{ csrf_token() }}', // Assign CSRF token here
            config: {
                events: {
                    'image.beforeUpload': function (images) {
                        // Assume there's only one image being uploaded
                        const image = images[0];

                        // Perform upload using FormData
                        const formData = new FormData();
                        formData.append('image', image);

                        // Send AJAX request to upload image
                        axios.post('/api/upload', formData)
                            .then(response => {
                                // Assuming the response contains the URL of the uploaded image
                                const imageUrl = response.data.imageUrl;

                                // Display the uploaded image
                                console.log('Uploaded image URL:', imageUrl);
                            })
                            .catch(error => {
                                console.error('Error uploading image:', error);
                            });

                        // Prevent default upload behavior
                        return true;
                    }
                },
                // imageUploadParam: 'image',
                // imageUploadURL: '/api/upload',
                // imageUploadMethod: 'post',
                // height: 200,
                // imageUploadParams: {id: 1} ,//this is the dynamic ID,
                // imageUploadParams: {
                //     froala: 'true',
                //     _token: 'fHHLSqmaiNHxWMvaMuCf3eZZ7stATUSrfqhJslQW'
                // },

            },
            model: 'Edit Your Content Here!',
            success: false,
            fields: {
                category_id: ""
            },
            errors: {},
            url: "",
            categories: []
        };
    },
    methods: {
        imageUpload(e) {
            console.log(e)
        },
        onEditorChange() {
            console.log(this.content);
        },
        grabFile(e) {
            const file = e.target.files[0];
            this.fields.file = file;
            this.url = URL.createObjectURL(file);
        },
        submit() {
            this.fields.body = JSON.stringify(this.fields.body);
            const formData = new FormData();
            for (const key in this.fields) {
                formData.append(key, this.fields[key]);
            }

            axios.post('/api/posts', formData, {
                headers: { "Content-Type": "multipart/form-data" }
            })
                .then(() => {
                    this.fields = {};
                    this.url = null;
                    this.fields.category_id = "";
                    this.success = true;
                    this.errors = {};

                    setTimeout(() => {
                        this.success = false;
                    }, 2500);
                })
                .catch(error => {
                    this.errors = error.response.data.errors;
                    this.success = false;
                });
        }
    },
    mounted() {
        axios.get('/api/categories')
            .then(response => {
                this.categories = response.data;
            })
            .catch(error => {
                console.error(error);
            });


    }
};
</script>
<style scoped>
.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    height: 243px;
    border-color: var(--ck-color-base-border);
}

.ck-rounded-corners .ck.ck-editor__main>.ck-editor__editable,
.ck.ck-editor__main>.ck-editor__editable.ck-rounded-corners {
    border-radius: var(--ck-border-radius);
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    height: 243px;

}

.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    height: 243px;
    border-color: var(--ck-color-base-border);
}

.create-post {
    background-color: #fff;
    padding: 0 3vw;
}

.container input,
textarea,
select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 20px;
    font-size: 16px;
}

h1 {
    text-align: center;
    padding: 60px 0 50px 0;
}

.add-post-btn {
    background-color: black;
    color: white;
    border: none;
    cursor: pointer;
    transition: 0.3s ease;
}

.add-post-btn:hover {
    transform: translateY(-4px);
}

.preview img {
    max-width: 100%;
    max-height: 120px;
}
</style>