import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'

import * as VueGoogleMaps from 'vue2-google-maps'
Vue.use(VueGoogleMaps, {
  load: {
    key: 'AIzaSyAFvxjkFmpMry87XMtoIS54kWPHqkrAyxg'
  }
})
import GmapCluster from 'vue2-google-maps/src/components/cluster'
Vue.component('GmapCluster', GmapCluster)

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

