<template>
  <div>
    <button @click="cur='Login'">登录</button>
    <button @click="cur='Layout'">主体</button>
    <component :is="cur"></component>
  </div>
</template>

<script>
import Login from "./pages/Login"
import Layout from "./pages/Layout"
export default {
    data(){
        return{
          cur:'Login'
        }
    },
    created(){
      console.log(this)
      console.log(this.$desc)
      // this.$on('kaixin',function(val){
      //   console.log(val)
      // })
      // setTimeout(() => {
      //     this.$emit('kaixin','😊😊😊😊😊😊😊😊')
      // }, 3000);

    },
    methods:{},
    components:{
      Layout,Login
    }
}

</script>
<style scoped>
</style>