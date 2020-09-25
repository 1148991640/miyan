<template>
  <div class="table-bg">
      <el-table  :data="list">
          <el-table-column prop="uid" label="UID" align="center"></el-table-column>
          <el-table-column prop="nickname" label="昵称" align="center"></el-table-column>
          <el-table-column prop="phone" label="手机号" align="center"></el-table-column>
          <el-table-column prop="addtime" label="注册时间" align="center">
               <template slot-scope="scope">
                  {{scope.row.addtime|getTime('YYYY/MM/DD')}}
              </template>
          </el-table-column>
          <el-table-column label="状态">
              <template slot-scope="scope">
                  <el-tag type="success" v-if="scope.row.status==1">启用</el-tag>
                  <el-tag type="danger" v-if="scope.row.status==2">禁用</el-tag>
              </template>
          </el-table-column>
          <el-table-column label="修改">
                <template slot-scope="scope">
                    <el-button type="primary" size="small" @click="edit(scope.row)" circle icon="el-icon-edit"></el-button>
                </template>
          </el-table-column>
      </el-table>
  </div>
</template>
<script>
import { delMember,getMember } from "@/request/member"
export default {
    data(){
        return{
            list:[]
        }
    },
    mounted() {
        this.get_list();
    },
    methods:{
        edit(val){
            this.$emit('edit',{...val})
        },
        async get_list(){
            let res =await getMember();
            this.list = res;
            console.log("res就是返回列表数据！")
        },
        async del(id){
            this.$confirm('确认删除吗?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(async ()=>{
                let res = await delMember(id);
                if(res.code==200){
                    this.$message.success(res.msg)
                   this.get_list(); // 重新获取列表！
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