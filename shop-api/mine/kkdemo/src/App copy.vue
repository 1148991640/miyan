<template>
  <div>
     <keep-alive>
        <component :is="curcom"></component>
     </keep-alive>
  </div>
</template>
<script>
import Index from "@/pages/Index"
import About from "@/pages/About"
import News from "@/pages/News"
import User from "@/pages/User"
import Login from "@/pages/Login"
export default {
    data(){
        return{
          curcom:"Index"
        }
    },
    mounted() {
        window.addEventListener("hashchange",(ev)=>{
          console.log("hash发生了变化！")
          let newURL = ev.newURL.split("#/")[1]
          newURL = newURL.replace(newURL[0],newURL[0].toUpperCase())
          this.curcom = newURL;
        })
    },
    methods:{},
    components:{
      Index,About,News,User,Login
    }
}
</script>
<style scoped>
</style>