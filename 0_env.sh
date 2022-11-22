module load PrgEnv-amd
module load cray-pmi
module load amd/5.3.0 # this is how you configure the ROCm version in the Cray programming environment
module load rocm/5.3.0 # for good measure

if [[ -d spack ]]; then
    . spack/share/spack/setup-env.sh
    spack env activate ristra-rocmcc

    # Not sure why we need this, but otherwise it fails to detect xpmem
    export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/cray/xpmem/2.4.4-2.3_11.2__gff0e1d9.shasta/lib64/pkgconfig"
fi

# Do not look in either $HOME/.spack or any system files. This is to avoid
# issues where the user's preexiting configuration interferes with this install.
export SPACK_DISABLE_LOCAL_CONFIG=1
# After this:
# packages.yaml will live in spack/etc/spack/packages.yaml

export RISTRA_INSTALL_PREFIX=$PWD/install

export CMAKE_PREFIX_PATH="$RISTRA_INSTALL_PREFIX/kokkos:$CMAKE_PREFIX_PATH"
export CMAKE_PREFIX_PATH="$RISTRA_INSTALL_PREFIX/gasnet:$CMAKE_PREFIX_PATH"
export CMAKE_PREFIX_PATH="$RISTRA_INSTALL_PREFIX/legion:$CMAKE_PREFIX_PATH"

export THREADS=64
