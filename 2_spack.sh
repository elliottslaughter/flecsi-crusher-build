#!/bin/bash

set -e

source 0_env.sh

git clone -b releases/v0.18 -c feature.manyFiles=true https://github.com/spack/spack.git

. spack/share/spack/setup-env.sh

spack env create ristra-rocmcc
spack env activate ristra-rocmcc
spack repo add ./flecsi/spack-repo

# Find system compilers
#spack compiler find
cat compilers.yaml >> spack/var/spack/environments/ristra-rocmcc/spack.yaml
spack config get compilers

# Find system packages
cp packages.yaml spack/etc/spack/packages.yaml
spack external find perl
spack external find cmake

# Install dependencies
spack install --only dependencies flecsi@2+graphviz+hdf5 backend=mpi ^cray-mpich@8.1.17%rocmcc@5.3.0
