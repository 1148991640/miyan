<template>
  <div class="b">
    <h3>{{$store.state.msg}}</h3>
    <h4>昵称是：{{$store.state.userinfo.username}}年龄是{{$store.state.userinfo.username}}</h4>
    <h5>班级名称：{{$store.getters.bjmc}}</h5>
  </div>
</template>

<script>
export default {
  props: [],
  data() {
    return {};
  },
  created() {
    console.log(this);
  },
  mounted() {},
  components: {},
  methods: {},
};
</script>

<style scoped>
.b {
  flex: 1;
  height: 400px;
  background-color: yellowgreen;
}
</style>
