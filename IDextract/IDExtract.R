sets = queryAE(species = "sapiens")
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("affy")
#BiocManager::install("affydata")
#BiocManager::install("ArrayExpress")

library(affy)  
#library(ArrayExpress)

browseVignettes("affy")

Data <- ReadAffy()
eset <- mas5(Data)
write.exprs(eset, file="./data/mydata.tsv")

ID=read.tsv ("./data/mydata.tsv",  header=FALSE)
ID

ID=read.table(file="./data/affyIDList_2.csv", sep="," ,
           header=T,       #1行目を列名として取り込む場合
)
ID_list<-ID$Probeset
length(ID_list)
