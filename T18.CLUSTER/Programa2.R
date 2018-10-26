
# T18) Utilize a libDocumento para reproduzir os experimentos descritos no artigo
# (OLIVEIRA et al., 2014). Para este experimento utilize obrigatoriamente as
# bases do Marco Civil-{I e II}. Escolha uma base extra, presente no artigo
# ou da literatura. Discuta, detalhe e proponha uma melhoria no algoritmo
# da Figura 1, descrito em (OLIVEIRA et al., 2014). Submeta os c�digos
# necess�rios para estes experimentos.

#setwd("C:/Users/james/PROJETOS/RII/T18.CLUSTER/")


dataset.matrix <- read.csv2("marcoCivil/marcocivil.mtx", sep = " ", header = F,skip = 2)[1:3]

dataset.classe1.teste = data.frame(id = c(0:4300))
write.table(dataset.classe1.teste, file = "treino.txt", col.names =F, row.names = F, append = F)

dataset.classe2.teste = data.frame(id = c(4300:nrow(dataset.matrix)))
write.table(dataset.classe1.teste, file = "teste.txt", col.names =F, row.names = F, append = F)

system("aLine --classifier --algorithm knn --features marcoCivil/marcocivil.mtx --train treino.txt --test teste.txt --labels marcoCivil/mc1.class -k 3 -o output1.txt")


system("aLine --classifier --algorithm knn --features marcoCivil/marcocivil.mtx --train treino.txt --test teste.txt --labels marcoCivil/mc2.class -k 13 -o output2.txt")
