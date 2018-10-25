
library(tidytext)
library(dplyr)

# T18) Utilize a libDocumento para reproduzir os experimentos descritos no artigo
# (OLIVEIRA et al., 2014). Para este experimento utilize obrigatoriamente as
# bases do Marco Civil-{I e II}. Escolha uma base extra, presente no artigo
# ou da literatura. Discuta, detalhe e proponha uma melhoria no algoritmo
# da Figura 1, descrito em (OLIVEIRA et al., 2014). Submeta os códigos
# necessários para estes experimentos.

setwd("C:/Users/james/PROJETOS/RII/T18.CLUSTER/")


dataset.matrix <- read.csv2("marcoCivil/marcocivil.mtx", 
                            sep = " ", header = F, 
                            skip = 2)[1:3]

dataset.classe1 <- read.csv2("marcoCivil/mc1.class", 
                             header = F,  skip = 1)[1]

dataset.classe2 <- read.csv2("marcoCivil/mc2.class", 
                             header = F, skip = 1)[1]

dataset.matrix.test <- dataset.matrix %>% filter(V1 > 4300 )
dataset.classe1.teste <- data.frame( classes = dataset.classe1[-1:-4299, ])
dataset.classe2.teste <- data.frame( classes = dataset.classe2[-1:-4299, ])

reg <- nrow(dataset.classe1.teste)
featu <- max(dataset.matrix.test$V2)
tam <- nrow(dataset.matrix.test)

matrixMarket.test <- rbind(c(reg, featu, tam), dataset.matrix.test)

cat("%%MatrixMarket matrix coordinate integer general", file = "matrix.mtx", append = F)
write.table(matrixMarket.test, file = "teste.txt", col.names = F, row.names = F, append = T)

cat("# Posicao politica", file = "classes1.txt", append = F)
write.table(dataset.classe1.teste, file = "classes1.txt", col.names = F, row.names = F, append = T)

cat("# Posicao politica", file = "classes2.txt", append = F)
write.table(dataset.classe2.teste, file = "classes2.txt", col.names = F, row.names = F, append = T)


