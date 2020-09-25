<template>
  <el-dialog :title="info.isAdd ? '添加活动':'修改活动'"  @close="cancel"  :visible.sync="info.isShow"   width="40%">
    <!-- 表单 -->
    <el-form :model="forminfo" ref="form"  label-width="140px">
        <el-form-item label="活动名称" prop="specsname">
             <el-input v-model="forminfo.title" placeholder="请输入属性名"></el-input>
        </el-form-item>
        <el-form-item label="活动时间" >
            <el-date-picker
                v-model="time"
                type="datetimerange"
                start-placeholder="开始日期"
                end-placeholder="结束日期"
               >
            </el-date-picker>
        </el-form-item>
        <el-form-item label="一级分类">
            <el-select v-model="forminfo.first_cateid" @change="topChange" placeholder="请选择">
                <el-option  v-for="item in catelist" :key="item.id" :label="item.catename"  :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="二级分类">
            <el-select v-model="forminfo.second_cateid" placeholder="请选择" @change="childChange">
                <el-option  v-for="item in secondlist" :key="item.id" :label="item.catename"  :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="商品">
            <el-select v-model="forminfo.goodsid" placeholder="请选择" @change="childChange">
                <el-option  v-for="item in goodlist" :key="item.id" :label="item.goodsname"  :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="状态">
            <el-switch v-model="forminfo.status" :active-value="1" :inactive-value="2"></el-switch>
        </el-form-item>
        <el-form-item label="">
            <el-button type="primary" @click="sumbit">提交</el-button>
            <el-button type="warning" @click="reset">重置</el-button>
        </el-form-item>
    </el-form>
</el-dialog>
</template>
<script>
// 导入  添加和修改的 请求封装方法！
import { addSeck,editSeck } from "@/request/seckill"
import  { getFxGoods } from "@/request/goods"
import { mapGetters,mapActions } from "vuex"
let defaultItem = {
    title:"",  
    begintime:"",
    endtime:"",
    first_cateid:"",
    second_cateid:"",
    goodsid:"",
    status:1    // 状态1正常2禁用
}
let resetItem = {...defaultItem}
export default {
    props:{
        info:{
            type:Object,
            default(){
                return {
                    isAdd:true,
                    isShow:false
                }
            }
        }
    },
    data(){
        return{
            forminfo:{...defaultItem},
            rules:{  // 验证规则对象！
            },
            list:[{value:''}],
            secondlist:[],  // 二级分类
            goodlist:[], // 商品列表
            time:[]
        }
    },
     computed: {
        ...mapGetters({
            catelist:"category/catelist",
        })
    },
    mounted() {
        if(!this.catelist.length){
            this.get_category_list();
        }
    },
    methods:{
        ...mapActions({
            get_category_list:"category/get_category_list"
        }),
        topChange(id){  // 一级分类变化
            this.secondlist = []
            this.forminfo.second_cateid = ''
            // id就是选中的ID，根据这个ID遍历一级分类数组，找出其对应的chilren就是二级分类列表！
            this.catelist.forEach(val=>{
                if(val.id==id){
                    this.secondlist = val.children;
                }
            })
        },
        async childChange(id){  // 二级分类变化了应该去获取商品列表的数据
            let  res = await getFxGoods(this.forminfo.first_cateid,this.forminfo.second_cateid);
            this.goodlist = res;
        },
        setinfo(val){  // 将数据赋给默认defaultItem; 赋给表单
            defaultItem = {...val};
            this.forminfo = {...val};
            this.time = [new Date(val.begintime*1),new Date(val.endtime*1)]
            this.catelist.forEach(ele=>{
                if(ele.id==val.first_cateid){
                    this.secondlist = ele.children;
                }
            })
            this.childChange();
        },
        async sumbit(){
            if(!this.time.length){
                this.$message.warning('请选择活动时间')
                return;
            }
            this.forminfo.begintime = this.time[0].getTime();
            this.forminfo.endtime = this.time[1].getTime();
            // 表单验证！
            this.$refs.form.validate(async valid=>{
                if(valid){ // 如果验证通过！
                    let res;
                    if(this.info.isAdd){ // 添加还是修改！
                        res = await addSeck(this.forminfo);
                    }else{
                        res = await editSeck(this.forminfo)
                    }
                    if(res.code==200){
                        this.$message.success(res.msg)
                        this.info.isShow = false;
                        this.$parent.update();
                        this.cancel();
                    }else{
                        this.$message.error(res.msg)
                    }
                }else{
                    console.log('验证不通过')
                }
            })
        },
        reset(){
            if(this.info.isAdd){ // 添加时候的重置！
                this.forminfo = {...resetItem}
            }else{ // 修改时候的重置！
                this.setinfo({...defaultItem})
            }
        },
        cancel(){
            this.forminfo = {...resetItem}
            this.list = [{value:''}]
        }
    },
    components:{}
}
</script>
<style scoped>
</style>