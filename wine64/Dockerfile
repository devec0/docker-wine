FROM debian:sid
MAINTAINER James Hebden <https://github.com/jdhebden>

# building wine64
ENV WINE_VERSION=1.8
ENV LOG /var/log
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update; apt-get -y upgrade; apt-get install -y git wget; apt-get build-dep 

RUN mkdir -p /usr/src/wine64 /usr/src/wine32

RUN git clone git://source.winehq.org/git/wine.git /usr/src/wine;   \
RUN cd /usr/src/wine; git checkout wine-$WINE_VERSION

WORKDIR /usr/src/wine64
RUN exec /bin/bash -c '/usr/src/wine/configure --enable-win64 --prefix=/usr 2> >(tee $LOG/wine64-config-error.log) > >(tee $LOG/wine64-config.log)'
RUN exec /bin/bash -c 'make -j$(nproc) 2> >(tee $LOG/wine64-build-error.log) > >(tee $LOG/wine64-build.log)'
RUN exec /bin/bash -c 'make install 2> >(tee $LOG/wine64-install-error.log) > >(tee $LOG/wine64-install.log)'

