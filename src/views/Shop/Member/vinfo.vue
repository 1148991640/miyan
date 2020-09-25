<template>
  <el-dialog :title="'修改会员'" @close="cancel" :visible.sync="info.isShow" width="40%">
    <!-- 表单 -->
    <el-form :model="forminfo" ref="form" :rules="rules" label-width="80px">
      <el-form-item label="会员编号" prop="uid">
        <el-input v-model="forminfo.uid" placeholder="请输入会员标号"></el-input>
      </el-form-item>
      <el-form-item label="昵称" prop="nickname">
        <el-input v-model="forminfo.nickname" placeholder="请输入昵称"></el-input>
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="forminfo.phone" placeholder="请输入手机号"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="forminfo.password" :placeholder="info.isAdd?'请输入密码':'留空表示不修改'"></el-input>
      </el-form-item>
      <el-form-item label="状态">
        <el-switch v-model="forminfo.status" :active-value="1" :inactive-value="2"></el-switch>
      </el-form-item>
      <el-form-item label="">
        <el-button type="primary" @click="sumbit">提交</el-button>
        <el-button type="warning" @click="reset">重置</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>
<script>
// 导入  添加和修改的 请求封装方法！
import { editMember } from "@/request/member";
import { mapGetters, mapActions } from "vuex";
let defaultItem = {
  uid: "",
  nickname: "",
  phone: "",
  password: "",
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
        };
      },
    },
  },
  data() {
    return {
      forminfo: { ...defaultItem },
      rules: {
        // 验证规则对象！
        uid: [{ required: true, message: "必填！", trigger: "blur" }],
      },
    };
  },
  methods: {
    ...mapActions({
      get_member_list: "member/get_member_list",
    }),

    setinfo(val) {
      val.password = "";
      defaultItem = { ...val };
      this.forminfo = { ...val };
    },
    async sumbit() {
      // 表单验证！
      this.$refs.form.validate(async (valid) => {
        if (valid) {
          // 如果验证通过！
          let res;
          if (!this.info.isAdd) {
            res = await editMember(this.forminfo);
          }
          if (res.code == 200) {
            this.$message.success(res.msg);
            this.info.isShow = false;
            this.get_member_list(); // 重新获取角色列表！
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
    },
  },
  components: {},
};
</script>
<style scoped>
</style>