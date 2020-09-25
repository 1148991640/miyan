<template>
  <div class="tagslist">
    <el-scrollbar class="scroll-bar">

      <el-tag class="item" v-for="(tag,index) in taglist" :key="index" closable size="small" :type="isActive(tag.path) ? '':'info'" effect="dark" @close="clearSingle(tag.path,index)">
        <router-link :to="tag.path">{{tag.name}}</router-link>
      </el-tag>

    </el-scrollbar>
    <el-dropdown class="tagaction" split-button type="primary" size="mini">
      标签操作
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item @click.native="DEL_ALL">关闭所有</el-dropdown-item>
        <el-dropdown-item @click.native="DEL_OTHER_ALL($route.fullPath)">关闭其他</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>

  </div>
</template>
<script>
import { mapMutations, mapGetters } from "vuex";
export default {
  data() {
    return {
      list: [111, 22, 33, 44, 55, 66],
    };
  },
  computed: {
    ...mapGetters({
      taglist: "tagsview/taglist",
    }),
  },
  watch: {
    $route: {
      immediate: true,
      deep: true,
      handler(newval) {
        // 传入当前地址信息，加入标签数组
        this.SET_TAGS(newval);
      },
    },
  },
  methods: {
    ...mapMutations({
      SET_TAGS: "tagsview/SET_TAGS",
      DEL_TAGS: "tagsview/DEL_TAGS",
      DEL_ALL: "tagsview/DEL_ALL",
      DEL_OTHER_ALL: "tagsview/DEL_OTHER_ALL",
    }),
    isActive(path) {
      return path === this.$route.fullPath;
    },
    clearSingle(path, index) {
      // 删除某一个
      if (this.$route.fullPath === path) {
        // 删除的是激活的标签
        this.DEL_TAGS({ index, isActive: true });
      } else {
        // 不是激活的！
        this.DEL_TAGS({ index });
      }
    },
  },
  components: {},
};
</script>
<style scoped>
.tagslist {
  width: 100%;
  position: absolute;
  left: 0;
  top: 0;
  height: 40px;
  background-color: #fff;
  box-shadow: 0 0 4px 0 rgba(0, 0, 0, 0.3);
  padding: 0 10px;
  box-sizing: border-box;
}
.tagslist .item {
  margin: 6px 4px 0;
}
.tagslist .item a {
  text-decoration: none;
  color: inherit;
  padding: 6px;
}
.tagaction {
  position: absolute;
  right: 10px;
  top: 6px;
}
</style>