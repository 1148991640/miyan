<template>
  <div class="tagslist">
    <el-scrollbar class="scrollbar">
      <el-tag class="item" v-for="(tag,index) in taglist" :key="index" closable size="middle" :type="isActive(tag.path)?'':'info'" effect="dark" @close="clearSingle(tag.path,index)">
        <router-link :to="tag.path">{{tag.name}}</router-link>
      </el-tag>
    </el-scrollbar>
  </div>
</template>

<script>
import { mapMutations, mapGetters } from "vuex";
export default {
  data() {
    return {};
  },
  computed: {
    ...mapGetters({
      taglist: "tagsview/taglist",
    }),
  },
  components: {},
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
      if (this.$route.fullPath === path) {
        this.DEL_TAGS({ index, isActive: true });
      } else {
        this.DEL_TAGS({ index });
      }
    },
  },

  watch: {
    $route: {
      immediate: true,
      deep: true,
      handler(newval) {
        this.SET_TAGS(newval);
      },
    },
  },
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
.tagslist .el-scrollbar /deep/ .el-scrollbar__wrap {
  text-align: left;
}
</style>
