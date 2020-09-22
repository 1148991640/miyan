<template>
   <div style="height:2000px">
    <button @click="$bus.$emit('toggle')">打开/收起</button>
    <h3>新闻中心</h3>
    <ul>
      <li><router-link to="/news/11">新闻111</router-link></li>
      <li><router-link to="/news/22">新闻222</router-link></li>
      <!-- <li><router-link to="/news/33">新闻333</router-link></li> -->
      <li><router-link :to="{name:'detail',params:{id:'234234'},query:{box:'2222'}}">新闻333</router-link></li>
      <li><router-link to="/news/44">新闻444</router-link></li>
    </ul>
  </div>
</template>
<script>
export default {
    data(){
        return{  }
    },
    created(){
    },
    methods:{},
    components:{},
    beforeDestroy() {
       this.$bus.$emit("toggle",false) 
    }
}
</script>
<style scoped>
</style>