import Vue from "vue/dist/vue.esm";
import TurbolinksAdapter from 'vue-turbolinks';
Vue.use(TurbolinksAdapter)

document.addEventListener("turbolinks:load", () => {
  var notice = new Vue({
    el: "#banner",
    data: {
      bannerOpen: true,
    },
  });
});
