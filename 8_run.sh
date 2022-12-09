#!/bin/sh
#SBATCH -p batch
#SBATCH --time=00:30:00
#SBATCH --mail-type=ALL
#SBATCH -A CSC335_crusher

nodes=$SLURM_JOB_NUM_NODES

srun -n $(( nodes * 8 )) --cpus-per-task $(( 64 / 8 )) --gpus-per-task 1 ./flecsi/tutorial/standalone/poisson/build/app/poisson -m 5000 -t 1e-64 8000 8000 --backend-args='-ll:gpu 1 -ll:csize 16G -ll:fsize 16G'
