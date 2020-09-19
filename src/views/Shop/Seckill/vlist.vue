<template>
  <div class="table-bg">
    <el-table :data="secklist">
      <el-table-column prop="title" label="活动名称" align="center" width="80"></el-table-column>
      <!-- <el-table-column prop="firstcatename" label="一级分类" align="center" width="100"></el-table-column>
      <el-table-column prop="secondcatename" label="二级分类" align="center" width="100"></el-table-column>
      <el-table-column prop="goodsname" label="商品名称" align="center" width="100"></el-table-column> -->
      <el-table-column label="开始时间" align="center">
        <template slot-scope="scope">
          {{scope.row.begintime|pixTime}}
        </template>
      </el-table-column>
      <el-table-column label="结束时间" align="center">
        <template slot-scope="scope">
          {{scope.row.endtime|pixTime}}
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center">
        <template slot-scope="scope">
          <el-tag type="success" v-if="scope.row.status==1">启用</el-tag>
          <el-tag type="danger" v-if="scope.row.status==2">禁用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="修改" width="100" align="center">
        <template slot-scope="scope">
          <el-button type="primary" size="small" @click="edit(scope.row)" circle icon="el-icon-edit"></el-button>
          <el-button type="danger" size="small" @click="del(scope.row.id)" circle icon="el-icon-delete"></el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
import { mapGetters, mapActions } from "vuex";
import { delSeck } from "@/request/seck";
export default {
  data() {
    return {};
  },
  computed: {
    ...mapGetters({
      secklist: "seck/secklist",
      specslist: "specs/specslist",
      goodslist: "goods/goodslist",
    }),
  },
  mounted() {
    if (!this.secklist.length) {
      this.get_seck_list();
    }
    if (!this.specslist.length) {
      this.get_specs_list();
    }
    if (!this.goodslist.length) {
      this.get_goods_list();
    }
  },
  methods: {
    ...mapActions({
      get_seck_list: "seck/get_seck_list",
      get_specs_list: "specs/get_specs_list",
      get_goods_list: "goods/get_goods_list",
    }),
    edit(val) {
      this.$emit("edit", { ...val });
    },
    async del(id) {
      this.$confirm("确认删除吗?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(async () => {
          let res = await delseck(id);
          if (res.code == 200) {
            this.$message.success(res.msg);
            this.get_seck_list(); // 重新获取列表！
          } else {
            this.$message.error(res.msg);
          }
        })
        .catch(() => {});
    },
  },
  components: {},
};
</script>
<style scoped>
</style>