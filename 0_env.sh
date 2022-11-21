module load PrgEnv-amd
module load cray-pmi
module load rocm/5.3.0

if [[ -d spack ]]; then
    . spack/share/spack/setup-env.sh
fi
