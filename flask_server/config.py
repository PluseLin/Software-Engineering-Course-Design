import os
basedir=os.path.abspath(os.path.dirname(__file__))
class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:012704@localhost/navigator'
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    BOOTSTRAP_SERVE_LOCAL = True
    SECRET_KEY= "ahsdilwjaidajldjawlidjal"

    SQLALCHEMY_TRACK_MODIFICATIONS = True
    SQLALCHEMY_COMMIT_TEARDOWN = True
    @staticmethod
    def init_app(app):
        pass

class DevelopmentConfig(Config):
    pass

config={
    'development':DevelopmentConfig,
    'default':DevelopmentConfig
}