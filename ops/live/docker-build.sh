#!/bin/bash

# installs
apt-get install -y build-essential git 
apt-get install -y python python-dev python-setuptools
apt-get install -y nginx supervisor
easy_install pip
pip install uwsgi

# nginx
echo "daemon off;" >> /etc/nginx/nginx.conf
rm /etc/nginx/sites-enabled/default && ln -s /ops/live/vhost.conf /etc/nginx/sites-enabled/default
chown -R www-data /var/www/app

# pip
pipPath=/var/www/app/requirements.txt
if [ -f $pipPath ];
then
    pip install -r $pipPath
fi

# supervisor
rm /etc/supervisord.conf && ln -s /ops/live/supervisord.conf /etc/supervisord.conf

# kickstart django
django-admin.py startproject website /var/www/app/
    