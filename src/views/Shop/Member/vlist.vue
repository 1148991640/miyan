<template>
  <div class="table-bg">
    <el-table :data="memberlist">
      <el-table-column prop="uid" label="用户ID" width="300" align="center"></el-table-column>
      <el-table-column prop="nickname" label="昵称" align="center"></el-table-column>
      <el-table-column prop="phone" label="手机号" align="center"></el-table-column>
      <el-table-column label="注册日期" align="center">
        <template slot-scope="scope">
          {{scope.row.addtime|pixTime}}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button type="primary" size="small" @click="edit(scope.row)" circle icon="el-icon-edit"></el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
export default {
  data() {
    return {};
  },
  computed: {
    ...mapGetters({
      memberlist: "member/memberlist",
    }),
  },
  mounted() {
    if (!this.memberlist.length) {
      this.get_member_list();
    }
  },
  methods: {
    ...mapActions({
      get_member_list: "member/get_member_list",
    }),
    edit(val) {
      this.$emit("edit", { ...val });
    },
  },
  components: {},
};
</script>
<style scoped>
</style>