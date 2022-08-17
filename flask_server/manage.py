# from app import create_app,db
# from app.models import *
from flask_server.app import create_app,db
from flask_server.app.models import *
import config

app =create_app('default')

app.config.from_object(config)

if __name__=="__main__":
    #app.run(debug=True)
    app.run(host="127.0.0.1",port=8000,debug=True)