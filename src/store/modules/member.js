// 获取分类列表！
import { getMember } from "@/request/member";
export default {
  namespaced: true,
  state: {
    memberlist: [] // 分类列表
  },
  getters: {
    memberlist: state => state.memberlist
  },
  mutations: {
    SET_LIST(state, data) {
      state.memberlist = data;
    }
  },
  actions: {
    // 请求分类列表的数据！
    async get_member_list({ commit }) {
      let res = await getMember();
      commit("SET_LIST", res);
    }
  }
};
