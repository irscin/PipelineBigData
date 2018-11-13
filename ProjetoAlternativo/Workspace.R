######################################## 1) Carrega dados
df_medidas  <- data.frame()
arqs = list.files(pattern = ".txt$", recursive = TRUE)
for (a in 1:length(arqs))
{
  arquivo = arqs[a]
  # buscamos arquivos em subdiretórios
  if (!(length(i <- grep('/', arquivo))) == 0)
  {
    movimento = unlist(strsplit(arquivo, "/")[1][1])[1]
    genero = substr(unlist(strsplit(arquivo, "-"))[9],1,1)
    data <- read.table(arquivo)
    data$arquivo <- arquivo
    data$movimento <- movimento
    data$genereo <- genero
    df_medidas <- rbind(df_medidas,data)
  }
}
colnames(df_medidas) <- c("X","Y", "Z", "Arquivo", "Movimento", "Genero")