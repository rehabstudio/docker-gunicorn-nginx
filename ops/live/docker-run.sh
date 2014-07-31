#!/bin/bash

# install project deps
pip install -r /var/www/app/requirements.txt

# start supervisor services
/usr/local/bin/supervisord -n
