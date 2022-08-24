from email.policy import default
from . import db

# from flask_server.app import db
#此处相对引用会报错。。尝试解决无果后换用绝对路径引用
class User(db.Model):
    __tablename__="user"
    id=db.Column(db.Integer,primary_key=True)
    username=db.Column(db.String(20))
    password=db.Column(db.String(20))
    email=db.Column(db.String(50))
    reg_time=db.Column(db.DateTime())

class Admin(db.Model):
    __tablename__="admin"
    id=db.Column(db.Integer,primary_key=True)
    adminname=db.Column(db.String(20))
    password=db.Column(db.String(20))

class Collection(db.Model):
    __tablename__="collection"
    id=db.Column(db.Integer,primary_key=True,autoincrement=True)#autoincrement=True为id自增长
    u_id=db.Column(db.Integer,db.ForeignKey('user.id'))
    p_id=db.Column(db.Integer,db.ForeignKey('park.id'))

class Comment(db.Model):
    __tablename__="comment"
    id=db.Column(db.Integer,primary_key=True,autoincrement=True)#autoincrement=True为id自增长
    u_id=db.Column(db.Integer,db.ForeignKey('user.id'))
    p_id=db.Column(db.Integer,db.ForeignKey('park.id'))
    comment_time=db.Column(db.DateTime())
    content=db.Column(db.String(500))#############换为text类型
    score=db.Column(db.Integer)

class Park(db.Model):
    __tablename__="park"
    id=db.Column(db.Integer,primary_key=True)
    parkname=db.Column(db.String(50))
    longitude=db.Column(db.String(100))
    latitude=db.Column(db.String(100))
    update_time=db.Column(db.DateTime())
    picture=db.Column(db.String(255),default="default.jpg")
    detail=db.Column(db.String(1000))

class Spot(db.Model):
    __tablename__="spot"
    id=db.Column(db.Integer,primary_key=True)
    p_id=db.Column(db.Integer,db.ForeignKey('park.id'))
    detail=db.Column(db.String(500))
    update_time=db.Column(db.DateTime())
    picture=db.Column(db.String(255),default="default.jpg")
    spotname = db.Column(db.String(50))
    