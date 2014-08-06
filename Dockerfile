FROM ubuntu:14.04
MAINTAINER Peter McConnell <peter.mcconnell@rehabstudio.com>

# keep upstart quiet
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

# no tty
ENV DEBIAN_FRONTEND noninteractive

# get up to date
RUN apt-get update --fix-missing

# file management
ADD ./ops /ops
ADD ./app /var/www/app
RUN find /ops -name "*.sh" -exec chmod +x {} \;

# global installs [applies to all envs!]
RUN apt-get install -y build-essential git 
RUN apt-get install -y python python-dev python-setuptools
RUN easy_install pip

# rev er up
CMD cd /ops && ./run.sh

# expose port(s)
EXPOSE 80
