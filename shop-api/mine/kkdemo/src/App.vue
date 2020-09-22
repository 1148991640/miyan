<template>
  <div>
    {{show}}
    <Header v-if="$route.name!='404'" />
    <div class="main">
      <router-view name="default"></router-view>
    </div>
    
    <div :class="show ? 'slide':'slide hide'">
       <router-view name="slide"></router-view>
    </div>
  </div>
</template>
<script>
import Header from "@/components/Header"
export default {
    data(){
        return{
          show:false
        }
    },
    created(){
       this.$bus.$on('toggle',(state)=>{
          if(state===false){
             this.show = state
          }else{
             this.show = !this.show;
          }
       })
    },
    methods:{},
    components:{
      Header
    }
}
</script>
<style scoped>
.main{
  width: 1200px;
  min-height: 500px;
  border:2px solid blue;
  margin:0 auto;
}
.slide{
   
   width: 500px;
   top:100px;
   position: fixed;
   right: 0;
   height: 500px;
   background: #fff;
   box-shadow: 0 0 5px 0 rgba(0,0,0,.3);
}
.slide.hide{
  right: -500px;
  transition: all .3s linear;
}
</style>