import { createApp } from 'vue';
import './bootstrap';
import '../css/app.css';
// import '../css/main.js';

import App from '../js/App.vue';
import router from './router';
import CKEditor from '@ckeditor/ckeditor5-vue';
//Import Froala Editor 
import 'froala-editor/js/plugins.pkgd.min.js';
//Import third party plugins
import 'froala-editor/js/third_party/embedly.min';
import 'froala-editor/js/third_party/font_awesome.min';
import 'froala-editor/js/third_party/spell_checker.min';
import 'froala-editor/js/third_party/image_tui.min';
// Import Froala Editor css files.
import 'froala-editor/css/froala_editor.pkgd.min.css';
import 'froala-editor/css/froala_style.min.css';

import VueFroala from 'vue-froala-wysiwyg';
import PrimeVue from 'primevue/config';
import Carousel from 'primevue/carousel';

const app = createApp(App) // Pass the root component (App) to createApp
app.use(VueFroala);
app.use(PrimeVue);
app.component('Carousel',Carousel);
app.use(router).mount('#app');
