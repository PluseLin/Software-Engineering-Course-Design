from . import main
from ..dbAPI import *
from flask import *

# from flask_server.app.main import main
# from flask_server.app.dbAPI import *
# from flask import *

# import time

@main.route("/userLogin",methods=['POST'])
def login():
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
            session["username"]=True
            ret_data["iscorrect"]=True
            ret_data["url"]="/{}/index".format(username) #可能需要修改
    return jsonify(ret_data)

@main.route("/userLogout",methods=['POST'])
def logout():
    ret_data={
        "issuccess":False,
    }
    if request.method=='POST':
        req_data=request.get_json()
        username=req_data["username"]
        if session[username]:
            session[username]=False
            ret_data["issuccess"]=True
        else:
            ret_data["issuccess"]=False
    return ret_data

@main.route("/userRegister",methods=['POST'])
def register():
    ret_data={
        "iscorrect":False,
        "message":""
    }
    print(request.method)
    if(request.method=='POST'):
        req_data=request.get_json()
        print(req_data)
        username=req_data["username"]
        password,repassword=req_data["password"],req_data["repassword"]
        #先检查用户名是否重复
        print(User_Query_by_username(username))
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
        "id":0,
        "username":username,
        "password":"",
        "email":"",
        "regtime":"",
        "ip_addr":request.remote_addr
    }
    if request.method=='GET':
        user=User_Query_by_username(username)
        if user is not None:
            ret_data["password"]=user.password
            ret_data["email"]=user.email
            ret_data["regtime"]=user.reg_time
            ret_data["id"]=user.id
    return jsonify(ret_data)

@main.route("/updateUserInfo",methods=['PUT'])
def updateUserInfo():
    ret_data={
        "iscorrect":False,
        "message":""
    }
    if request.method=="PUT":
        req_data=request.get_json()
        username=req_data["username"]
        user_id=req_data["user_id"]
        user=User_Query_by_id(user_id)
        #首先，保证用户id存在
        if user is None:
            ret_data["message"]="用户不存在！"
        #其次，保证新用户名存在
        elif User_Query_by_username(username) is not None:
            ret_data["message"]="新用户名已被使用！"
        else:
            #更新user
            user.username=req_data["username"]
            user.email=req_data["email"]
            User_Update(user)
            #修改ret数据
            ret_data["iscorrect"]=True
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
        new_password=req_data["password"]
        user=User_Query_by_username(username)
        #首先，保证用户存在
        if user is None:
            ret_data["message"]="用户不存在！"
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