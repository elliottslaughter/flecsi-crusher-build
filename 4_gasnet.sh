#!/bin/bash

set -e

source 0_env.sh

cd gasnet
make -j CONDUIT=ofi-slingshot11 GASNET_INSTALL_DIR=$RISTRA_INSTALL_PREFIX/gasnet CC=cc CXX=CC GASNET_CFLAGS="-fPIC -DGASNETI_FORCE_PIC" GASNET_CXXFLAGS="-fPIC -DGASNETI_FORCE_PIC" LDFLAGS=-fPIC
cd $RISTRA_INSTALL_PREFIX/gasnet
make clean
make -j${THREADS:-16}
