<template>
  <div>
    {{msg}}
  
  </div>
</template>
<script>
export default {
    data(){
        return{ 
            msg:"我是box！！！！"
         }
    },
    created(){},
    methods:{
        haha(){
            console.log("我是box里面的haha方法！！！")
        }
    },
    components:{}
}
</script>
<style scoped>
</style>