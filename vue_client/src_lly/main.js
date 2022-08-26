import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import router from './router'
import VueParticles from 'vue-particles'
import  Cookie  from  'js-cookie'

Vue.config.productionTip = false
Vue.use(VueParticles)

new Vue({
  vuetify,
  router,
  render: h => h(App)
}).$mount('#app')
