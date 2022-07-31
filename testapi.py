import requests
import json

url="http://127.0.0.1:8000"

def testpost(url,data):
    with requests.post(url,json=data) as r:
        req_data=json.loads(r.content)
        print(req_data)

def testget(url):
    with requests.get(url) as r:
        req_data=json.loads(r.content)
        print(req_data)

def testput(url,data):
    with requests.put(url,json=data) as r:
        req_data=json.loads(r.content)
        print(req_data)

def test_userRegister():
    post_data={
        "username":"Lin",
        "password":"123",
        "repassword":"123",
        "email":"1390297535@qq.com"
    }
    testpost(url+"/userRegister",post_data)

def test_userLogin():
    post_data={
        "username":"Lin",
        "password":"1234"
    }
    testpost(url+"/userLogin",post_data)

def test_getUserInfo():
    thisurl=url+"/getUserInfo_{}".format("Lin")
    testget(thisurl)

def test_updateUserInfo():
    put_data={
        "user_id":"2",
        "username":"Lin",
        "email":"1390297535@qq.com"
    }    
    thisurl=url+"/updateUserInfo"
    testput(thisurl,put_data)

if __name__=="__main__":
    test_updateUserInfo()