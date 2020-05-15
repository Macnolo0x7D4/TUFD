import Vue from "vue/dist/vue.esm";

document.addEventListener("turbolinks:load", () => {
  var notice = new Vue({
    el: "#banner",
    data: {
      bannerOpen: true,
    },
    created() {
      const handleEscape = (e) => {
        if (e.key === "Esc" || e.key === "Escape") {
          this.bannerOpen = false;
        }
      };

      document.addEventListener("keydown", handleEscape);

      this.$once("hook:beforeDestroy", () => {
        document.removeEventListener("keydown", handleEscape);
      });
    },
  });
});
