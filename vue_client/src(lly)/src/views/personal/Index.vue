<template>
  <v-expansion-panels>
    <v-expansion-panel
    >
      <v-expansion-panel-header>
        用户名
      </v-expansion-panel-header>
      <v-expansion-panel-content>
        <v-row>
        您的用户名为：{{username}}
        </v-row>
        <template>
            <v-row style="padding-top:1%">
            <v-dialog
            v-model="dialog"
            persistent
            max-width="600px"
            >
            <template v-slot:activator="{ on, attrs }">
                <v-btn
                color="primary"
                dark
                v-bind="attrs"
                v-on="on"
                >
                修改用户名
                </v-btn>
                    </template>
                    <v-card>
                        <v-card-title>
                        <span class="text-h5">修改用户名</span>
                        </v-card-title>
                        <v-card-text>
                        <v-container>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field
                                    label="新用户名*"
                                    id="username"
                                    required
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                            <v-row id="tip1" style="display:none;">
                                <div style="font-weight:bold;color:red">
                                    {{message}}
                                </div>
                            </v-row>
                        </v-container>
                        </v-card-text>
                        <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn
                            color="blue darken-1"
                            text
                            @click="Return"
                        >
                            返回
                        </v-btn>
                        <v-btn
                            color="blue darken-1"
                            text
                            @click="UpdateUsername"
                        >
                            提交
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            </v-row>
        </template>
      </v-expansion-panel-content>
    </v-expansion-panel>
        <v-expansion-panel
    >
      <v-expansion-panel-header>
        密码
      </v-expansion-panel-header>
      <v-expansion-panel-content>
        <v-row>
          您的密码为：{{show_password}}
          &nbsp&nbsp
          <v-btn
                color="primary"
                dark
                v-bind="attrs"
                v-on="on"
                @click="ShowPassword"
                >
                {{Password_inform}}
          </v-btn>
        </v-row>
        <template>
            <v-row style="padding-top:1%">
            <v-dialog
            v-model="dialog_password"
            persistent
            max-width="600px"
            >
            <template v-slot:activator="{ on, attrs }">
                <v-btn
                color="primary"
                dark
                v-bind="attrs"
                v-on="on"
                >
                修改密码
                </v-btn>
                    </template>
                    <v-card>
                        <v-card-title>
                        <span class="text-h5">修改密码</span>
                        </v-card-title>
                        <v-card-text>
                        <v-container>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field
                                    label="新密码*"
                                    id="password"
                                    required
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field
                                    label="确认新密码*"
                                    id="repassword"
                                    required
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                            <v-row id="tip2" style="display:none;">
                                <div style="font-weight:bold;color:red">
                                    {{message_password}}
                                </div>
                            </v-row>
                        </v-container>
                        </v-card-text>
                        <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn
                            color="blue darken-1"
                            text
                            @click="Return_password"
                        >
                            返回
                        </v-btn>
                        <v-btn
                            color="blue darken-1"
                            text
                            @click="UpdatePassword"
                        >
                            提交
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            </v-row>
        </template>
      </v-expansion-panel-content>
    </v-expansion-panel>
        <v-expansion-panel
    >
      <v-expansion-panel-header>
        邮箱
      </v-expansion-panel-header>
      <v-expansion-panel-content>
        <v-row>
          您的邮箱是：{{email}}
        </v-row>
        <template>
            <v-row style="padding-top:1%">
            <v-dialog
            v-model="dialog_email"
            persistent
            max-width="600px"
            >
            <template v-slot:activator="{ on, attrs }">
                <v-btn
                color="primary"
                dark
                v-bind="attrs"
                v-on="on"
                >
                修改邮箱
                </v-btn>
                    </template>
                    <v-card>
                        <v-card-title>
                        <span class="text-h5">修改邮箱</span>
                        </v-card-title>
                        <v-card-text>
                        <v-container>
                            <v-row>
                                <v-col cols="12">
                                    <v-text-field
                                    label="新邮箱*"
                                    id="email"
                                    required
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                            <v-row id="tip3" style="display:none;">
                                <div style="font-weight:bold;color:red">
                                    {{message_email}}
                                </div>
                            </v-row>
                        </v-container>
                        </v-card-text>
                        <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn
                            color="blue darken-1"
                            text
                            @click="Return_email"
                        >
                            返回
                        </v-btn>
                        <v-btn
                            color="blue darken-1"
                            text
                            @click="UpdateEmail"
                        >
                            提交
                        </v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            </v-row>
        </template>
      </v-expansion-panel-content>
    </v-expansion-panel>
        <v-expansion-panel @click="GetCollection">
      <v-expansion-panel-header>
        收藏的公园
      </v-expansion-panel-header>
      <v-expansion-panel-content>
          <div v-for="(value,key) in collections" :key="key" style="padding-top:10px">
            <v-chip @click="GotoDetail(value)">
            {{key+1}}、{{value.parkname}}
            </v-chip>
          </div>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script>
