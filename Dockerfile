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
RUN chown -R www-data /ops/
RUN find /ops -name "*.sh" -exec chmod +x {} \;

# rev er up
CMD cd /ops && ./run.sh

# expose port(s)
EXPOSE 80
