from . import theparks
from ..dbAPI import *
from flask import *


# from flask_server.app.map import theparks
# from flask_server.app.dbAPI import *
# from flask import *

import time

##场景：用户点击收藏列表或搜索栏中的公园，切换当前公园
@theparks.route("/parks/<int:id>",methods=['GET'])
def findparks(id):
    ret_data = {
        "id": 0,
        "parkname": "",
        "longitude": "",
        "latitude": "",
    }
    if request.method == 'GET':
        thispark= Park_Query_by_id(id)
        if thispark is not None:
            ret_data["parkname"] = thispark.parkname
            ret_data["longitude"] =thispark.longitude
            ret_data["latitude"] =thispark.latitude
            ret_data["id"] =id
    return jsonify(ret_data)

#场景：用户在搜索框输入关键字，搜索公园
@theparks.route("/parks/<searchInput>/search",methods=['GET'])
def searchparks(searchInput):
    #searchInput = request.args.get("searchInput")
    ret_data = {
        "id": 0,
        "name":"",
    }
    if request.method == 'GET':
        seachresult = Park_Query_search(searchInput)
        if seachresult is not None:
            print(seachresult)
            ret_data["id"] = seachresult.id
            ret_data["name"] = seachresult.parkname
    return ret_data

#场景：用户点击“景点”按钮，拉取当前公园的景点信息
@theparks.route("/parks/<int:id>/spots",methods=['GET'])
def parkspots(id):
    ret_data =[]
    if request.method == 'GET':
        getspots = Spots_Query_by_parkid(id)
        if getspots is not None:
            print(getspots)
            for spot in getspots:
                print(spot.detail)
                tempdata = {
                    "name": 0,
                    "detail": "",
                    "img": "",
                }
                tempdata["name"] = spot.spotname
                tempdata["detail"] = spot.detail
                tempdata["img"] = spot.map
                print(tempdata)
                ret_data.append(tempdata)
    return jsonify(ret_data)

#用户点击“评论”按钮，拉取当前公园的评论信息
@theparks.route("/parks/<int:id>/comments",methods=['GET'])
def parkcomments(id):
    ret_data =[]
    if request.method == 'GET':
        getcomments = Comments_Query_by_parkid(id)
        if getcomments is not None:
            print(getcomments)
            for thecomment in getcomments:
                tempdata = {
                    "score": "",
                    "content": "",
                }
                tempdata["score"] = thecomment.score
                tempdata["content"] = thecomment.content
                print(tempdata)
                ret_data.append(tempdata)
    return jsonify(ret_data)


#场景：用户点击灰色收藏按钮，将当前公园添加至收藏夹中
@theparks.route("/favorites/<userID>/<parkID>",methods=['PUT'])
def addCollection(userID,parkID):
     ret_data={
        "iscorrect":False,
        "message":""
     }
     if request.method == 'PUT':
         req_data = request.get_json()
         Collection_Add(int(userID), int(parkID))
         # collect = Collection(u_id=userID, p_id=parkID)
         ret_data["iscorrect"] = True
     return ret_data

#场景：用户点击红色收藏按钮，将当前公园从收藏夹移除
@theparks.route("/favorites/<userID>/<parkID>",methods=['DELETE'])
def delCollection(userID,parkID):
    ret_data = {
        "iscorrect": False,
        "message": ""
    }
    if request.method == 'DELETE':
        req_data = request.get_json()
        Collection_Delete(int(userID), int(parkID))
        ret_data["iscorrect"] = True
    return ret_data

#场景：场景：用户对当前公园发表评论
@theparks.route("/comment",methods=['PUT'])
def addcomment():
     ret_data={
        "iscorrect":False,
        "message":""
     }
     if request.method == 'PUT':
         req_data = request.get_json()
         #putForm = json.loads(request.get_data(as_text=True))
         #print(putForm["park_id"])
         Comment_Add(req_data["park_id"], req_data["user_id"],req_data["score"],req_data["content"])
         ret_data["iscorrect"] = True
     return ret_data
# json测试数据
# {"park_id": 2,
#  "user_id": 2,
#  "score": 4,
#  "content": "家人们欢迎来到世界最高城！"
# }
