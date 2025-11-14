#!/bin/bash
#####################
#SBATCH --job-name=pairtools
#SBATCH --time=8:0:0
#SBATCH --mem=64G
#SBATCH --partition=cpu
#SBATCH --mincpus=8
#SBATCH --mail-user=gmoorhe1@jh.edu
#SBATCH --mail-type=end
#####################

pairtools sort --nproc 8 \
    -o /projects/battlelab-hpc/gmoorhead/SRR21758931.sorted.pairs.gz \
    /projects/battlelab-hpc/gmoorhead/SRR21758931.pairs.gz