// 配置路由相关信息！

import Vue from "vue";
import VueRouter from "vue-router";

// 安装vue-router插件
Vue.use(VueRouter);

// 导入相关组件
// import Index from "@/pages/Index"
// import About from "@/pages/About"
// import News from "@/pages/News"
// import NewsInfo from "@/pages/NewsInfo"
// import User from "@/pages/User"
// import UserOrder from "@/pages/UserOrder"
// import UserClass from "@/pages/UserClass"
// import UserInfo from "@/pages/UserInfo"
// import Login from "@/pages/Login"
// import NotFound from "@/pages/NotFound"
// import AboutSlide from "@/components/AboutSlide"
// import NewSlide from "@/components/NewSlide"





// 实例化一个路由对象！
// new VueRouter({配置对象})
let router = new VueRouter({
    base:"/admin",
    mode:"hash",  // hash模式（默认），一个history模式
    linkActiveClass:"on",    // 改变模糊匹配的激活class名！
    linkExactActiveClass:"active",   // 改变严格匹配的激活class名！
    routes: [  // routes 路由映射， 什么地址展示什么组件！
        { path: "/", component: ()=>import("@/pages/Index"), meta:{  title:"首页"}},
        { path: "/about", name: "kaixin", components:{
            default: () => import("@/pages/About"),
            slide: () => import("@/components/AboutSlide")
        }, meta: { title: "关于我们" } },
        { path: "/news", components:{
            default: () => import("@/pages/News"),
            slide: () => import("@/components/NewSlide")
        }, meta: { title: "新闻列表" }},
        { path: "/news/:id", name: "detail", component: () => import("@/pages/NewsInfo"), meta: { title: "新闻详情" } },
        {   path: "/user",  
            component: () => import("@/pages/User"), 
            meta: { title: "用户中心",needLogin:true },
            // redirect:"/user/order",
            children:[  // 嵌套路由！！！
                { path: "/user/", meta: { title: "欢迎您", needLogin: true }, component: () => import("@/pages/UserIndex") },
                { path: "/user/order", meta: { title: "我的订单", needLogin: true }, component: () => import("@/pages/UserOrder") },
                { path: "/user/class", meta: { title: "我的课程", needLogin: true }, component: () => import("@/pages/UserClass") },
                { path: "/user/info", meta: { title: "我的资料", needLogin: true }, component: () => import("@/pages/UserInfo") },
            ]
         },
        { path: "/login",  component: () => import("@/pages/Login") , meta: { title: "登录" } },
        // 404配置放在路由映射里面的最下面！
        { path: "*", name: "404", component: () => import("@/pages/NotFound"), meta: { title: "页面走丢了！" }  },
    ]
})

console.log(router)


// 全局守卫 【前置守卫！】
router.beforeEach(function(to,from,next){
    console.log("全局进入！！！")
    // let whiteList = [];  // 白名单！！！
    window.scroll(0,0)
    // console.log(to)  // 要去的路由地址信息
    // console.log(from)  // 从哪来的路由地址信息
    document.title = to.meta.title;
    if(to.meta.needLogin){  // 需要登录才能进入的路由！
        // 判断是否登录了？
        if(localStorage.getItem("userinfo")){
            next();
        }else{
            next('/login?redirect='+to.path)
        }
    }else{
        next();
    }
})
// 后置守卫
router.afterEach((to, from)=>{
    console.log("全局离开！！！")
})


// 暴露出去！
export default router;




// 车辆管理 Cl.vue
    //  质量检测 Zl.vue
        // 轮胎检测  Lt.vue
        // 发动机检测 Fdj.vue
    //  保险检测 Bx.vue
// 财务管理 Cw.vue
// 系统设置 Xt.vue



/*
- App.vue 里面的 router-view 里面
    -  Login.vue
    -  Layout.vue  router-view 里面
        -Cl.vue router-view
            - Zl.vue   router-view
                - Lt.vue
                - Fdj.vue
            - Bx.vue

        -Cw.vue
        -Xt.vue
*/