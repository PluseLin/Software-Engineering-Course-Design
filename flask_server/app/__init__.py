from flask import *
from flask_sqlalchemy import *
from flask_cors import *
from flask_server.config import config
#此处相对引用会报错。。尝试解决无果后换用绝对路径引用
db=SQLAlchemy()

def create_app(config_name):
    app=Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)

    CORS(app,resources={r'/*':{'origins':'*'}})

    db.init_app(app)
    
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    from .map import theparks as theparks_blueprint
    app.register_blueprint(theparks_blueprint)

    return app