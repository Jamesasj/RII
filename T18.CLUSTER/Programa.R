#setwd("C:/Users/james/PROJETOS/RII/T18.CLUSTER/")

# T18) Utilize a libDocumento para reproduzir os experimentos descritos no artigo
# (OLIVEIRA et al., 2014). Para este experimento utilize obrigatoriamente as
# bases do Marco Civil-{I e II}. Escolha uma base extra, presente no artigo
# ou da literatura. Discuta, detalhe e proponha uma melhoria no algoritmo
# da Figura 1, descrito em (OLIVEIRA et al., 2014). Submeta os códigos
# necessários para estes experimentos.

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

system("aLine --similarity -m euclidean --features resultado/cache.txt -o resultado2") #calculo da similaridade

write.table(dados.classe, "classe.csv", row.names = F)
write.table(dados.fw, "dicionario.csv", row.names = F)

