#!/bin/bash

set -e

source 0_env.sh

cd flecsi
CC=hipcc CXX=hipcc CFLAGS="-I${MPICH_DIR}/include" CXXFLAGS="-I${MPICH_DIR}/include" LDFLAGS="-L${MPICH_DIR}/lib -lmpi" cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_FLOG=ON -DENABLE_UNIT_TESTS=ON -DENABLE_HDF5=ON -DENABLE_KOKKOS=on -DCMAKE_INSTALL_PREFIX=$RISTRA_INSTALL_PREFIX/flecsi -Bbuild
cd build
make -j${THREADS:-16}
#make test # Elliott: tests are still failing
make install
