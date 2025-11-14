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

module load samtools

pairtools dedup \
    --max-mismatch 3 \
    --mark-dups \
    --output \
        >( pairtools split \
            --output-pairs /projects/battlelab-hpc/gmoorhead/dedup_output/SRR21758931.nodups.pairs.gz \
            --output-sam /projects/battlelab-hpc/gmoorhead/dedup_output/SRR21758931.nodups.bam \
         ) \
    --output-unmapped \
        >( pairtools split \
            --output-pairs /projects/battlelab-hpc/gmoorhead/dedup_output/SRR21758931.unmapped.pairs.gz \
            --output-sam /projects/battlelab-hpc/gmoorhead/dedup_output/SRR21758931.unmapped.bam \
         ) \
    --output-dups \
        >( pairtools split \
            --output-pairs /projects/battlelab-hpc/gmoorhead/dedup_output/SRR21758931.dups.pairs.gz \
            --output-sam /projects/battlelab-hpc/gmoorhead/dedup_output/SRR21758931.dups.bam \
         ) \
    --output-stats /projects/battlelab-hpc/gmoorhead/dedup_output/SRR21758931.dedup.stats \
    /projects/battlelab-hpc/gmoorhead/SRR21758931.sorted.pairs.gz