module load PrgEnv-amd
module load cray-pmi
module load rocm/5.3.0

if [[ -d spack ]]; then
    . spack/share/spack/setup-env.sh
fi

# Do not look in either $HOME/.spack or any system files. This is to avoid
# issues where the user's preexiting configuration interferes with this install.
export SPACK_DISABLE_LOCAL_CONFIG=1
# After this:
# packages.yaml will live in spack/etc/spack/packages.yaml
