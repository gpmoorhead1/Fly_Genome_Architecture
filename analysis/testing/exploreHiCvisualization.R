# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# 
# BiocManager::install("HiContacts")
# 
# if (!require("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# 
# BiocManager::install("HiContactsData")

## Start here:
library(HiContacts)
library(HiContactsData)

cool_file <- CoolFile("~/Data/testHiC/out.10000.cool")
hic_test <- import(cool_file)
# resolution(hic_test) # Getter function to access a feature of the hic_test file called 'resolution'

matrixYeast <- plotMatrix(hic_test,use.scores = 'count')
matrixYeast # this line plots the full genome contact map

yeastSubset <- hic_test["chrI"]
subsetMatrix <- plotMatrix(yeastSubset,use.scores ='count')
subsetMatrix # this line plots the ChrI contact map



# This is using the Dixon et al. 2012 (Bing Ren) Mouse ESC Hi-C dataset, but I think there are some header
# errors that don't jive with whatever this package's CoolFile() command likes to read in
dixonCool <- CoolFile("~/Data/testHiC/Dixon2012-H1hESC-HindIII-allreps-filtered.1000kb.cool")
dixon <- import(dixonCool)
resolution(dixon)

matrixDixon <- plotMatrix(dixon)
matrixDixon