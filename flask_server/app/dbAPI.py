# from flask_server.app import db
# from flask_server.app.models import *

from . import db
from .models import *

import datetime

def User_Query_by_id(id:int):
    return User.query.filter_by(id=id).first()

def User_Query_by_username(username:str):
    return User.query.filter_by(username=username).first()

def User_Query_by_username_and_password(username:str,password:str):
    return User.query.filter_by(
        username=username,password=password
    ).first()

def User_Insert(user:User):
    db.session.add(user)
    db.session.commit()

def User_Update(user:User):
    db.session.add(user)
    db.session.commit()

#########-----------以下为评论相关--------------------
def Comment_Add(park_id:int,user_id:int,score:int,content:str):
    NewComment=Comment(
        u_id=user_id,p_id=park_id,score=score,content=content,comment_time=datetime.datetime.now()
    )
    db.session.add(NewComment)
    db.session.commit()
def Comments_Query_by_parkid(id:int):
    return db.session.query(Comment.score,Comment.content).filter_by(p_id=id).all()

#########-----------以下为收藏相关--------------------

def Collection_Query_by_uid(u_id:int):
    return Collection.query.filter_by(u_id=u_id).all()
    #return Collection.query.filter_by(u_id=u_id).first()

def Collection_Query_by_p_uid(u_id:int,p_id:int):
    #return Collection.query.filter_by(u_id=u_id).all()
    return Collection.query.filter_by(u_id=u_id,p_id=p_id).first()

def Collection_Query_by_pid(p_id:int):
    return Collection.query.filter_by(p_id=p_id).all()

def Collection_Add(u_id:int,p_id:int):
    collection=Collection(
        u_id=u_id,p_id=p_id
    )
    db.session.add(collection)
    db.session.commit()

def Collection_Delete(u_id:int,p_id:int):
    #delcol=Collection_Query_by_uid_and_pid(u_id,p_id)
    delcol=Collection_Query_by_p_uid(u_id,p_id)
    if(delcol is not None):
        db.session.delete(delcol)
        db.session.commit()

#########-----------以下为公园、景点相关--------------------

def Park_Query_by_id(id:int):
    return Park.query.filter_by(id=id).first()

def Park_Query_search(searchInput):
    return Park.query.filter(Park.parkname.contains(searchInput)).first()#all()

def Spots_Query_by_parkid(id:int):
    return db.session.query(Spot.spotname,Spot.detail,Spot.picture).filter_by(p_id=id).all()

def Park_Qyery_all():
    return Park.query.all()