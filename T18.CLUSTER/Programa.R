#setwd("C:/Users/james/PROJETOS/RII/T18.CLUSTER/")

download.file("https://inf.ufes.br/~elias/dataSets/marcoCivil/marcoCivil.csv", destfile = "marcoCivil.csv" )

dataset <- read.csv2("marcoCivil.csv")

library(tidytext)
library(dplyr)

dados.twitter <- data.frame(id = 1:nrow(dataset), 
                            text = as.character(dataset$text))

dados.twitter$text <- as.character(dados.twitter$text)

dados.classe = data.frame(id = dados.twitter$id, 
                          classe = dataset$Sentido)

dados.df <- dados.twitter %>% unnest_tokens(word, text)
dados.fw <- dados.df %>% count(word, sort = T)
dados.fw$id <- c(1:nrow(dados.fw))

dados <- left_join(dados.df, dados.fw, by=c('word'='word'))
dados$n <- NULL
dados$word <- NULL
colnames(dados) <- c("twitt", "palavra")
dados2 <- dados %>% count(twitt, palavra)

nDocs <- nrow(dataset)
nFeatu <- nrow(dados.fw)
totalF <- sum(dados.fw$n)

lista <- c(nDocs, nFeatu, totalF)
dados2 <- rbind(lista, dados2)
cat("%%FEATURES.MTX\n", file= "features.mtx", append = F )
write.table(dados2, "features.mtx", append = T, row.names = F, col.names = F)

write.table(dados.classe, "classe.csv", row.names = F)
write.table(dados.fw, "dicionario.csv", row.names = F)

