Command for downloading fastq file:
```
/home/gmoorhe1/sratoolkit.3.2.1-ubuntu64/bin/prefetch -p SRR21758931
/home/gmoorhe1/sratoolkit.3.2.1-ubuntu64/bin/fasterq-dump --progress SRR21758931
```



Setting up BWA:
```
git clone https://github.com/lh3/bwa.git
cd bwa; make
./bwa index ref.fa
```

Then I ran the fly_alignment.sh script to align to a fastq


Commands for creating bam + bai:

```
samtools sort -@ 4 -o SRR21758931.bam SRR21758931.sam
samtools index -@ 4 -o SRR21758931.bai SRR21758931.bam
```

Pairtools Commands:

```
pairtools parse -c /home/gmoorhe1/fly/reference/dm6.chrom.sizes.tsv \
  --output-stats SRR21758931.stats \
  -o SRR21758931.pairs.gz \
  /projects/battlelab-hpc/gmoorhead/SRR21758931.bam
```
