webpackJsonp([14],{guTF:function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var r=n("lC5x"),a=n.n(r),s=n("J0Oq"),c=n.n(s),l=n("dKdo"),i={data:function(){return{list:[]}},created:function(){this.getlist()},methods:{getlist:function(){var t=this;return c()(a.a.mark(function e(){return a.a.wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,Object(l.d)();case 2:t.list=e.sent;case 3:case"end":return e.stop()}},e,t)}))()},delRow:function(t){var e=this;this.$confirm("确定删除吗, 是否继续?","提示",{confirmButtonText:"确定",cancelButtonText:"取消",type:"warning"}).then(c()(a.a.mark(function n(){return a.a.wrap(function(n){for(;;)switch(n.prev=n.next){case 0:return n.next=2,Object(l.b)(t);case 2:e.getlist();case 3:case"end":return n.stop()}},n,e)})))}},components:{}},o={render:function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("router-link",{attrs:{to:"/category/add"}},[n("el-button",{attrs:{type:"primary"}},[n("i",{staticClass:"el-icon-circle-plus-outline"}),t._v("添加\n  ")])],1),t._v(" "),n("div",{staticClass:"bgf"},[n("el-table",{attrs:{data:t.list,"row-key":"id","tree-props":{hasChildren:"hasChildren",children:"children"}}},[n("el-table-column",{attrs:{prop:"id",label:"ID"}}),t._v(" "),n("el-table-column",{attrs:{prop:"catename",label:"分类名称"},scopedSlots:t._u([{key:"default",fn:function(e){return[0==e.row.pid?n("span",[t._v(t._s(e.row.catename))]):n("span",[t._v("    "+t._s(e.row.catename))])]}}])}),t._v(" "),n("el-table-column",{attrs:{prop:"img",label:"分类图片"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("img",{staticClass:"picimg",attrs:{src:t.$HOST+e.row.img,alt:""}})]}}])}),t._v(" "),n("el-table-column",{attrs:{prop:"status",label:"状态"},scopedSlots:t._u([{key:"default",fn:function(e){return[e.row.status?n("el-tag",{attrs:{type:"success"}},[t._v("已启用")]):n("el-tag",{attrs:{type:"danger"}},[t._v("已禁用")])]}}])}),t._v(" "),n("el-table-column",{attrs:{label:"操作",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("router-link",{attrs:{to:"/category/"+e.row.id}},[n("el-button",{attrs:{type:"success",icon:"el-icon-edit",size:"mini",circle:""}})],1),t._v(" "),n("el-button",{attrs:{type:"danger",icon:"el-icon-delete",size:"mini",circle:""},on:{click:function(n){return t.delRow(e.row.id)}}})]}}])})],1)],1)],1)},staticRenderFns:[]};var u=n("C7Lr")(i,o,!1,function(t){n("uCPg")},"data-v-e4e207ba",null);e.default=u.exports},uCPg:function(t,e){}});
//# sourceMappingURL=14.3a5bfac651c9c4390909.js.map