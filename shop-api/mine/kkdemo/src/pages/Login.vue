<template>
  <div>
      <h3>登录页面</h3>
      <p>账号：<input type="text" v-model="forminfo.username"></p>
      <p>密码：<input type="text" v-model="forminfo.password"></p>
      <p>
          <button @click="login">登录</button>
          <button @click="reset">注册</button>
      </p>
  </div>
</template>
<script>
let defaultItem = {
    username:"",
    password:""
}
export default {
    data(){
        return{ 
            forminfo:{...defaultItem}
         }
    },
    created(){
    },
    methods:{
        login(){
            localStorage.setItem("userinfo",JSON.stringify(this.forminfo))
            if(this.$route.query.redirect){
                this.$router.replace(this.$route.query.redirect)
            }else{
                this.$router.push("/")
            }
        },
        reset(){
            this.forminfo = {...defaultItem}
        }
    },
    components:{}
}
</script>
<style scoped>
</style>