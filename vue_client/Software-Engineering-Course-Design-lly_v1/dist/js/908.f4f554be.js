"use strict";(self["webpackChunktest_pro"]=self["webpackChunktest_pro"]||[]).push([[908],{5358:function(t,e,a){a.r(e),a.d(e,{default:function(){return S}});var i=a(6190),s=a(9582),o=a(4886),n=a(6718),d=a(4324),r=a(9592),l=a(1713),p=a(8718),c=a(8088),u=a(6313),g=a(7953),h=function(){var t=this,e=t._self._c;return e("div",[e("vue-particles",{staticClass:"login-background",attrs:{color:"#97D0F2",particleOpacity:.7,particlesNumber:80,shapeType:"star",particleSize:4,linesColor:"#97D0F2",linesWidth:1,lineLinked:!0,lineOpacity:.4,linesDistance:150,moveSpeed:3,hoverEffect:!0,hoverMode:"grab",clickEffect:!0,clickMode:"push"}}),e("div",{staticStyle:{"text-align":"center","padding-top":"15%"}},[e(s.Z,{staticStyle:{margin:"0 auto"},attrs:{elevation:"12","max-width":"374",color:"#E0F7FA"}},[e("template",{slot:"progress"},[e(r.Z,{attrs:{color:"deep-purple",height:"10",indeterminate:""}})],1),e("p",{staticStyle:{"font-weight":"bold","padding-top":"15px","font-size":"20px"}},[t._v(" 注册 ")]),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%"},attrs:{justify:"space-around"}},[e(d.Z,[t._v(" mdi-account ")]),e(c.Z,{staticStyle:{"padding-left":"5%"},attrs:{label:"请输入用户名","hide-details":"auto",id:"username_input"}})],1),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%"},attrs:{justify:"space-around"}},[e(d.Z,[t._v(" mdi-key ")]),e(c.Z,{staticStyle:{"padding-left":"5%"},attrs:{label:"请输入密码","hide-details":"auto",id:"password_input"}})],1),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%"},attrs:{justify:"space-around"}},[e(d.Z,[t._v(" mdi-key ")]),e(c.Z,{staticStyle:{"padding-left":"5%"},attrs:{label:"请再次输入密码","hide-details":"auto",id:"password_input_again"}})],1),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%"},attrs:{justify:"space-around"}},[e(d.Z,[t._v(" mdi-email ")]),e(c.Z,{staticStyle:{"padding-left":"5%"},attrs:{label:"请输入邮箱","hide-details":"auto",id:"email_input"}})],1),e(l.Z,{staticStyle:{"padding-left":"10%","padding-top":"5%","padding-right":"10%","padding-bottom":"7%"},attrs:{justify:"space-around"}},[e(i.Z,{staticStyle:{margin:"auto"},attrs:{color:"blue-grey"},on:{click:t.CheckSubmit}},[t._v(" 注册 ")])],1)],2),e("div",{attrs:{"data-app":"true"}},[e(n.Z,{attrs:{"max-width":"500",persistent:""},model:{value:t.show,callback:function(e){t.show=e},expression:"show"}},[e(s.Z,[e(u.Z,{attrs:{dense:"",dark:"",color:""}},[e(g.qW,[t._v("注册错误")])],1),e("div",{staticStyle:{"padding-top":"5%"}},[e(o.ZB,{staticStyle:{"font-weight":"bold","font-size":"15px"}},[t._v(" "+t._s(t.ErrorText)+" ")])],1),e(p.Z),e("div",{staticStyle:{"padding-bottom":"5%"}},[e(i.Z,{attrs:{elevation:"1",color:"blue-grey"},on:{click:function(e){t.show=!1}}},[t._v(" 返回 ")])],1)],1)],1)],1),e("div",{attrs:{"data-app":"true"}},[e(n.Z,{attrs:{"max-width":"500",persistent:""},model:{value:t.show_2,callback:function(e){t.show_2=e},expression:"show_2"}},[e(s.Z,[e(u.Z,{attrs:{dense:"",dark:"",color:""}},[e(g.qW,[t._v("注册成功")])],1),e("div",{staticStyle:{"padding-top":"5%"}},[e(o.ZB,{staticStyle:{"font-weight":"bold","font-size":"15px"}},[t._v(" 注册成功 ")])],1),e(p.Z),e("div",{staticStyle:{"padding-bottom":"5%"}},[e(i.Z,{attrs:{elevation:"1",color:"blue-grey"},on:{click:t.GotoLogin}},[t._v(" 返回登录 ")])],1)],1)],1)],1)],1)],1)},_=[],m=a(9669),y=a.n(m),v=(a(1955),{name:"Login",data(){return{username_cont:1,password_cont:1,password_again_cont:1,email_cont:1,checked:!0,ErrorText:"111",show:!1,show_2:!1}},methods:{GotoLogin(){this.$router.push("/")},CheckSubmit(t){this.username_cont=document.getElementById("username_input").value,this.password_cont=document.getElementById("password_input").value,this.password_again_cont=document.getElementById("password_input_again").value,this.email_cont=document.getElementById("email_input").value;let e={username:this.username_cont,password:this.password_cont,repassword:this.password_again_cont,email:this.email_cont};const a="http://localhost:8000/userRegister";y().post(a,e).then((t=>{const e=t.data;0==e.iscorrect?(this.show=!0,this.ErrorText=e.message):this.show_2=!0}))}}}),f=v,w=a(1001),Z=(0,w.Z)(f,h,_,!1,null,null,null),S=Z.exports}}]);
//# sourceMappingURL=908.f4f554be.js.map