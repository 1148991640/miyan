<template>
  <div>首页</div>
</template>
<script>
export default {
    data(){
        return{  }
    },
    created(){
    },
    beforeRouteEnter (to, from, next) {
        next();
        // 这里不能使用this! 因为组件实例还没创建呢！
    },
    beforeRouteLeave (to, from, next) {
        next();
    },
    beforeRouteUpdate(to, from, next){
        next();
    },
    methods:{},
    components:{}
}
</script>
<style scoped>
</style>