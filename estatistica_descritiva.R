# Introdução ao R
# Estatística descritiva
# Data: 02/08/21

# Estatística descritiva --------------------------------------------------

datasets::iris

mean(iris$Sepal.Length) # Valor médio do comprimento de sépalas
median(iris$Sepal.Length) # Valor da mediana
max(iris$Sepal.Length) # Valor máximo
min(iris$Sepal.Width) # Valor mínimo
range(iris$Sepal.Length) # Apresenta ambos valores máximo e mínimo
sd(iris$Petal.Length) # Desvio padrão
var(iris$Petal.Length) # Variância
length(iris$Sepal.Length) # Número de amostras
quantile(iris$Sepal.Length) # Quantis em intervalos regulares
summary(iris) # Resumo dos dados
str(iris) # Estrutura dos dados

# Função que apresenta a mesma funcionalidade do indexador "$"

with(iris, mean(Sepal.Length)) # Calcula a média
with(iris, mean(Sepal.Length) / length(Sepal.Length)) # Calcula erro padrão

# Importar tabela ---------------------------------------------------------

install.packages("tibble") # Instalar pacote
library(tibble) # carregar o pacote

choose.files()
dados <- read.csv2("C:\\Users\\jeann\\Documents\\pRaticando-Softawer-R\\estatistica_descritiva\\precipit_temp_inmet_macau.CSV")
dados
tibble(dados)
names(dados)

# Estatística descritiva com dplyr ----------------------------------------

library("dplyr")
library("magrittr")

dados1 <- dados %>%
  select(temp_max, HORA..UTC., mês) %>%
  filter(HORA..UTC. == "12:00") 

dados1 %>%
  group_by(mês) %>%
  summarise(media = mean(temp_max), sd = sd(temp_max))
