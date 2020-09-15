<template>
  <div>
    <el-button type="primary" @click="add" class="addm">添加菜单</el-button>
    <v-list @edit="edit"></v-list>
    <v-info :info="info" ref="dialog"></v-info>
  </div>
</template>

<script>
import VList from "./vlist";
import VInfo from "./vinfo";
export default {
  props: [],
  data() {
    return {
      info: {
        // 这是组件的info变量！
        isAdd: false,
        isShow: false,
      },
      list: [],
    };
  },
  components: { VList, VInfo },
  methods: {
    add() {
      this.info.isAdd = this.info.isShow = true;
    },
    edit(val) {
      this.info.isAdd = false;
      this.info.isShow = true;
      // 调用弹框组件的setinfo方法！
      this.$refs.dialog.setinfo(val);
    },
  },
};
</script>

<style scoped>
.addm {
  float: left;
  margin: 0 0 15px 0;
}
</style>
