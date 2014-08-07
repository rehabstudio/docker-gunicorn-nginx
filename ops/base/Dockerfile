FROM ubuntu:14.04
MAINTAINER Peter McConnell <peter.mcconnell@rehabstudio.com>

# keep upstart quiet
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# no tty
ENV DEBIAN_FRONTEND noninteractive

# get up to date
RUN apt-get update --fix-missing

# global installs [applies to all envs!]
RUN apt-get install -y build-essential git
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y python-pip python-virtualenv
RUN apt-get install -y nginx supervisor

# stop supervisor service as we'll run it manually
RUN service supervisor stop

# build dependencies for postgres and image bindings
RUN apt-get build-dep -y python-imaging python-psycopg2

# create a virtual environment and install all depsendecies from pypi
RUN virtualenv /opt/venv
ADD ./requirements.txt /opt/venv/requirements.txt
RUN /opt/venv/bin/pip install -r /opt/venv/requirements.txt

# expose port(s)
EXPOSE 80
