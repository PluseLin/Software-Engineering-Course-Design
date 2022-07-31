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