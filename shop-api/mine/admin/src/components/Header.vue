<template>
   <div class="header">
        <button @click="qiehuan">{{show ? '《收起来':'放出来》'}}</button>
        <a href="">超级用户</a>
    </div>
</template>

<script>
// import bus from "@/bus"
export default {
    data(){
        return{
            show:true
        }
    },
    created(){
        console.log(this)
        console.log(this.$parent.msg )
        this.$parent.msg = "儿子送过来的问候！"
         console.log(this.$desc)
    },
    methods:{
        qiehuan(){
            console.log("切换被触发了！")
            this.show = !this.show;
            // bus.$emit('toggle',this.show)
            this.$bus.$emit('toggle',this.show)
        }
    },
    components:{}
}

</script>
<style scoped>
</style>