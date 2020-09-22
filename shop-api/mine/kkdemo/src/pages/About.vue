<template>
  <div style="height:3000px">
      <h3>关于我们</h3>
       <button @click="$bus.$emit('toggle')">打开/收起</button>
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