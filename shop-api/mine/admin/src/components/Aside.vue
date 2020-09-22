<template>
  <div class="aside" :style="state ? '':'width:60px'">
      <h3>{{logo}}</h3>
      <ul>
          <li>1111</li>
      </ul>
  </div>
</template>

<script>
// import bus from "@/bus"
export default {
    data(){
        return{
            state:true,
            logo:"小U商城！"
        }
    },
    created(){
         console.log(this.$desc)
        // bus.$on('toggle',(val)=>{
        this.$bus.$on('toggle',(val)=>{
            console.log(val)
            this.state =val;
            console.log("我要toggle!")
        })
    },
    methods:{},
    components:{}
}

</script>
<style scoped>
</style>