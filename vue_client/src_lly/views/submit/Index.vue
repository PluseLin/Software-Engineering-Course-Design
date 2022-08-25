<template>
    <div>
        <vue-particles
                class="login-background"
                color="#97D0F2"
                :particleOpacity="0.7"
                :particlesNumber="80"
                shapeType="star"
                :particleSize="4"
                linesColor="#97D0F2"
                :linesWidth="1"
                :lineLinked="true"
                :lineOpacity="0.4"
                :linesDistance="150"
                :moveSpeed="3"
                :hoverEffect="true"
                hoverMode="grab"
                :clickEffect="true"
                clickMode="push">
        </vue-particles>
        <div style="text-align:center;padding-top:15%">
            <v-card
            elevation="12"
            max-width="374"
            color="#E0F7FA"
            style="margin:0 auto;">
            <template slot="progress">
            <v-progress-linear
                color="deep-purple"
                height="10"
                indeterminate
            ></v-progress-linear>
            </template>
            <p style="font-weight:bold;padding-top:15px;font-size:20px">
                注册
            </p>
            <v-row justify="space-around"  style="padding-left:10%;padding-top:5%;padding-right:10%">
                <v-icon>
                mdi-account
                </v-icon>
                <v-text-field style="padding-left:5%;"
                label="请输入用户名"
                hide-details="auto"
                id="username_input"
                ></v-text-field>
            </v-row>
            <v-row justify="space-around"  style="padding-left:10%;padding-top:5%;padding-right:10%">
                <v-icon>
                mdi-key
                </v-icon>
                <v-text-field style="padding-left:5%;"
                label="请输入密码"
                hide-details="auto"
                id="password_input"
                ></v-text-field>
            </v-row>
            <v-row justify="space-around"  style="padding-left:10%;padding-top:5%;padding-right:10%">
                <v-icon>
                mdi-key
                </v-icon>
                <v-text-field style="padding-left:5%;"
                label="请再次输入密码"
                hide-details="auto"
                id="password_input_again"
                ></v-text-field>
            </v-row>
            <v-row justify="space-around"  style="padding-left:10%;padding-top:5%;padding-right:10%">
                <v-icon>
                mdi-email
                </v-icon>
                <v-text-field style="padding-left:5%;"
                label="请输入邮箱"
                hide-details="auto"
                id="email_input"
                ></v-text-field>
            </v-row>
            <v-row justify="space-around"  style="padding-left:10%;padding-top:5%;padding-right:10%;padding-bottom:7%">
                
                <v-btn style="margin:auto"
                color="blue-grey"
                @click="CheckSubmit"
                >
                注册
                </v-btn>
            </v-row>
            
            </v-card>
            
            <div data-app='true'>
                <v-dialog max-width="500" v-model="show" persistent>
                    <v-card>
                        <!--对话框的标题-->
                        <v-toolbar dense dark color="">
                            <v-toolbar-title>注册错误</v-toolbar-title>
                        </v-toolbar>
                        <!--对话框的内容，表单-->
                        <div style="padding-top:5%">
                        <v-card-text  style="font-weight:bold;font-size:15px;" >
                            {{ErrorText}}
                        </v-card-text>
                        </div>
                        <v-spacer></v-spacer>
                        <div style="padding-bottom:5%">
                        <v-btn
                            elevation="1"
                            color="blue-grey"
                            @click="show = false"
                        >
                            返回
                        </v-btn>
                        </div>
                    </v-card>
                </v-dialog>
            </div>
            <div data-app='true'>
                <v-dialog max-width="500" v-model="show_2" persistent>
                    <v-card>
                        <!--对话框的标题-->
                        <v-toolbar dense dark color="">
                            <v-toolbar-title>注册成功</v-toolbar-title>
                        </v-toolbar>
                        <!--对话框的内容，表单-->
                        <div style="padding-top:5%">
                        <v-card-text  style="font-weight:bold;font-size:15px;" >
                            注册成功
                        </v-card-text>
                        </div>
                        <v-spacer></v-spacer>
                        <div style="padding-bottom:5%">
                        <v-btn
                            elevation="1"
                            color="blue-grey"
                            @click="GotoLogin"
                        >
                            返回登录
                        </v-btn>
                        </div>
                    </v-card>
                </v-dialog>
            </div>
        </div>
    </div>

</template>

<script>
import axios from 'axios';
import Cookies from 'js-cookie'
    export default {
        name: "Login",
        data() {
            
            return {
                username_cont:1,
                password_cont:1,
                password_again_cont:1,
                email_cont:1,
                checked: true,
                ErrorText:"111",
                show: false,
                show_2:false,
            }
        },
        methods: {
            GotoLogin(){
                this.$router.push('/')
            },
            CheckSubmit(value) {
                    this.username_cont=document.getElementById("username_input").value
                    this.password_cont=document.getElementById("password_input").value
                    this.password_again_cont=document.getElementById("password_input_again").value
                    this.email_cont=document.getElementById("email_input").value
                    let form={
                        username:this.username_cont,
                        password:this.password_cont,
                        repassword:this.password_again_cont,
                        email:this.email_cont
                    }
                    const FPath = 'http://localhost:8000/userRegister'
                    axios.post(FPath,form)
                    .then((res)=>{
                        const data=res.data
                        //console.log(data.message)
                        if(data.iscorrect==false)
                        {
                            this.show=true
                            this.ErrorText=data.message
                        }
                        else
                        {
                            this.show_2=true
                        }
                        /*if(data=='error')
                        {
                            this.$message({
                            message: "用户名或密码错误",
                            type: "error",
                            showClose: true,
                            });
                        }
                        else{
                            this.t_username=data.username
                            this.t_password=data.password
                            this.t_nickname=data.nickname
                            Cookies.set('username',this.t_username,{ expires: 1 })
                            Cookies.set('password',this.t_password,{ expires: 1 })
                            Cookies.set('nickname',this.t_nickname,{ expires: 1 })
                            this.$router.push({path:'/pokemon'})
                        }*/
                    })
            },
        }
    }
</script>

<style>
    .login-background {
        background: linear-gradient(-180deg, #dcf2e6 0%, #ffffff 100%);
        width: 100%;
        height: 100%; /**宽高100%是为了图片铺满屏幕 */
        position: absolute;
    }

    .login-other {
        z-index: 1;
        margin: 180px 0 0 calc(calc(100vw - 410px) / 2);
        position: absolute;
        width:100px
    }

    .loginContainer {
        border-radius: 15px;
        background-clip: padding-box;
        width: 350px;
        height:320px;
        padding: 15px 35px 15px 35px;
        background: #fefefe;
        border: 1px solid #eaeaea;
        box-shadow: 0 0 25px #cac6c6;
    }

    .loginTitle {
        margin: 15px auto 20px auto;
        text-align: center;
        color: #707070;
    }

    .loginRemember {
        text-align: left;
        margin: 0 0 15px 0;
    }

</style>
