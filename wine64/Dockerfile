FROM debian:sid
MAINTAINER James Hebden <https://github.com/jdhebden>

# building wine64
ENV WINE_VERSION=1.8
ENV LOG=/var/log
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update; apt-get -y upgrade; apt-get install -y git wget; apt-get build-dep 

RUN mkdir -p /usr/src/wine64 /usr/src/wine32

RUN git clone git://source.winehq.org/git/wine.git /usr/src/wine;   \
RUN cd /usr/src/wine; git checkout wine-$WINE_VERSION

COPY ./run.sh /usr/src/run.sh
RUN chmod 0755 /usr/src/run.sh

WORKDIR /usr/src/wine64
RUN /usr/src/run.sh
