<template>
  <div>
     <h3 ref="tit">我是登录页面</h3>
     <Box ref="box" />
      <hr/>
      <input type="file" ref="img">
      <div id="dd" ref="dd">

      </div>
      <button @click="show">预览！</button>
  </div>
</template>
<script>
import Box from "@/components/Box"
export default {
    data(){
        return{  }
    },
    created(){
      console.log(this.$refs.img)
    },
    mounted() {
      console.log(this.$refs.tit)
       console.log(this.$refs)
    },
    methods:{
      show(){
        console.log(this.$refs)
        console.log(this.$refs.img)
        let file = this.$refs.img.files[0];
        let url = URL.createObjectURL(file);
        let img = new Image();
        img.src = url;
        this.$refs.dd.appendChild(img)

        console.log(this.$refs.box)
        this.$refs.box.msg = "嗨！"
        this.$refs.box.haha();
      }
    },
    components:{
       Box
    }
}



</script>
<style scoped>

</style>