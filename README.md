# Fly_Genome_Architecture

## Title: Investigating the Effect of Genomic Bin Size on Drosophila Micro-C Contact Maps

## Description
For our project, we’re hoping to implement a processing pipeline for analyzing Drosophila Micro-C data. We plan to generate contact maps for the Drosophila genome (and select loci) over varying sizes of genomic bins. We’re inspired by a figure from the Peer Review Author Response in Bing et al. 2024 (eLife, hence the publicly accessible peer-review). One reviewer’s critique rested on the fact that certain features that frequently appear in mammalian Hi-C maps are not frequently detected in fly maps (dots at the tips of pyramids,stripes on the sides of pyramids, etc.). The authors responded by taking Mammalian Micro-C data binned at 5kb and re-generating heatmaps at smaller bins down to 200bp, which led to the disappearance of certain artifacts. The authors reasoned that these ‘features’ in mammalian contact maps are from higher bin sizes than in fly contact maps. We aim to ask this question in reverse—does increasing bin size in fly contact maps lead to the appearance of such artifacts?

We will be taking data from Mohana et al 2023, where they study the regulatory genome in the Drosophila nervous system in terms of chromosome level organization. They have both aligned reads and processed contact data available. We will process the data using SIP (Rowley et al 2020) similarly to the way the authors did to validate our results. We will then pursue creating contact matrices using different bin sizes.

# Published Figure
From [Bing et al 2024 Peer Review Author Response Figure 9](https://elifesciences.org/articles/94070/peer-reviews#sa4):
![elife-94070-sa4-fig9-v1](https://github.com/user-attachments/assets/f0c98b3c-13a6-4944-a729-fdf59844d260)

# Data Sets with IDs
Fastq files can be found [on the SRA](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA885423&o=acc_s%3Aa). We are planning on using SRR21758931 which is a sample from the wing disc of a larval fly. The authors used the wing disc as a non-CNS control tissue in their experiments.

# Software with Versions
- Align fastqs with [bwa v0.7.19](https://github.com/lh3/bwa) to the [dm6 reference genome](https://ftp.ncbi.nlm.nih.gov/geo/series/GSE120nnn/GSE120751/suppl/)
- Parse, sort, and deduplicate reads with [pairtools v0.3.0](https://zenodo.org/records/2649383)
- Then we can use the [cooler processing software v0.10.4](https://github.com/open2c/cooler) to make contact matrices, specifically varying the genomic bin width using `cooler makebins`.

# Proposed Goals
1. Implement a Micro-C/Hi-C analysis pipeline to generate contact maps for regions of the Drosophila genome. If we can access Rockfish, then we will align these reads and proceed from there. If we cannot use Rockfish or another cluster, we will use the authors’ aligned (but not yet binned) reads and develop a pipeline from there.
2. Once we have a pipeline, our next steps might best be described as exploratory data analysis. We plan to adjust parameters of our contact map pipeline (firstly bin size, then perhaps bin/matrix filtering thresholds) and see if visually detectable features emerge on the contact maps as reported in Bing et al. 2024. We will investigate the same eve locus as in Bing et al., but it would be useful to also compare contact maps to loci investigated in Mohana et al (though the smallest locus they visualize actually contains multiple TADs, on chrom3L), the source of our data.
3. If Goal 2 completely fails, but we succeed in implementing a pipeline for generating Micro-C/Hi-C contact maps, we could go back into the literature and retrieve time course Hi-C data from Drosophila larvae over their last few nuclear cycles before they undergo the maternal-to-zygotic transition. Hug et. al 2017 (Cell) has their data available and presents several visuals to go cross-reference our results with.


# References
- [Bing et al. 2024](https://elifesciences.org/articles/94070#content)
- [Mohana et al. 2023](https://www.sciencedirect.com/science/article/pii/S0092867423007419?via%3Dihub)
- [Rowley et al. 2020](https://pubmed.ncbi.nlm.nih.gov/32127418/)
- [Hug et al. 2017](https://www.cell.com/cell/fulltext/S0092-8674(17)30343-4)
