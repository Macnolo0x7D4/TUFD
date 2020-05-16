import Vue from "vue/dist/vue.esm";
import TurbolinksAdapter from 'vue-turbolinks';
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  var navbar = new Vue({
    el: "#navbar",
    data: {
      isOpen: false,
      profileOpen: false,
    },
    created() {
      const handleEscape = (e) => {
        if (e.key === "Esc" || e.key === "Escape") {
          this.profileOpen = false;
        }
      };

      document.addEventListener("keydown", handleEscape);

      this.$once("hook:beforeDestroy", () => {
        document.removeEventListener("keydown", handleEscape);
      });
    },
  });
});
