#!/bin/bash
#####################
#SBATCH --job-name=fly_alignment
#SBATCH --time=24:0:0
#SBATCH --mem=32G
#SBATCH --partition=cpu
#SBATCH --mincpus=24
#SBATCH --mail-user=gmoorhe1@jh.edu
#SBATCH --mail-type=end
#####################


/home/gmoorhe1/fly/bwa/bwa mem -SP5M -t 24 \
	/home/gmoorhe1/fly/reference/GSE120751_Dbus_HiC.fa \
	/projects/battlelab-hpc/gmoorhead/SRR21758931_1.fastq \
	/projects/battlelab-hpc/gmoorhead/SRR21758931_2.fastq \
	> SRR21758931.sam
