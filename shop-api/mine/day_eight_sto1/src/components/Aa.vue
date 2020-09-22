<template>
  <div class="a">
    <h3>{{$store.state.msg}}</h3>
    <h3>{{$store.getters.username}}</h3>
    <hr>
    {{msg}}
    {{userinfo}}
    <hr>
    {{username}}
    {{age}}
    {{bjmc}}
    <hr>
    <button @click="CHANGEMSG('哈哈哈，111')">修改仓库里面的msg</button>
    <hr>
    <button @click="changemsg('呵呵123')">修改仓库里面的msg</button>
  </div>
</template>

<script>
import { mapState, mapGetters, mapMutations, mapActions } from "vuex";
console.log(mapState(["msg", "userinfo"]));
export default {
  props: [],
  data() {
    return {};
  },
  created() {
    console.log(this);
  },
  mounted() {},
  computed: {
    ...mapState(["msg", "userinfo"]),
    ...mapGetters(["username", "age", "bjmc"]),
  },
  components: {},
  methods: {
    ...mapMutations(["CHANGEMSG"]),
    ...mapActions(["changemsg"]),
  },
};
</script>

<style scoped>
.a {
  flex: 1;
  height: 400px;
  background-color: pink;
}
</style>
