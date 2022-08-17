from flask import Blueprint

theparks=Blueprint('theparks',__name__)

from flask_server.app.map import park