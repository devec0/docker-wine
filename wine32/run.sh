#!/bin/bash
LOG=/usr/src/log

mkdir -p $LOG
mkdir -p /usr/src/wine/wine32
mkdir -p /usr/src/wine/wine64
# make wine32
cd /usr/src/wine/wine32
/usr/src/wine/git/configure --with-wine64=../wine64 2> >(tee $LOG/wine32-config-error.log) > >(tee $LOG/wine32-config.log)
make -j16 2> >(tee $LOG/wine32-build-error.log) > >(tee $LOG/wine32-build.log)

exec "$@"

