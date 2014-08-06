#!/bin/bash

appPath=/var/www/app

# installs
apt-get install -y nginx supervisor
pip install uwsgi

# pip
pipPath=$appPath/requirements.txt
if [ -f $pipPath ];
then
    pip install -r $pipPath
fi

# supervisor
ln -sf /ops/live/supervisord.conf /etc/supervisord.conf

# nginx
ln -sf /ops/live/vhost.conf /etc/nginx/sites-enabled/default
chown -R www-data /var/www/app
service nginx restart

# django
if [ ! -f $appPath/manage.py ];
then
    django-admin.py startproject website $appPath
fi
