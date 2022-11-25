if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("biomaRt")

browseVignettes("biomaRt")

# Every analysis with biomaRt starts with selecting a BioMart database to use. The commands below will connect us to Ensembl’s most recent version of the Human Genes BioMart.
library(biomaRt)
ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")

# If this your first time using biomaRt , you might wonder how to find the two arguments we supplied to the useEnsembl() command. This is a two step process, but once you know the setting you need you can use the version shown above as a single command. These initial steps are outlined below.
#Step1
listEnsembl()

ensembl <- useEnsembl(biomart = "genes")
ensembl


affyids <- c("202763_at","209310_s_at","207500_at")
getBM(attributes = c('affy_hg_u133_plus_2', 'entrezgene_id'),
      filters = 'affy_hg_u133_plus_2',
      values = affyids, 
      mart = ensembl)
