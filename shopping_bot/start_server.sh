rasa run --enable-api

# 需要auth的话增加下面参数
#--auth-token thisismysecret
# 三种load model的方式,本地,私有服务器,公有云存储,优先本地加载,本地没有时再从私有服务器加载(在endpoints.yml里面定义url路径),再没有时从公有云加载(aws,gcs)

#http://rasa.com/docs/rasa/user-guide/running-the-server/
#Rasa can load your model in three different ways:
#
#Load the model specified via -m from your local storage system,
#Fetch the model from a server (see Fetching Models from a Server), or
#Fetch the model from a remote storage (see Cloud Storage).

#Rasa tries to load a model in the above mentioned order, i.e. it only tries to load your model from a server if it could not find the model on your local storage system.
#http://rasa.com/docs/rasa/user-guide/running-the-server/#server-fetch-from-server
#rasa run -m models --enable-api --log-file out.log --endpoints my_endpoints.yml
#The model server is specified in the endpoint configuration (my_endpoints.yml), where you specify the server URL Rasa regularly queries for zipped Rasa models:
#
#models:
#  url: http://my-server.com/models/default@latest
#  wait_time_between_pulls: 10   # [optional](default: 100)
#Note
#If you want to pull the model just once from the server, set wait_time_between_pulls to None.
#
#Note
#Your model server must provide zipped Rasa models, and have {"ETag": <model_hash_string>} as one of its headers. Rasa will only download a new model if this model hash has changed.


#http://rasa.com/docs/rasa/user-guide/command-line-interface/
#usage: rasa run [-h] [-v] [-vv] [--quiet] [-m MODEL] [--log-file LOG_FILE]
#                [--endpoints ENDPOINTS] [-p PORT] [-t AUTH_TOKEN]
#                [--cors [CORS [CORS ...]]] [--enable-api]
#                [--remote-storage REMOTE_STORAGE] [--credentials CREDENTIALS]
#                [--connector CONNECTOR] [--jwt-secret JWT_SECRET]
#                [--jwt-method JWT_METHOD]
#                {actions} ... [model-as-positional-argument]
#
#positional arguments:
#  {actions}
#    actions             Runs the action server.
#  model-as-positional-argument
#                        Path to a trained Rasa model. If a directory is
#                        specified, it will use the latest model in this
#                        directory. (default: None)
#
#optional arguments:
#  -h, --help            show this help message and exit
#  -m MODEL, --model MODEL
#                        Path to a trained Rasa model. If a directory is
#                        specified, it will use the latest model in this
#                        directory. (default: models)
#  --log-file LOG_FILE   Store logs in specified file. (default: rasa_core.log)
#  --endpoints ENDPOINTS
#                        Configuration file for the model server and the
#                        connectors as a yml file. (default: None)
#
#Python Logging Options:
#  -v, --verbose         Be verbose. Sets logging level to INFO. (default:
#                        None)
#  -vv, --debug          Print lots of debugging statements. Sets logging level
#                        to DEBUG. (default: None)
#  --quiet               Be quiet! Sets logging level to WARNING. (default:
#                        None)
#
#Server Settings:
#  -p PORT, --port PORT  Port to run the server at. (default: 5005)
#  -t AUTH_TOKEN, --auth-token AUTH_TOKEN
#                        Enable token based authentication. Requests need to
#                        provide the token to be accepted. (default: None)
#  --cors [CORS [CORS ...]]
#                        Enable CORS for the passed origin. Use * to whitelist
#                        all origins. (default: None)
#  --enable-api          Start the web server API in addition to the input
#                        channel. (default: False)
#  --remote-storage REMOTE_STORAGE
#                        Set the remote location where your Rasa model is
#                        stored, e.g. on AWS. (default: None)
#
#Channels:
#  --credentials CREDENTIALS
#                        Authentication credentials for the connector as a yml
#                        file. (default: None)
#  --connector CONNECTOR
#                        Service to connect to. (default: None)
#
#JWT Authentication:
#  --jwt-secret JWT_SECRET
#                        Public key for asymmetric JWT methods or shared
#                        secretfor symmetric methods. Please also make sure to
#                        use --jwt-method to select the method of the
#                        signature, otherwise this argument will be ignored.
#                        (default: None)
#  --jwt-method JWT_METHOD
#                        Method used for the signature of the JWT
#                        authentication payload. (default: HS256)