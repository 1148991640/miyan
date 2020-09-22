import Vue from 'vue'
import App from './App'

let bus = new Vue();
Vue.prototype.$bus = bus;

// 导入路由实例！
import router from "./router"

Vue.config.productionTip = false

new Vue({
  el: '#app',
  // router: router,
  router,
  components: { App },
  template: '<App/>'
})
