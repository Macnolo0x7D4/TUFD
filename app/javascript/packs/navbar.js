import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  var navbar = new Vue({
    el: '#navbar',
    data: {
      isOpen: false,
      profileOpen: false
    }
  })
})
