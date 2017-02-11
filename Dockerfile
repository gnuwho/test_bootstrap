FROM phusion/baseimage
MAINTAINER masnun
 
ENV DEBIAN_FRONTEND noninteractive
# 
RUN apt-get update
RUN apt-get install -y python python-pip python-dev 
RUN apt-get install -y libxml2-dev libxslt-dev libffi-dev libssl-dev 
RUN apt-get install -y libmysqlclient-dev
RUN pip install django==1.10.3 
WORKDIR /app/src
RUN django-admin.py startproject --template=https://github.com/pinax/pinax-starter-projects/zipball/account cdtapp -n webpack.config.js -n PROJECT_README.md
WORKDIR /app/src/cdtapp 
RUN pip install -r requirements.txt
COPY users.json /app/src/cdtapp/fixtures
COPY sites.json /app/src/cdtapp/fixtures
RUN python manage.py migrate
RUN python manage.py loaddata sites 
RUN python manage.py loaddata users
 
EXPOSE 8000
