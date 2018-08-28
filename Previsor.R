setwd("/home/james/Documents/RII/db_revisor")
library(dplyr)
library(tidytext)
library(tidyr)
library(stringr)
library(e1071)

texto <- scan("texto1.txt", what="char", sep="\n", encoding = "UTF-8")
dados.full <- data_frame(line = 1:length(texto), text = texto)
dados.bigram <- dados.full %>% unnest_tokens(tregram, text, token = "ngrams", n = 3)
dados.bigram.summ <- dados.bigram %>% count(tregram, sort = TRUE)
dados.bigram.summ <- dados.bigram.summ %>% separate(tregram, c("word1","word2","word3"), sep = " ")

modelo <- naiveBayes(word3 ~ ., data = dados.bigram.summ)

infe <- data.frame(word1 = "Pátria", word2 = "amada")

predict(modelo, infe, type = "class")


predict(modelo, infe, type = "raw")