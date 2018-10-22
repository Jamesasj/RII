setwd("C:\\Users\\james\\PROJETOS\\RII\\T17.CLUSTER")

dados <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data", header = FALSE)

write.csv(dados, sep = ";", "/iris/iris.data")
