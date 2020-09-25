// 获取菜单列表！
import router from "@/router";
let taglist = localStorage.getItem("taglist")
  ? JSON.parse(localStorage.getItem("taglist"))
  : [];
export default {
  namespaced: true,
  state: {
    taglist: taglist,
  },
  getters: {
    taglist: (state) => state.taglist,
  },
  mutations: {
    // 设置标签
    SET_TAGS(state, route) {
      //判断是否已经存在！如果存在就不添加了
      let isExist = state.taglist.some((val) => val.path == route.fullPath);
      if (!isExist) {
        state.taglist.push({
          name: route.meta.title,
          path: route.fullPath,
        });
        localStorage.setItem("taglist", JSON.stringify(state.taglist));
      }
    },
    // 删除某一个
    DEL_TAGS(state, { index, isActive }) {
      if (isActive) {
        // 是激活
        // 跳转到index-1的那个路由地址去！
        state.taglist.splice(index, 1); // 删除对应元素！
        if (state.taglist.length) {
          // 还有值！
          if (index == 0) {
            // 删除第是第一个，那么就向后走，但是其实还是index下标这个，因为数组已经发生变化了
            router.push(state.taglist[index].path);
          } else {
            // 删除的不是第一个，那么就展示前面一个
            router.push(state.taglist[index - 1].path);
          }
        } else {
          // 最一个元素
          router.push("/");
        }
      } else {
        //不是激活
        state.taglist.splice(index, 1);
      }
    },
    DEL_ALL(state) {
      state.taglist = [];
      localStorage.removeItem("taglist");
      router.push("/");
    },
    DEL_OTHER_ALL(state, path) {
      state.taglist = state.taglist.filter((val) => val.path === path);
      localStorage.setItem("taglist", JSON.stringify(state.taglist));
    },
  },
};
