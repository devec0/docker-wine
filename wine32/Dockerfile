FROM debain:sid
MAINTAINER James Hebden <https://github.com/jdhebden>

# building wine32
ENV WINE_VERSION=1.8
ENV LOG=/var/log
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && dpkg --add-architecture i386 && apt-get update && apt-get -y upgrade && apt-get install -y git wget

RUN apt-get -y builddep wine:i386

COPY ./run.sh /usr/src/run.sh
RUN chmod 0755 /usr/src/run.sh

WORKDIR /usr/src/wine32
CMD /usr/src/run.sh

