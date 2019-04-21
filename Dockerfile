FROM milo1996/centos6-python2.7

RUN yum install -y mysql-devel

# 创建项目目录
WORKDIR /data/
ADD requirements.txt /data/
RUN pip install -r /data/requirements.txt

# 创建 user_00 用户
RUN useradd user_00 -g users && \ 
    echo "user_00:user_00" | chpasswd

RUN chown -R user_00:users /data/

# 切换到 user_00 用户
USER user_00
# 在 /data/ 下创建 release code 目录
RUN mkdir release code

CMD /bin/bash

