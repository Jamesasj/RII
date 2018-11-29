setwd("C:/Users/james/PROJETOS/RII/S5.LSI/")
library(SnowballC)
library(lsa)

txt <- list.files()
myMatrix = textmatrix( txt[1], minWordLength = 1)

myLSAspace <- lsa( myMatrix, dims = dimcalc_share())

myNewMatrix = as.textmatrix(myLSAspace)

teste <- query("computer information", rownames(myMatrix))

