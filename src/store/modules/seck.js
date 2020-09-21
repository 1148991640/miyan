// 获取秒杀列表！
import { getSeck } from "@/request/seck";

export default {
  namespaced: true,
  state: {
    secklist: [] // 秒杀列表
  },
  getters: {
    secklist: state => state.secklist
  },
  mutations: {
    SET_LIST(state, data) {
      state.secklist = data;
    }
  },
  actions: {
    // 请求秒杀列表的数据！
    async get_seck_list({ commit, state, dispatch }) {
      let res = await getSeck();
      commit("SET_LIST", res);
    }
  }
};
