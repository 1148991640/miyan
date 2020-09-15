<template>
  <div>
    <el-button type="primary" @click="add" class="addm">添加管理员</el-button>
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
        isAdd: false,
        isShow: false,
      },
      list: [],
    };
  },
  created() {},
  mounted() {},
  components: { VList, VInfo },
  methods: {
    add() {
      this.info.isAdd = this.info.isShow = true;
    },
    edit(val) {
      this.info.isAdd = false;
      this.info.isShow = true;
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
