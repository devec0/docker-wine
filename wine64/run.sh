#!/bin/bash
LOG=/usr/src/log

mkdir -p $LOG
mkdir -p /usr/src/wine/wine32
mkdir -p /usr/src/wine/wine64
cd /usr/src/wine/wine64
/usr/src/wine/git/configure --enable-win64 2> >(tee $LOG/wine64-config-error.log) > >(tee $LOG/wine64-config.log)
make -j16 2> >(tee $LOG/wine64-build-error.log) > >(tee $LOG/wine64-build.log)

exec "$@"

