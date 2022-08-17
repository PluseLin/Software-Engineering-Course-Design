from flask import Blueprint

theparks=Blueprint('theparks',__name__)

from . import park
# from flask_server.app.map import park