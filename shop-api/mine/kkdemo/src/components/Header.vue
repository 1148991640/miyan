<template>
  <div class="header">
      <ul>
          <li><router-link exact to="/">首页</router-link></li>
          <!-- <li><router-link to="/about">关于我们</router-link></li> -->
          <li><router-link :to="{name:'kaixin'}">关于我们</router-link></li>
          <li><router-link to="/news">公司新闻</router-link></li>
          <li><router-link to="/user">用户中心</router-link></li>
      </ul>
  </div>
</template>
<script>
export default {
    data(){
        return{  }
    },
    created(){},
    methods:{},
    components:{}
}
</script>
<style scoped>
.header{
    width: 1200px;
    margin: 0 auto;
    line-height:60px;
    background-color: #eee;
}
.header li{
    list-style: none;
    display: inline-block;
    width: 100px;
    text-align: center;
}
.header li .on{
    background-color: red;
    color: #fff;
}

</style>