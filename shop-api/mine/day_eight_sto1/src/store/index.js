import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

let store = new Vuex.Store({
  state: {
    msg: "你好",
    userinfo: {
      username: "张飞",
      age: 20,
      class: {
        name: "web大杂烩"
      }
    }
  },
  getters: {
    username(state) {
      return state.userinfo.username;
    },
    age(state) {
      return state.userinfo.age;
    },
    bjmc(state) {
      return state.userinfo.class.name;
    }
  },
  mutations: {
    CHANGEMSG(state, data) {
      state.msg = data;
    }
  },
  actions: {
    changemsg(store, data) {
      console.log(store);
      console.log(data);
      store.commit("CHANGEMSG", 1212131351);
      store.dispatch("hehe");
    },
    hehe() {
      console.log("hehe");
    }
  },
  modules: {}
});

export default store;
