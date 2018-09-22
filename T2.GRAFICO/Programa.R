file.name <- "https://inf.ufes.br/~elias/dataSets/basic-datasets.tar.gz"
#file.context <- dirname(rstudioapi::getSourceEditorContext()$path)
file.name2 <- "dataset.tar.gz"

#setwd(file.context)

file.folder.mainDir = getwd()
file.folder.output <- "output"


dir.create(file.path(file.folder.mainDir, file.folder.output), showWarnings = FALSE)

download.file(file.name, destfile =  file.name2)
untar(file.name2, exdir = file.path(file.folder.mainDir, file.folder.output))


file.list <- data.frame(arquivos = list.files(file.folder.output, full.names = TRUE))
write.table(file.list,"indice.dat", quote = FALSE, row.names = FALSE, col.names = FALSE)

retorn <- system("aLine -i -l indice.dat -d resultado")


#setwd(file.path(file.folder.mainDir))
#unlink(subDir, recursive = TRUE)
