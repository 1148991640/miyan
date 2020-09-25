<template>
  <div class="header">
    <div class="lt">
      <el-button v-if="iscollapse" type="primary" @click="TOGGLE" size="small" class="toggle-btn" icon="el-icon-s-unfold"></el-button>
      <el-button v-else type="primary" size="small" @click="TOGGLE" class="toggle-btn" icon="el-icon-s-fold"></el-button>
      <el-breadcrumb separator="/" class="mbx">
        <el-breadcrumb-item :to="{ path: '/index' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item v-if="$route.meta.title!='后台首页'">{{$route.meta.title}}</el-breadcrumb-item>
      </el-breadcrumb>
      <el-button size="small" v-if="$route.path!='/index'" @click="$router.back()" icon="el-icon-back" circle></el-button>
    </div>
    <div>
      <el-dropdown>
        <span class="el-dropdown-link">
          {{username}}你好！<i class="el-icon-arrow-down el-icon--right"></i>
        </span>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click.native="togglescreenfull"> <i class="el-icon-full-screen"></i> {{isfull?'退出全屏':'全屏操作'}}</el-dropdown-item>
          <el-dropdown-item @click.native="quit"> <i class="el-icon-switch-button"></i> 退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations, mapGetters, mapActions } from "vuex";
import screenfull from "screenfull";
export default {
  data() {
    return {
      isfull: false,
    };
  },
  computed: {
    ...mapState(["iscollapse"]),
    ...mapGetters({ username: "user/username" }),
  },
  components: {},
  methods: {
    ...mapMutations({ TOGGLE: "TOGGLE" }),
    ...mapActions({ quit: "user/quit" }),
    togglescreenfull() {
      if (!screenfull.isEnabled) {
        this.$message.warning("您的浏览器不支持全屏");
        return false;
      }
      this.isfull = !this.isfull;
      screenfull.toggle();
    },
  },
};
</script>

<style scoped>
.header {
  display: flex;
  height: 100%;
  justify-content: space-between;
  align-items: center;
}
.header .lt {
  display: flex;
  align-items: center;
}
.header .mbx {
  margin: 0 20px;
}
</style>
