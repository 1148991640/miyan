<template>
  <div>
    <h3>记事本 <button @click="add">添加</button></h3>
    <List @edit="edit" />
    <Info :info="info" ref="info" />
  </div>
</template>

<script>
import Info from "@/components/Info";
import List from "@/components/List";
export default {
  data() {
    return {
      info: {
        show: false,
        isadd: true,
      },
    };
  },
  components: { Info, List },
  methods: {
    add() {
      this.info.show = true;
      this.info.isadd = true;
    },
    edit(val) {
      this.info.show = true;
      this.info.isadd = false;
      this.$refs.info.forminfo = { ...val.data };
      this.$refs.info.changeIndex = val.idx;
    },
  },
};
</script>

<style scoped>
</style>
