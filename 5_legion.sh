#!/bin/bash

set -e

source 0_env.sh

# Not sure why we need this, but otherwise it fails to detect xpmem
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/cray/xpmem/2.4.4-2.3_11.2__gff0e1d9.shasta/lib64/pkgconfig"

cd legion
CC=cc CXX=CC cmake -Bbuild -DLegion_HIJACK_HIP=OFF -DLegion_USE_HIP=ON -DLegion_HIP_TARGET=ROCM -DLegion_USE_Kokkos=ON -DKokkos_DIR=$RISTRA_INSTALL_PREFIX/kokkos/lib64/cmake/Kokkos -DLegion_NETWORKS=gasnetex -DGASNet_CONDUIT=ofi -DLegion_USE_HDF5=ON -DCMAKE_INSTALL_PREFIX=$RISTRA_INSTALL_PREFIX/legion -DLegion_BUILD_EXAMPLES=OFF -DLegion_EMBED_GASNet=OFF -DGASNet_ROOT_DIR=$RISTRA_INSTALL_PREFIX/gasnet -DCMAKE_HIP_ARCHITECTURES=gfx90a -DBUILD_SHARED_LIBS=ON
cd build
make -j${THREADS:-16}
make install
