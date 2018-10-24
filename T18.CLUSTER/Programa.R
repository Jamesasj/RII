#setwd("C:/Users/james/PROJETOS/RII/T18.CLUSTER/")

download.file("https://inf.ufes.br/~elias/dataSets/marcoCivil/marcoCivil.csv", destfile = "marcoCivil.csv" )

dataset <- read.csv2("marcoCivil.csv")

library(tidytext)
library(dplyr)

dados.twitter <- data.frame(id = 1:nrow(dataset), text = as.character(dataset$text))
dados.twitter$text <- as.character(dados.twitter$text)
dados.df <- dados.twitter %>% unnest_tokens(word, text)
dados.fw <- dados.df %>% count(word, sort = T)
dados.fw$id <- c(1:nrow(dados.fw))

dados <- left_join(dados.df, dados.fw, by=c('word'='word'))
dados$n <- NULL
dados$word <- NULL
colnames(dados) <- c("twitt", "palavra")
dados2 <- dados %>% count(twitt, palavra)

write.table(dados2, "saida.csv")