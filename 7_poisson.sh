#!/bin/bash

set -e

source 0_env.sh

cd flecsi/tutorial/standalone/poisson
CC=cc CXX=CC cmake -Bbuild
cd build
make -j${THREADS:-16}
