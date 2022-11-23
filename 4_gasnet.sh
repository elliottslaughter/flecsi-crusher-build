#!/bin/bash

set -e

source 0_env.sh

cd gasnet
make -j${THREADS:-16} CONDUIT=ofi-slingshot11 GASNET_INSTALL_DIR=$RISTRA_INSTALL_PREFIX/gasnet
