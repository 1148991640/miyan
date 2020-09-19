<template>
  <el-dialog :title="info.isAdd ? '添加秒杀':'修改秒杀'" @close="cancel" :visible.sync="info.isShow" width="68%">
    <!-- 表单 -->
    <el-form :model="forminfo" ref="form" :rules="rules" label-width="100px">
      <el-tabs v-model="activeName">
        <el-tab-pane label="基本信息" name="first">
          <el-row>
            <el-col :span="12" :offset="5">
              <el-form-item label="活动名称" prop="title">
                <el-input v-model="forminfo.goodsname" placeholder="请输入活动名称"></el-input>
              </el-form-item>

              <!--  -->

              <el-form-item label="活动时间">
                <el-date-picker v-model="value1" type="daterange" range-separator="至" start-placeholder="开始日期" end-placeholder="结束日期">
                </el-date-picker>
              </el-form-item>

              <!--  -->
              <el-form-item label="一级分类">
                <el-select v-model="forminfo.first_cateid" @change="topChange" placeholder="请选择">
                  <el-option v-for="item in catelist" :key="item.id" :label="item.catename" :value="item.id">
                  </el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="二级分类">
                <el-select v-model="forminfo.second_cateid" placeholder="请选择">
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
import { addGoods, editGoods } from "@/request/goods";
import { mapGetters, mapActions } from "vuex";
let defaultItem = {
  first_cateid: "",
  second_cateid: "",
  goodsname: "",
  price: "",
  market_price: "",
  img: "",
  description: "",
  specsid: "",
  specsattr: "",
  isnaw: 2,
  ishot: 2,
  status: 1, // 状态1正常2禁用
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
          cs: "13",
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
      attrslist: [],
      value1: "",
      value2: "",
    };
  },
  computed: {
    ...mapGetters({
      catelist: "category/catelist",
      specslist: "specs/specslist",
      goodslist: "goods/goodslist",
    }),
  },
  mounted() {
    if (!this.catelist.length) {
      this.get_category_list();
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
      get_category_list: "category/get_category_list",
      get_specs_list: "specs/get_specs_list",
      get_goods_list: "goods/get_goods_list",
    }),
    see(file) {
      this.dialogVisible = true;
      this.dialogImageUrl = file.url;
      console.log(file);
    },
    change(file, fileList) {
      this.forminfo.img = file.raw;
    },
    remove(file, fileList) {
      this.forminfo.img = "";
    },
    topChange(id) {
      (this.secondlist = []), (this.forminfo.second_cateid = "");
      this.catelist.forEach((val) => {
        if (val.id == id) {
          this.secondlist = val.children;
        }
      });
    },
    specsChange(id) {
      this.attrslist = [];
      this.specslist.forEach((val) => {
        if (val.id == id) {
          this.attrslist = val.attrs;
          console.log("-------------");
          console.log(this.attrslist);
        }
      });
    },
    setinfo(val) {
      if (val.img) {
        this.filelist = [
          {
            name: val.catename,
            url: this.$host + val.img,
          },
        ];
      }
      val.children ? delete val.children : "";
      this.topChange(val.filelist_cateid);
      this.specsChange(val.specsid);
      "firstcatename" in val ? delete val.firstcatename : "";
      "secondcatename" in val ? delete val.secondcatename : "";
      this.$nextTick(() => {
        this.$refs.wangeditor.setHtml(val.description);
      });
      defaultItem = { ...val };

      this.forminfo = { ...val };

      console.log(this.forminfo);
    },
    async sumbit() {
      return;
      this.forminfo.description = this.$refs.wangeditor.getHtml();
      this.$refs.form.validate(async (valid) => {
        if (valid) {
          // 如果验证通过！
          let res;
          let fd = new FormData();
          for (let k in this.forminfo) {
            fd.append(k, this.forminfo[k]);
          }
          if (this.info.isAdd) {
            // 添加还是修改！
            res = await addGoods(fd);
          } else {
            res = await editGoods(fd);
          }
          if (res.code == 200) {
            this.$message.success(res.msg);
            this.info.isShow = false;
            this.get_specs_list(); // 重新获取角色列表！
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
      this.$refs.wangeditor.setHtml("");
    },
  },
  components: {},
};
</script>
<style scoped>
</style>