<template>

  <div>
      <h3>
          <button @click="$router.go(-1)">返回</button>
      </h3>
      <p>新闻详情，新闻的ID是{{$route.params.id}}</p>
      <p>
          <button @click="$router.push('/about')">去关于我们</button>
      </p>
      <h3>猜你喜欢</h3>
      <ul>
          <li><router-link to="/news/234234">新闻11111</router-link></li>
          <li><router-link to="/news/445645">新闻222222</router-link></li>
      </ul>
  </div>
</template>
<script>
export default {
    data(){
        return{  }
    },
    created(){
        // this.getlist();
    },
    // beforeRouteUpdate(to,from,next) {
    //     console.log("路由变化了啊！！！！")
    //     this.getlist();
    //     next();
    // },
    watch: {
        $route:{
            deep:true,
            immediate:true,
            handler(){
                this.getlist();
            }
        }
    },
    methods: {
        getlist(){
             //  进入之后，从路由上面读取出 id信息，去请求接口返回新闻数据，渲染页面！
            console.log("获取数据了")
            console.log(this.$route.params.id)
            // ajax 请求！
            //  路由中： 同动态路由组件详情跳转到详情，组件不会被再次创建！
        }
    }
}
</script>
<style scoped>
</style>