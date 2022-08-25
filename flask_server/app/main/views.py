from . import main
from ..dbAPI import *
from flask import *

# from flask_server.app.main import main
# from flask_server.app.dbAPI import *
# from flask import *

import time

@main.route("/userLogin",methods=['POST'])
def login():
    global session
    ret_data={
        "iscorrect":False,
        "message":"",
        "url":"",
    }
    if(request.method=='POST'):
        req_data=request.get_json()
        username,password=req_data["username"],req_data["password"]
        if User_Query_by_username_and_password(username,password) is None:
            ret_data["message"]="用户名或密码错误"
            ret_data["url"]="#"
        else:
            session[username]=True
            session.permanent=True
            ret_data["iscorrect"]=True
            ret_data["url"]="/{}/index".format(username) #可能需要修改
    return jsonify(ret_data)

# @main.route("/userLogout",methods=['POST'])
# def logout():
#     global session
#     ret_data={
#         "issuccess":False,
#     }
#     if request.method=='POST':
#         print(session)
#         req_data=request.get_json()
#         username=req_data["username"]
#         if session.get(username)==True:
#             session[username]=False
#             ret_data["issuccess"]=True
#         else:
#             ret_data["issuccess"]=False
#     return ret_data

@main.route("/userRegister",methods=['POST'])
def register():
    ret_data={
        "iscorrect":False,
        "message":""
    }
    if(request.method=='POST'):
        req_data=request.get_json()
        username=req_data["username"]
        password,repassword=req_data["password"],req_data["repassword"]
        #先检查用户名是否重复
        if User_Query_by_username(username) is not None:
            ret_data["message"]="用户名已被使用！"
        #再检查两次密码是否一致
        elif password!=repassword:
            ret_data["message"]="两次密码不一致！"
        else:
            #注册成功
            user=User(
                username=username,
                password=password,
                email=req_data["email"],
                reg_time=time.strftime("%Y-%m-%d %H:%M:%S",time.localtime())
            )
            User_Insert(user)
            ret_data["iscorrect"]=True
            ret_data["message"]="注册成功"
    return jsonify(ret_data)

@main.route("/getUserInfo_<username>",methods=['GET'])
def getUserInfo(username):
    ret_data={
        "id":-1,
        "username":username,
        "password":"",
        "email":"",
        "regtime":"",
        "ip_addr":""
    }
    if request.method=='GET':
        user=User_Query_by_username(username)
        if user is not None:
            ret_data["password"]=user.password
            ret_data["email"]=user.email
            ret_data["regtime"]=user.reg_time
            ret_data["id"]=user.id
            ret_data["ip_addr"]=request.remote_addr
    return jsonify(ret_data)

@main.route("/updateUsername",methods=['PUT'])
def updateUsername():
    ret_data={
        "iscorrect":False,
        "message":""
    }
    if request.method=="PUT":
        req_data=request.get_json()
        old_username=req_data["old_username"]
        new_username=req_data["new_username"]
        user=User_Query_by_username(old_username)
        #首先，检查user是否存在
        if user is None:
            ret_data["message"]="用户不存在！"
        #其次，检查用户名是否被占用
        elif User_Query_by_username(new_username) is not None:
            ret_data["message"]="用户名已被使用！"
        #若都符合，则修改
        else:
            user.username=new_username
            User_Update(user)
            ret_data["iscorrect"]=True
            ret_data["message"]="修改用户名成功！"
    return jsonify(ret_data)

@main.route("/updateUserEmail",methods=['PUT'])
def updateUserEmail():
    ret_data={
        "iscorrect":False,
        "message":""
    }
    if request.method=="PUT":
        req_data=request.get_json()
        username=req_data["username"]
        new_email=req_data["new_email"]
        user=User_Query_by_username(username)
        #首先，检查user是否存在
        if user is None:
            ret_data["message"]="用户不存在！"
        #若符合，则修改
        else:
            user.email=new_email
            User_Update(user)
            ret_data["iscorrect"]=True
            ret_data["message"]="修改成功！"
    return jsonify(ret_data)

@main.route("/updateUserPassword",methods=['PUT'])
def updateUserPassword():
    ret_data={
        "iscorrect":False,
        "message":""
    }
    if request.method=="PUT":
        req_data=request.get_json()
        username=req_data["username"]
        old_password=req_data["old_password"]
        new_password=req_data["new_password"]
        new_repassword=req_data["new_repassword"]
        user=User_Query_by_username(username)
        #首先，保证用户存在
        if user is None:
            ret_data["message"]="用户不存在！"
        #其次，旧密码应该正确
        elif user.password!=old_password:
            ret_data["message"]="旧密码不正确！"
        #再其次，两次密码应该一致
        elif new_password!=new_repassword:
            ret_data["message"]="两次确认新密码不一致！"
        else:
            #更新user的password
            user.password=new_password
            User_Update(user)
            #修改ret数据
            ret_data["iscorrect"]=True
            ret_data["message"]="修改成功"
    return jsonify(ret_data)

@main.route("/getUserCollection_<username>",methods=['GET'])
def getUserCollection(username): 
    ret_data={
        "collections":[]
    }
    if request.method=='GET':
        user=User_Query_by_username(username)
        for each in Collection_Query_by_uid(user.id):
            park_name=Park_Query_by_id(each.p_id).parkname
            ret_data["collections"].append(park_name)
    return jsonify(ret_data) 