#!/bin/bash
#####################
#SBATCH --job-name=pairtools
#SBATCH --time=8:0:0
#SBATCH --mem=32G
#SBATCH --partition=cpu
#SBATCH --mincpus=8
#SBATCH --mail-user=gmoorhe1@jh.edu
#SBATCH --mail-type=end
#####################

pairtools parse -o /projects/battlelab-hpc/gmoorhead/SRR21758931.pairs.gz \
    --chroms-path /home/gmoorhe1/fly/reference/dm6.chrom.sizes.tsv \
    --output-stats SRR21758931.stats \
    --assembly dm6 \
    /projects/battlelab-hpc/gmoorhead/SRR21758931.bam