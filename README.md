# rasa_shopping_bot
此项目是基于rasa搭建的电商导购机器人demo,旨在说明使用rasa可以搭建真正解决实际问题的多轮对话机器人,而不是普通的用来闲聊的聊天机器人,
另外rasa核心框架是完全开源的,技术方面在业内也是非常领先的,欢迎更多朋友一起来研究使用完善rasa及其社区生态。

# rasa相关

## 官网文档

https://rasa.com/docs/rasa/

## rasa x安装

>pip install rasa-x --extra-index-url https://pypi.rasa.com/simple

## 模型训练
>rasa train

默认使用data下面的训练数据

默认生成的模型保存在models目录下面

## 启动rasa x可视化界面
>rasa x

对话效果
![](shopping.jpg)

centos启动提示找不到_sqlite3时
File "/root/.pyenv/versions/3.6.5/lib/python3.6/sqlite3/dbapi2.py", line 27, in <module>
    from _sqlite3 import *
ModuleNotFoundError: No module named '_sqlite3'
需要安装相关包

>yum -y install sqlite sqlite-devel

然后再重新安装python

>pyenv install 3.6.5

## duckling介绍
https://github.com/facebook/duckling
duckling是facebootk开源的一个通过规则把文本内容解析成结构化数据的Haskell library,比如时间,货币,路程,体积,email等等,具体可看官网


本地docker启动duckling服务启动

docker run -d -p 38000:8000 --name=duckling rasa/duckling

也可以不启动duckling服务,那需要注释掉config.yml里面关于DucklingHTTPExtractor的配置


duckling镜像本地拉不下来时,可以增加docker的其他国内镜像
https://docker.mirrors.ustc.edu.cn

https://hub-mirror.c.163.com



# 对话场景说明

本demo目前只是一个普通电商导购里面的尺码咨询推荐场景,要适合更丰富的场景需要再编写story来实现
具体场景如下:

![](story.png)


# 其他说明

运行环境macos或者centos7.6.5

python版本建议3.6.5及以上

可通过安装python虚拟环境pyenv来安装新版本python,

# 联系方式

我的知乎专栏,https://zhuanlan.zhihu.com/c_1139855880001495040,

也可以扫描我的微信公众号,会分享更多对话机器人相关的经验感悟,

![](weixin.jpg)