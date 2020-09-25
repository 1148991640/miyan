<template>
  <div class="table-bg">
      <el-table  :data="bannerlist">
          <el-table-column prop="id" label="ID" align="center"></el-table-column>
          <el-table-column prop="title" label="轮播图名称" align="center"></el-table-column>
          <el-table-column label="分类图片">
              <template slot-scope="scope">
                  <img style="width:80px" v-if="scope.row.img" :src="scope.row.img | pixImg" alt="">
                  <span v-else>暂无图片</span>
              </template>
          </el-table-column>
          <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button type="primary" size="small" @click="edit(scope.row)" circle icon="el-icon-edit"></el-button>
                    <el-button type="danger" size="small"  @click="del(scope.row.id)"  circle icon="el-icon-delete"></el-button>
                </template>
          </el-table-column>
      </el-table>
  </div>
</template>
<script>
import { delBanner,getBanner } from "@/request/banner"
export default {
    data(){
        return{
            bannerlist:[]
        }
    },
    mounted() {
        this.getlist();
    },
    methods:{
        async getlist(){
            let res = await getBanner();
            this.bannerlist = res;
        },
        edit(val){
            this.$emit('edit',{...val})
        },
        async del(id){
            this.$confirm('确认删除吗?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(async ()=>{
                let res = await delBanner(id);
                if(res.code==200){
                    this.$message.success(res.msg)
                    this.getlist();// 重新获取列表！
                }else{
                    this.$message.error(res.msg)
                }
            }).catch(()=>{})
        }
    },
    components:{}
}
</script>
<style scoped>
</style>