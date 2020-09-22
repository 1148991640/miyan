// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'

Vue.config.productionTip = false

// 给Vue的原型添加上一个属性，将来左右的vue实例和组件实例都会有该属性！
Vue.prototype.$desc = "武哥很帅！来自江南的帅！"

let bus = new Vue();
Vue.prototype.$bus = bus;


/* eslint-disable no-new */
new Vue({
  el: '#app',
  components: { App },
  template: '<App/>'
})
