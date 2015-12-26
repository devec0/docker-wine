FROM jdhebden/debian32:sid
MAINTAINER James Hebden <https://github.com/jdhebden>

# building wine32
ENV WINE_VERSION=1.8
ENV LOG=/var/log
ENV DEBIAN_FRONTEND=noninteractive

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade && apt-get install -y git wget 

RUN apt-get -y build-dep wine32

RUN apt-get -y install dpkg-dev devscripts

RUN mkdir -p /usr/src/wine/wine32 /usr/src/wine/wine64
COPY ./run.sh /usr/src/run.sh
RUN chmod 0755 /usr/src/run.sh

VOLUME /usr/src/wine
WORKDIR /usr/src/wine/wine32
CMD /usr/src/run.sh
