#!/bin/bash

appPath=/var/www/app

# installs
apt-get install -y build-essential git 
apt-get install -y python python-dev python-setuptools
apt-get install -y nginx supervisor
easy_install pip
pip install uwsgi

# nginx
echo "daemon off;" >> /etc/nginx/nginx.conf
ln -sf /ops/live/vhost.conf /etc/nginx/sites-enabled/default
chown -R www-data /var/www/app

# pip
pipPath=/var/www/app/requirements.txt
if [ -f $pipPath ];
then
    pip install -r $pipPath
fi

# supervisor
ln -sf /ops/live/supervisord.conf /etc/supervisord.conf

# django
if [ ! -f $appPath/manage.py ];
then
	django-admin.py startproject website $appPath
fi
