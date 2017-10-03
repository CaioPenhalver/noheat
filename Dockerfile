FROM debian:jessie
MAINTAINER Caio Penhalver

RUN echo "deb http://ftp.debian.org/debian experimental main" >> /etc/apt/sources.list
RUN echo "deb http://ftp.debian.org/debian sid main" >> /etc/apt/sources.list
RUN apt-get update -qq
RUN apt-get install libc6 libstdc++6 unixodbc-dev -y --force-yes
RUN apt-get install -y --no-install-recommends vim curl locales

RUN apt-get install -y nodejs npm

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN mkdir -p /noheat

WORKDIR /noheat

ADD . /noheat
