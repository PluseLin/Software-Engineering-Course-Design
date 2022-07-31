from . import db

class User:
    __tablename__="user"
    id=db.Column(db.Integer,primary_key=True)
    username=db.Column(db.String(20))
    password=db.Column(db.String(20))
    email=db.Column(db.String(50))
    reg_time=db.Column(db.DateTime())

class Admin:
    __tablename__="admin"
    id=db.Column(db.Integer,primary_key=True)
    adminname=db.Column(db.String(20))
    password=db.Column(db.String(20))

class Collection:
    __tablename__="collection"
    id=db.Column(db.Integer,primary_key=True)
    u_id=db.Column(db.Integer,db.ForeignKey('user.id'))
    p_id=db.Column(db.Integer,db.ForeignKey('park.id'))

class Comment:
    __tablename__="comment"
    id=db.Column(db.Integer,primary_key=True)
    u_id=db.Column(db.Integer,db.ForeignKey('user.id'))
    p_id=db.Column(db.Integer,db.ForeignKey('park.id'))
    comment_time=db.Column(db.DateTime())
    content=db.Column(db.String(500))
    score=db.Column(db.Integer)

class Park:
    __tablename__="park"
    id=db.Column(db.Integer,primary_key=True)
    location=db.Column(db.String(100))
    update_time=db.Column(db.DateTime())
    map=db.Column(db.String(255))
    detail=db.Column(db.String(1000))

class Spot:
    __tablename__="spot"
    p_id=db.Column(db.Integer,db.ForeignKey('park.id'))
    detail=db.Column(db.String(500))
    update_time=db.Column(db.DateTime())
    map=db.Column(db.String(255))