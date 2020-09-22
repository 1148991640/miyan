<template>
  <div class="alert" v-if="info.show">
    <div class="title">{{info.isadd?"增加":"修改"}}</div>
    <div class="content">
      <p>标题：<input type="text" v-model="forminfo.tit"></p>
      <p>内容：<input type="text" v-model="forminfo.cot"></p>
    </div>
    <div class="bot">
      <button @click="submit">确定</button>
    </div>
  </div>
</template>

<script>
import { mapActions } from "vuex";
let defaultItem = { tit: "", cot: "" };
export default {
  props: {
    info: {
      type: Object,
    },
  },
  data() {
    return {
      changeIndex: null,
      forminfo: { ...defaultItem },
    };
  },
  components: {},
  methods: {
    ...mapActions(["add", "edit"]),
    submit() {
      console.log("组件的submit事件");
      if (this.info.isadd) {
        this.add({ ...this.forminfo });
      } else {
        let data = {
          idx: this.changeIndex,
          data: { ...this.forminfo },
        };
        this.edit(data);
      }
      this.forminfo = { ...defaultItem };
      this.info.show = false;
    },
    setinfo(val) {
      console.log(val);
      console.log("setinfosetinfosetinfo");
      this.forminfo = { ...val.data };
      this.changeIndex = val.idx;
    },
  },
};
</script>

<style scoped>
.alert {
  background-color: #fff;
  width: 300px;
  border: 2px solid blue;
  box-shadow: 0 0 3px 0 rgba(0, 0, 0, 0.3);
  position: fixed;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
.title {
  background-color: #eee;
  line-height: 40px;
}
.content {
  padding: 40px 20px;
}
.bot {
  line-height: 40px;
  text-align: center;
}
</style>