import axios from 'axios';
import Cookies from 'js-cookie'
  export default {
    methods: {
        getUser(){
            var username=Cookies.get('username')
            var url_temp='http://localhost:8000/getUserInfo_'
            axios.get(url_temp+username).then((data)=>{
                this.username=data.data.username;
                this.password=data.data.password;
                this.id=data.data.id;
                this.email=data.data.email;
            })

        },
        GetCollection(){
          this.collections=[]
          var url_temp='http://localhost:8000/getUserCollection_'
            axios.get(url_temp+this.username).then((data)=>{
                for(let i=0;i<data.data.collections.length;i++){
                  this.collections.push(data.data.collections[i])
                }
            })
            //console.log(this.collections)
        },
        GotoDetail(value){
            Cookies.set('longitude',value.park_long);
            Cookies.set('latitude',value.park_lati);
            this.$router.push('/map')//在此处修改url跳转地址！！！！
        },
        Return(){
            this.dialog=false;
            var div=document.getElementById("tip1")
            div.setAttribute("style","display:none")
        },
        Return_password(){
          this.dialog_password=false;
          var div=document.getElementById("tip2")
          div.setAttribute("style","display:none")
        },
        Return_email(){
            this.dialog_email=false;
            var div=document.getElementById("tip3")
            div.setAttribute("style","display:none")
        },
        ShowPassword(){
          if(this.Password_inform=='显示')
          {
            this.show_password=this.password;
            this.Password_inform="隐藏";
          }
          else
          {
            this.show_password="********";
            this.Password_inform="显示";
          }

        },
        UpdateUsername(){//用户名更新
            var temp_username=document.getElementById("username").value
            if(temp_username==''){
              var div=document.getElementById("tip1")
              this.message="请填写非空内容"
              div.setAttribute("style","display:inline")
              return
            }
            let form={
                        old_username:this.username,
                        new_username:temp_username
                    }
            const FPath = 'http://localhost:8000/updateUsername'
            axios.put(FPath,form)
                    .then((res)=>{
                        const data=res.data
                        if(data.iscorrect==false)
                        {
                            var div=document.getElementById("tip1")
                            this.message=data.message
                            div.setAttribute("style","display:inline")
                        }
                        else
                        {
                            Cookies.set('username',temp_username)//有待优化，早知道之前cookie存用户id了
                            this.dialog=false;
                            var div=document.getElementById("tip1")
                            div.setAttribute("style","display:none")
                            this.username=temp_username
                        }
                    })
        },
        UpdatePassword(){//密码更新
            var temp_password=document.getElementById("password").value
            var temp_repassword=document.getElementById("repassword").value
            if(temp_password!=temp_repassword){
              var div=document.getElementById("tip2")
              this.message_password="两次密码不一致，请重试"
              div.setAttribute("style","display:inline")
              return
            }
            else if(temp_password==''||temp_repassword==''){
              var div=document.getElementById("tip2")
              this.message_password="请填写非空内容"
              div.setAttribute("style","display:inline")
              return
            }
            let form={
                        username:this.username,
                        old_password:this.password,
                        new_password:temp_password,
                        new_repassword:temp_password
                    }
            const FPath = 'http://localhost:8000/updateUserPassword'
            axios.put(FPath,form)
                    .then((res)=>{
                        const data=res.data
                        if(data.iscorrect==false)
                        {
                            var div=document.getElementById("tip2")
                            this.message_password=data.message
                            div.setAttribute("style","display:inline")
                        }
                        else
                        {
                            this.dialog_password=false;
                            var div=document.getElementById("tip2")
                            div.setAttribute("style","display:none")
                            this.password=temp_password
                        }
                    })
        },
        UpdateEmail(){//邮箱更新
            var temp_email=document.getElementById("email").value
            if(temp_email==''){
              var div=document.getElementById("tip3")
              this.message_email="请填写非空内容"
              div.setAttribute("style","display:inline")
              return
            }
            let form={
                        username:this.username,
                        new_email:temp_email
                    }
            const FPath = 'http://localhost:8000/updateUserEmail'
            axios.put(FPath,form)
                    .then((res)=>{
                        const data=res.data
                        console.log(data)
                        if(data.iscorrect==false)
                        {
                            var div=document.getElementById("tip3")
                            this.message_email=data.message
                            div.setAttribute("style","display:inline")
                        }
                        else
                        {
                            this.dialog_email=false;
                            var div=document.getElementById("tip3")
                            div.setAttribute("style","display:none")
                            this.email=temp_email
                        }
                    })
        },
        

    },
    data () {
      return {
        on:'',
        attrs:'',
        username:1,
        password:1,
        email:1,
        id:1,
        dialog: false,
        dialog_password: false,
        dialog_email:false,
        message:1,
        message_password:1,
        message_email:1,
        show_password:'********',
        Password_inform:'显示',
        collections:[],
      }
    },
    created() {
      this.getUser();
    },
  }
</script>