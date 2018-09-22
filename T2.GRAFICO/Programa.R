file.name <- "https://inf.ufes.br/~elias/dataSets/basic-datasets.tar.gz"
file.name2 <- "dataset.tar.gz"
file.name.output <- "indice.dat"

file.folder.mainDir = getwd()
file.folder.output <- "output"

dir.create(file.path(file.folder.mainDir, file.folder.output), showWarnings = FALSE)

download.file(file.name, destfile =  file.name2)
untar(file.name2, exdir = file.path(file.folder.mainDir, file.folder.output))


file.list <- data.frame(arquivos = list.files(file.folder.output, full.names = TRUE))
write.table(file.list, file.name.output, quote = FALSE, row.names = FALSE, col.names = FALSE)

system("aLine -i -l indice.dat -d resultado")

system("aLine --similarity --features resultado/cache.txt -o resultMatrix ")


#unlink(file.folder.output, recursive = TRUE)
#unlink(file.name2)
#unlink(file.name.output)

dados.dicionario <- read.csv("resultado/dictionary.txt",sep = " ", header = FALSE)[1:4]
dados.similidade <- read.csv("similaridade.txt", sep = " ", header = TRUE)

dados.feature <- read.csv("resultado/features.mtx", sep = " ", header = FALSE)
dados.dim <- dados.feature[2,]
dados.feature <- dados.feature[3:nrow(dados.feature),]
colnames(dados.feature) <- c("documento","feature","qtd")

#colnames(dados)<-c("qtd.letras","palavra","freq","qtd.docs")
