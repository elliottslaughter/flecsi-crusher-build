#!/bin/bash

set -e

source 0_env.sh

cd flecsi
CC=hipcc CXX=hipcc cmake -DENABLE_FLOG=ON -DENABLE_UNIT_TESTS=ON -DENABLE_HDF5=ON -DENABLE_KOKKOS=on -DCMAKE_INSTALL_PREFIX=$RISTRA_PREFIX/flecsi -Bbuild
cd build
make -j${THREADS:-16}
make test
make install
