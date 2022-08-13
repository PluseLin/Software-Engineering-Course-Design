from . import db
from .models import *

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

def Collection_Query_by_uid(u_id:int):
    return Collection.query.filter_by(u_id=u_id).all()

def Collection_Query_by_pid(p_id:int):
    return Collection.query_filter_by(p_id=p_id).all()

def Collection_Query_by_uid_and_pid(u_id:int,p_id:int):
    return Collection.query_filter_by(u_id=u_id,p_id=p_id).first()

def Collection_Add(u_id:int,p_id:int):
    collection=Collection(
        u_id=u_id,p_id=p_id
    )
    db.session.add(collection)
    db.session.commit()

def Collection_Delete(u_id:int,p_id:int):
    collection=Collection_Query_by_uid_and_pid(u_id,p_id)
    if(collection is not None):
        db.session.delete(collection)
        db.session.commit()

def Park_Query_by_id(id:int):
    return Park.query.filter_by(id=id).first()