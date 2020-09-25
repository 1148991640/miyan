<template>
  <el-container class="page">
    <el-aside :width="iscollapse ? '64px':'220px'" class="page-nav">
      <left />
    </el-aside>
    <el-container class="page-content">
      <el-header class="page-header">
        <top />
      </el-header>
      <el-main height="" class="page-main">
        <tagslist />
        <!-- Main content -->
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import top from "./top";
import left from "./left";
import tagslist from "./tagslist";
import { mapState } from "vuex";
export default {
  data() {
    return {};
  },
  computed: { ...mapState(["iscollapse"]) },
  components: { top, left, tagslist },
  methods: {},
};
</script>

<style scoped>
.page {
  width: 100vw;
  height: 100vh;
}
.page-nav {
  height: 100%;
  background-color: #444;
}
.page-content {
  height: 100%;
  background-color: #f7f7f7;
}
.page-main {
  position: relative;
  padding-top: 50px;
}
.page-header {
  background-color: #fff;
  box-shadow: 0 0 4px 0 rgba(0, 0, 0, 0.3);
  position: relative;
  z-index: 1000;
}
</style>
