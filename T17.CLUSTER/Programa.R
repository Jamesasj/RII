#setwd("C:\\Users\\james\\PROJETOS\\RII\\T17.CLUSTER")

dados <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data", header = FALSE)

write.csv(dados, sep = ";", "iris.data")

write.table(dados[1:4], sep = " ", "iris_data.mtx", 
          row.names = FALSE, col.names = FALSE)

commando = 'aLine --clustering --algorithm kmeans --features iris_data.mtx -k 3 --num-inter 200'

system(commando)