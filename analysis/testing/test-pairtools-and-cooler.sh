#!/bin/bash

# Start by getting MATalpha_R1.bam
wget https://github.com/open2c/distiller-test-data/raw/master/bam/MATalpha_R1.bam
# Also downloading chromsizes file, which tells us the name order and size of SacCer chromosomes
wget https://raw.githubusercontent.com/open2c/distiller-test-data/master/genome/sacCer3.reduced.chrom.sizes

# Pairtools parse converts paired-end sequence alignments into .pairs format
pairtools parse -c sacCer3.reduced.chrom.sizes -o MATalpha_R1.pairs.gz --drop-sam MATalpha_R1.bam
# Started running at 3:59, finished at ~4:01
# This also 'flips' all of the reads, such that the unique read closer to chr1 pos0 appears first in the name

pairtools sort --nproc 8 -o MATalpha_R1.sorted.pairs.gz MATalpha_R1.pairs.gz



## START WITH COOLER
# Make a cooler file with the pairs file generated above and the reference file
# the -c1 -p1 -c2 -p2 inputs are specifying what column (base 1) of the .pairs file I think each read appears in
cooler cload pairs sacCer3.reduced.chrom.sizes:10000 MATalpha_R1.sorted.pairs out.10000.cool -c1 2 -p1 3 -c2 4 -p2 5
# This outputs out.10000.cool
# the ':10000' specifies that 10kb is our resolution

# Makes the heatmap symmetric by some algorithm. -p specifies 10 processors to speed it up
cooler balance -p 10 out.10000.cool

# Dumps a balanced cooler file's contents to a text stream
cooler dump -b -t pixels --header --join -r chrIII -r2 chrX out.10000.cool | less -S
# -b 'applies balancing weights to data', -t pixels specifies which part of the table to dump, and in this case it's only the upper half of the triangle
# --header prints column header names as the first row
# --join makes bin_id's the chromosome and position of each bin in bp units
# -r specifies the genomic region to dump from the row dimension, -r2  specifies the genomic region to dump along the column dimension (if ommitted you get same column range as row range)
# specify the .cool file too