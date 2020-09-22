import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

let store = new Vuex.Store({
  state: { list: [] },
  getters: {
    len(state) {
      return state.list.length;
    }
  },
  mutations: {
    ADD(state, data) {
      state.list.push(data);
    },
    EDIT(state, info) {
      let list = state.list.concat([]);
      list[info.idx] = info.data;
      state.list = list;
    },
    DEL(state, idx) {
      state.list.splice(idx, 1);
    }
  },
  actions: {
    getlist() {
      //ajax请求 记事本列表
    },
    add(store, data) {
      store.commit("ADD", data);
    },
    edit({ commit }, data) {
      commit("EDIT", data);
    },
    del({ commit }, idx) {
      commit("DEL", idx);
    }
  },
  modules: {}
});

export default store;
