from flask import *
from flask_sqlalchemy import *
from flask_cors import *
from config import config

db=SQLAlchemy()

def create_app(config_name):
    app=Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)

    CORS(app,resources={r'/*':{'origins':'*'}})

    db.init_app(app)
    
    from .main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    return app