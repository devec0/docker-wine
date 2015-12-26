#!/bin/bash
LOG=/usr/src/log
mkdir -p $LOG
mkdir -p /usr/src/wine/wine32
mkdir -p /usr/src/wine/wine64
# make wine32
rm -Rf /usr/src/wine-package
cp -av /usr/src/wine/git /usr/src/wine-package
cp -av /usr/src/wine/debian /usr/src/wine-package/debian
cd /usr/src/wine-package
dpkg-buildpackage -B

mkdir -p /usr/src/wine/deb/
cp -v /usr/src/*.deb /usr/src/wine/deb

exec "$@"

