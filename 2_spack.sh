#!/bin/bash

set -e

git clone -b releases/v0.18 -c feature.manyFiles=true https://github.com/spack/spack.git

. spack/share/spack/setup-env.sh

spack env create ristra-rocmcc
#spacktivate ristra-rocmcc
spack env activate ristra-rocmcc
spack repo add ./flecsi/spack-repo
spack compiler find
cp packages.yaml spack/etc/spack/packages.yaml
spack external find perl
spack external find cmake
spack install --only dependencies flecsi@2+graphviz+hdf5 backend=mpi ^mpich@8.1.20%rocmcc@5.3.0
