#!/usr/bin/env bash
set -ex
cd `dirname $0`

readonly LIBVPS_VERSION=8.10.5
readonly SRC=https://github.com/libvips/libvips/releases/download/v${LIBVPS_VERSION}/vips-${LIBVPS_VERSION}.tar.gz
readonly DEST=td-libvips-dev_${LIBVPS_VERSION}
readonly DEB=${DEST}.deb

rm -rf ${DEST}
mkdir -p ${DEST}

cp -rv DEBIAN.template ${DEST}/DEBIAN
sed -i "s/%LIBVPS_VERSION%/${LIBVPS_VERSION}/g" ${DEST}/DEBIAN/*

(
    mkdir -p ${DEST}/usr/local/src
    cd ${DEST}/usr/local/src
    curl -L -o vips-${LIBVPS_VERSION}.tar.gz ${SRC}
    tar zvxf vips-${LIBVPS_VERSION}.tar.gz
    rm vips-${LIBVPS_VERSION}.tar.gz
)
(
    dpkg-deb --build ${DEST}
)

mv ${DEB} ../ppa
