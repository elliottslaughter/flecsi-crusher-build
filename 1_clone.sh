#!/bin/bash

set -e

git clone -b develop --recursive https://github.com/kokkos/kokkos.git
git clone https://github.com/StanfordLegion/gasnet.git
git clone -b kokkos-hip-cr --recursive https://gitlab.com/eddy16112/legion.git
#git clone git@gitlab.lanl.gov:flecsi/flecsi
git clone https://github.com/flecsi/flecsi.git
