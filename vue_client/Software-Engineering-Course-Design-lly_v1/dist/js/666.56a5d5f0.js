"use strict";(self["webpackChunktest_pro"]=self["webpackChunktest_pro"]||[]).push([[666],{8666:function(t,e,a){a.r(e),a.d(e,{default:function(){return k}});var i=a(6190),s=a(9582),o=a(4886),n=a(6718),r=a(4324),d=a(9592),l=a(1713),c=a(8718),p=a(8088),u=a(6313),h=a(7953),g=function(){var t=this,e=t._self._c;return e("div",[e("vue-particles",{staticClass:"login-background",attrs:{color:"#97D0F2",particleOpacity:.7,particlesNumber:80,shapeType:"star",particleSize:4,linesColor:"#97D0F2",linesWidth:1,lineLinked:!0,lineOpacity:.4,linesDistance:150,moveSpeed:3,hoverEffect:!0,hoverMode:"grab",clickEffect:!0,clickMode:"push"}}),e("div",{staticStyle:{"text-align":"center","padding-top":"15%"}},[e(s.Z,{staticStyle:{margin:"0 auto"},attrs:{elevation:"12","max-width":"374",color:"#E0F7FA"}},[e("template",{slot:"progress"},[e(d.Z,{attrs:{color:"deep-purple",height:"10",indeterminate:""}})],1),e("p",{staticStyle:{"font-weight":"bold","padding-top":"15px","font-size":"20px"}},[t._v(" 登录 ")]),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%"},attrs:{justify:"space-around"}},[e(r.Z,[t._v(" mdi-account ")]),e(p.Z,{staticStyle:{"padding-left":"5%"},attrs:{label:"请输入用户名","hide-details":"auto",id:"username_input"}})],1),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%"},attrs:{justify:"space-around"}},[e(r.Z,[t._v(" mdi-key ")]),e(p.Z,{staticStyle:{"padding-left":"5%"},attrs:{label:"请输入密码","hide-details":"auto",id:"password_input"}})],1),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%","padding-bottom":"7%"},attrs:{justify:"space-around"}},[e(i.Z,{staticStyle:{margin:"auto"},attrs:{color:"blue-grey"},on:{click:t.CheckLogin}},[t._v(" 登录 ")]),e("div",{attrs:{"data-app":"true"}},[e(n.Z,{attrs:{"max-width":"500",persistent:""},model:{value:t.show,callback:function(e){t.show=e},expression:"show"}},[e(s.Z,[e(u.Z,{attrs:{dense:"",dark:"",color:""}},[e(h.qW,[t._v("登录错误")])],1),e("div",{staticStyle:{"padding-top":"5%"}},[e(o.ZB,{staticClass:"px-5",staticStyle:{"font-weight":"bold","font-size":"15px"}},[t._v(" 请重新输入用户名和密码 ")])],1),e(c.Z),e("div",{staticStyle:{"padding-bottom":"5%"}},[e(i.Z,{attrs:{elevation:"1",color:"blue-grey"},on:{click:function(e){t.show=!1}}},[t._v(" 返回 ")])],1)],1)],1)],1),e(i.Z,{staticStyle:{margin:"auto"},attrs:{color:"blue-grey"},on:{click:t.gotoSubmit}},[t._v(" 现在注册 ")])],1)],2)],1)],1)},m=[],f=a(9669),y=a.n(f),v=a(1955),_={name:"Login",data(){return{username_cont:1,password_cont:1,checked:!0,show:!1}},methods:{gotoSubmit(){this.$router.push("/submit")},CheckLogin(t){this.username_cont=document.getElementById("username_input").value,this.password_cont=document.getElementById("password_input").value;let e={username:this.username_cont,password:this.password_cont};const a="http://localhost:8000/userLogin";y().post(a,e).then((t=>{const e=t.data;0==e.iscorrect?this.show=!0:(v.Z.set("username",this.username_cont),this.$router.push("/index"))}))}}},Z=_,b=a(1001),w=(0,b.Z)(Z,g,m,!1,null,null,null),k=w.exports}}]);
//# sourceMappingURL=666.56a5d5f0.js.map