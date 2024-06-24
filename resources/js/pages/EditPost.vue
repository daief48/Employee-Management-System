<template>
    <div id="app">
      <img alt="Vue logo" src="./assets/logo.png" width="25%" />
      <quill-editor
        :content="content"
        @change="onEditorChange($event)"
        ref="myQuill"
      >
      </quill-editor>
    </div>
  </template>
  
  <script>
  export default {
    name: "App",
    data() {
      return {
        content: "<h2>I am Example</h2>",
      };
    },
  
    methods: {
      onEditorChange({ quill, html, text }) {
        console.log(text);
      },
    },
  };
  </script>
  
  <style>
  #app {
    font-family: "Avenir", Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 60px;
  }
  </style>
  