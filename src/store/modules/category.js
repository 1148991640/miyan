// 获取分类列表！
import { getCategory } from "@/request/category";
export default {
  namespaced: true,
  state: {
    catelist: [] // 分类列表
  },
  getters: {
    catelist: state => state.catelist
  },
  mutations: {
    SET_LIST(state, data) {
      state.catelist = data;
    }
  },
  actions: {
    // 请求分类列表的数据！
    async get_category_list({ commit }) {
      let res = await getCategory();
      commit("SET_LIST", res);
    }
  }
};
