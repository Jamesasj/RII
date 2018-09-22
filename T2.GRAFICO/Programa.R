file.name <- "https://inf.ufes.br/~elias/dataSets/basic-datasets.tar.gz"
file.name2 <- "dataset.tar.gz"
mainDir = getwd()
subDir <- "output"

dir.create(file.path(mainDir, subDir), showWarnings = FALSE)
setwd(file.path(mainDir, subDir))

download.file(file.name, destfile =  file.name2)

file.list <- untar(file.name2, list = TRUE)
untar(file.name2)




setwd(file.path(mainDir))
unlink(subDir, recursive = TRUE)
