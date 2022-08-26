import os
basedir=os.path.abspath(os.path.dirname(__file__))
class Config:
    #SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:root@localhost/navigator'
    #SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:001210@localhost/software_pro'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:012704@localhost/navigator'
    #----------暂时修改一下数据库相关配置： 密码

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
#测试--汉字编码
JSON_AS_ASCII=False