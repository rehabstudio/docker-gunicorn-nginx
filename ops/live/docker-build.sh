#!/bin/bash

APP_PATH=/var/app
PIP_PATH=$APP_PATH/requirements.txt

# installs
apt-get install -y nginx supervisor

# pip
if [ -f $PIP_PATH ];
then
    pip install -r $PIP_PATH
fi

# supervisor
ln -sf /ops/live/supervisord.conf /etc/supervisord.conf

# nginx
ln -sf /ops/live/vhost.conf /etc/nginx/sites-enabled/default
chown -R www-data $APP_PATH
service nginx restart
