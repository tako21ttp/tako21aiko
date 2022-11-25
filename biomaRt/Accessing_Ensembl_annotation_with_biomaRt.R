# 1. Introduction
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("biomaRt")

browseVignettes("biomaRt")

# 2. Selecting an Ensembl BioMart database and dataset

# Every analysis with biomaRt starts with selecting a BioMart database to use. The commands below will connect us to Ensembl’s most recent version of the Human Genes BioMart.
library(biomaRt)
ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")

ensembl

# If this your first time using biomaRt , you might wonder how to find the two arguments we supplied to the useEnsembl() command. This is a two step process, but once you know the setting you need you can use the version shown above as a single command. These initial steps are outlined below.

#Step1: Identifying the database you need
listEnsembl()

ensembl <- useEnsembl(biomart = "genes")
ensembl

#Step2: Choosing a dataset
datasets <- listDatasets(ensembl)
head(datasets)

searchDatasets(mart = ensembl, pattern = "hsapiens")

ensembl <- useDataset(dataset = "hsapiens_gene_ensembl", mart = ensembl)

ensembl 


# 3. How to build a biomaRt query

affyids <- c("202763_at","209310_s_at","207500_at")

getBM(attributes = c('affy_hg_u133_plus_2', 'entrezgene_id'),
      filters = 'affy_hg_u133_plus_2',
      values = affyids, 
      mart = ensembl)

getBM(attributes = c('affy_hg_u133_plus_2', 'hgnc_symbol',
                     'chromosome_name','start_position',
                     'end_position', 'band'),
      filters = 'affy_hg_u133_plus_2', 
      values = affyids, 
      mart = ensembl)

# 4. original
ID=read.csv ("./data/affyIDList.csv",  header=FALSE)
ID

ID_list = ID$V1
ID_list

export_data <- getBM(attributes = c('affy_hg_u133_plus_2', 'hgnc_symbol'),
      filters = 'affy_hg_u133_plus_2', 
      values = ID_list, 
      mart = ensembl)

write.csv(x = export_data, file = "./data/exportdata.csv")
