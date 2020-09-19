import Vue from "vue";
import Vuex from "vuex";

import menu from "./modules/menu";
import role from "./modules/role";
import user from "./modules/user";

import category from "./modules/category";
import specs from "./modules/specs";
import goods from "./modules/goods";
import member from "./modules/member";
import banner from "./modules/banner";
import seck from "./modules/seck";

Vue.use(Vuex);

let store = new Vuex.Store({
  state: { iscollapse: false },
  mutations: {
    TOGGLE(state) {
      state.iscollapse = !state.iscollapse;
    }
  },
  modules: { menu, role, user, category, specs, goods, member, seck, banner }
});

export default store;
