import Vue from "vue";
import Vuex from "vuex";

import menu from "./modules/menu";
import role from "./modules/role";
import user from "./modules/user";

import category from "./modules/category";
import specs from "./modules/specs";
import goods from "./modules/goods";

Vue.use(Vuex);

let store = new Vuex.Store({
  state: { iscollapse: false },
  mutations: {
    TOGGLE(state) {
      state.iscollapse = !state.iscollapse;
    }
  },
  modules: { menu, role, user, category, specs, goods }
});

export default store;
