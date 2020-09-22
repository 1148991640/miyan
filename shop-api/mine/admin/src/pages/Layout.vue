<template>
  <div class="layout">
      
       <Aside/>
      <div class="container">
          <Header/>
          <div class="main">
              <!-- 主体内容 -->
              {{msg}}
              <hr/>
              <table align="center" width="400" border="1">
                    <!-- <my-row></my-row>
                    <my-row></my-row> -->
                    
                    <tr is="my-row"></tr>
              </table>
          </div>
      </div>
  </div>
</template>

<script>
import Header from "../components/Header"
import Aside from "../components/Aside"
export default {
    data(){
        return{
            msg:"天禧！！！"
        }
    },
    mounted() {
          console.log(this.$children[0].logo)
          this.$children[0].logo = '吃饭了！！！'
    },
    methods:{},
    components:{
        Header,
        Aside,
        myRow:{
            template:`<tr>
                          <td>11</td>
                          <td>22</td>
                          <td>33</td>
                          <td>44</td>
                      </tr>`
        }
    }
}

</script>
<style scoped>
.layout{
    width: 100vw;
    height: 100vh;
    background-color: #eee;
    display: flex;
}
.aside{
    width: 230px;
    background-color: #777;
    height: 100vh;
}
.container{
    flex: 1;
    height: 100vh;
    background-color: orange;
    display: flex;
    flex-direction: column;
}
.header{
    background-color: blue;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: #fff;
    padding: 0 20px;
}
.header a{
    color: inherit;
}
.main{
    border:10px solid green;
    flex: 1;
}
</style>