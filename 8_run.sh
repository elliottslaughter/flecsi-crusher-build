#!/bin/sh
#SBATCH -p batch
#SBATCH --time=00:30:00
#SBATCH --mail-type=ALL
#SBATCH -A CSC335_crusher

nodes=$SLURM_JOB_NUM_NODES

srun -n $nodes ./flecsi/tutorial/standalone/poisson/build/app/poisson 1000 1000 --backend-args='-ll:gpu 1'
