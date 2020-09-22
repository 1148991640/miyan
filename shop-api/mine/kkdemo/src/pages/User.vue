<template>
  <div class="main">
      <div class="nav">
          <ul>
              <li><router-link to="/user/order">我的订单</router-link> </li>
              <li><router-link to="/user/class">我的课程</router-link> </li>
              <li><router-link to="/user/info">我的资料</router-link> </li>
          </ul>
      </div>
      <div class="box">
         <div>
             <div style="display:flex;justify-content: space-between;">
                 <div>
                      欢迎您: <b>：{{userinfo.username}} </b> 先生/女士
                        <button @click="quit">退出</button>
                 </div>
                 <div>
                     <span v-for="(item,index) in arr" :key="index">
                         <router-link :to="item.path">{{item.name}}</router-link>
                         {{ index==arr.length-1 ? "":">" }}
                     </span>
                 </div>
             </div>
             <hr>
         </div>
          <router-view></router-view>
      </div>
  </div>
</template>
<script>
export default {
    data(){
        return{ 
            userinfo:{},
            arr:[]
         }
    },
    created(){
        this.userinfo = JSON.parse(localStorage.getItem("userinfo"))
    },
    methods:{
        quit(){
            localStorage.removeItem("userinfo");
            this.$router.replace('/')
        }
    },
    watch: {
        $route:{   // watch 监听路由的变化！
            deep:true,
            immediate:true,
            handler(val){
                console.log(val)
                this.arr = [];
                val.matched.map(val=>{
                    this.arr.push({
                        name:val.meta.title,
                        path:val.path
                    })
                })
            }
        }
    },
    components:{}
}
</script>
<style scoped>
.main{
    display: flex;
}
.main .nav{
    width: 200px;
    height: 400px;
    background-color: #eee;
    line-height: 40px;
}
.main .nav .on{
    background-color: red;
    color: #fff;
}
.main .box{
    flex:1;
    height: 400px;
    border:2px solid red;
}
</style>