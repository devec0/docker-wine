#!/bin/bash
LOG=/var/log

# make wine32
cd /usr/src/wine32
/usr/src/wine/configure --with-wine64=../wine64 2> >(tee $LOG/wine32-config-error.log) > >(tee $LOG/wine32-config.log)
make -j16 2> >(tee $LOG/wine32-build-error.log) > >(tee $LOG/wine32-build.log)

exec "$@"

