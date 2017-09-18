FROM node:6
MAINTAINER NoHeat

RUN echo "deb http://ftp.debian.org/debian experimental main" >> /etc/apt/sources.list
RUN echo "deb http://ftp.debian.org/debian sid main" >> /etc/apt/sources.list
RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends vim postgresql-client locales

RUN npm install npm -g

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN mkdir -p /app

WORKDIR /app
ADD . /app
