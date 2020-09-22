<template>
  <div>
    <h3>有{{len}}个事情</h3>
    <ul>
      <li v-for="(item,index) in list" :key="index">
        <p>{{item.tit}}........{{item.cot}} <button @click="edit(index,item)">修改</button> <button @click="del(index)">删除</button></p>
      </li>
    </ul>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";
export default {
  props: [],
  data() {
    return {};
  },
  computed: {
    ...mapState(["list"]),
    ...mapGetters(["len"]),
  },
  components: {},
  methods: {
    ...mapActions(["del"]),
    edit(idx, val) {
      console.log(idx);
      console.log(val);
      this.$emit("edit", { idx: idx, data: val });
    },
  },
};
</script>

<style scoped>
li {
  list-style: none;
}
</style>
