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
