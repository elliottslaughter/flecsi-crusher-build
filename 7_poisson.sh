#!/bin/bash

set -e

source 0_env.sh

cd flecsi/tutorial/standalone/poisson
CC=hipcc CXX=hipcc CFLAGS="-I${MPICH_DIR}/include" CXXFLAGS="-I${MPICH_DIR}/include" LDFLAGS="-L${MPICH_DIR}/lib -lmpi" cmake -Bbuild -DCMAKE_BUILD_TYPE=Release
cd build
make -j${THREADS:-16}
