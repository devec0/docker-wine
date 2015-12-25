#!/bin/bash

cd /usr/src/wine64
/usr/src/wine/configure --enable-win64 2> >(tee $LOG/wine64-config-error.log) > >(tee $LOG/wine64-config.log)
make -j16 2> >(tee $LOG/wine64-build-error.log) > >(tee $LOG/wine64-build.log)

exec "$@"

