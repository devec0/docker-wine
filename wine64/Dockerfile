FROM jdhebden/debian64:sid
MAINTAINER James Hebden <https://github.com/jdhebden>

# building wine64
ENV WINE_VERSION=1.8
ENV LOG=/var/log
ENV DEBIAN_FRONTEND=noninteractive

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get -y upgrade && apt-get install -y git wget

RUN apt-get -y build-dep wine64 

RUN apt-get -y install dpkg-dev devscripts

RUN mkdir -p /usr/src/wine/wine64 /usr/src/wine/wine32

COPY ./run.sh /usr/src/run.sh
RUN chmod 0755 /usr/src/run.sh

VOLUME /usr/src/wine
WORKDIR /usr/src/wine64
CMD /usr/src/run.sh
