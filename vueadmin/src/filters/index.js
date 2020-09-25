import dayjs from "dayjs"

export default {
    pixImg:function(val,pix='http://localhost:3333'){
        return pix+val
    },
    getTime: function (val, str ='YYYY/MM/DD HH:mm:ss'){
        // day.js文档地址：https://dayjs.gitee.io/docs/zh-CN/installation/installation
        return dayjs(val * 1).format(str)
    }
}

