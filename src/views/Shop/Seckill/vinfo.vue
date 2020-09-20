<template>
  <el-dialog :title="info.isAdd ? '添加秒杀':'修改秒杀'" @close="cancel" :visible.sync="info.isShow" width="68%">
    <!-- 表单 -->
    <el-form :model="forminfo" ref="form" :rules="rules" label-width="100px">
      <el-tabs v-model="activeName">
        <el-tab-pane label="基本信息" name="first">
          <el-row>
            <el-col :span="12" :offset="5">
              <el-form-item label="活动名称" prop="title">
                <el-input v-model="forminfo.title" placeholder="请输入活动名称"></el-input>
              </el-form-item>
              <el-form-item label="活动时间">
                <el-date-picker v-model="value1" type="datetimerange" range-separator="至" start-placeholder="开始日期" end-placeholder="结束日期">
                </el-date-picker>
              </el-form-item>
              <el-form-item label="一级分类">
                <el-select v-model="forminfo.first_cateid" @change="oneChange" placeholder="请选择">
                  <el-option v-for="item in catelist" :key="item.id" :label="item.catename" :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="二级分类">
                <el-select v-model="forminfo.second_cateid" @change="twoChange" placeholder="请选择">
                  <el-option v-for="item in secondlist" :key="item.id" :label="item.catename" :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="选择商品">
                <el-select v-model="forminfo.goodsid" placeholder="请选择">
                  <el-option v-for="item in goodslist" :key="item.id" :label="item.goodsname" :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-col :span="8">
                <el-form-item label="状态">
                  <el-switch v-model="forminfo.status" :active-value="1" :inactive-value="2"></el-switch>
                </el-form-item>
              </el-col>
            </el-col>
          </el-row>
        </el-tab-pane>
      </el-tabs>
      <el-row>
        <el-col :span="8" :offset="7">
          <el-form-item label="">
            <el-button type="primary" @click="sumbit">提交</el-button>
            <el-button type="warning" @click="reset">重置</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </el-dialog>
</template>
<script>
import { editSeck, addSeck } from "@/request/seck";
import { mapGetters, mapActions } from "vuex";
let defaultItem = {
  id: "",
  first_cateid: "",
  second_cateid: "",
  goodsid: "",
  title: "",
  begintime: "",
  endtime: "",
  status: 1, // 状态1正常2禁用
  value1: "",
};
let resetItem = { ...defaultItem };
export default {
  props: {
    info: {
      type: Object,
      default() {
        return {
          isAdd: true,
          isShow: false,
        };
      },
    },
  },
  data() {
    return {
      dialogVisible: false,
      dialogImageUrl: "",
      forminfo: { ...defaultItem },
      rules: {
        // 验证规则对象！
      },
      filelist: [],
      activeName: "first",
      secondlist: [],
      thirdlist: [],
      // value1: [new Date(2000, 10, 10, 10, 10), new Date(2000, 10, 11, 10, 10)],
      value1: [],
    };
  },
  computed: {
    ...mapGetters({
      catelist: "category/catelist",
      goodslist: "goods/goodslist",
      secklist: "seck/secklist",
    }),
  },
  mounted() {
    if (!this.catelist.length) {
      this.get_category_list();
    }
    if (!this.goodslist.length) {
      this.get_goods_list();
    }
    if (!this.secklist.length) {
      this.get_seck_list();
    }
  },
  methods: {
    ...mapActions({
      get_category_list: "category/get_category_list",
      get_goods_list: "goods/get_goods_list",
      get_seck_list: "seck/get_seck_list",
    }),
    see(file) {
      this.dialogVisible = true;
    },
    oneChange(id) {
      this.secondlist = [];
      this.forminfo.second_cateid = "";
      this.catelist.forEach((val) => {
        if (val.id == id) {
          this.secondlist = val.children;
        }
      });
      console.log(this.secondlist);
    },
    twoChange(id) {
      this.thirdlist = [];
      this.forminfo.goodsid = "";
      this.goodslist.forEach((val) => {
        if (val.id == id) {
          this.thirdlist = val.children;
        }
      });
      console.log(this.thirdlist);
    },
    setinfo(val) {
      val.children ? delete val.children : "";
      this.oneChange(val.first_cateid);
      // this.twoChange(val.second_cateid);
      "firstcatename" in val ? delete val.firstcatename : "";
      "secondcatename" in val ? delete val.secondcatename : "";
      // "goodsname" in val ? delete val.goodsname : "";
      defaultItem = { ...val };
      this.forminfo = { ...val };
    },
    async sumbit() {
      this.$refs.form.validate(async (valid) => {
        if (valid) {
          let res;
          let fd = new FormData();
          for (let k in this.forminfo) {
            fd.append(k, this.forminfo[k]);
          }
          if (this.info.isAdd) {
            res = await addSeck(fd);
          } else {
            res = await editSeck(fd);
          }
          if (res.code == 200) {
            this.$message.success(res.msg);
            this.info.isShow = false;
            this.get_seck_list();
            this.cancel();
          } else {
            this.$message.error(res.msg);
          }
        }
      });
    },
    reset() {
      if (this.info.isAdd) {
        // 添加时候的重置！
        this.forminfo = { ...resetItem };
      } else {
        // 修改时候的重置！
        this.setinfo({ ...defaultItem });
      }
    },
    cancel() {
      this.forminfo = { ...resetItem };
      this.filelist = [];
    },
  },
  components: {},
};
</script>
<style scoped>
</style>