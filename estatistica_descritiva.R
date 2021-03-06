# Introdu��o ao R
# Estat�stica descritiva
# Data: 02/08/21

# Estat�stica descritiva --------------------------------------------------

datasets::iris

mean(iris$Sepal.Length) # Valor m�dio do comprimento de s�palas
median(iris$Sepal.Length) # Valor da mediana
max(iris$Sepal.Length) # Valor m�ximo
min(iris$Sepal.Width) # Valor m�nimo
range(iris$Sepal.Length) # Apresenta ambos valores m�ximo e m�nimo
sd(iris$Petal.Length) # Desvio padr�o
var(iris$Petal.Length) # Vari�ncia
length(iris$Sepal.Length) # N�mero de amostras
quantile(iris$Sepal.Length) # Quantis em intervalos regulares
summary(iris) # Resumo dos dados
str(iris) # Estrutura dos dados

# Fun��o que apresenta a mesma funcionalidade do indexador "$"

with(iris, mean(Sepal.Length)) # Calcula a m�dia
with(iris, mean(Sepal.Length) / length(Sepal.Length)) # Calcula erro padr�o

# Importar tabela ---------------------------------------------------------

install.packages("tibble") # Instalar pacote
library(tibble) # carregar o pacote

choose.files()
dados <- read.csv2("C:\\Users\\jeann\\Documents\\pRaticando-Softawer-R\\estatistica_descritiva\\precipit_temp_inmet_macau.CSV")
dados
tibble(dados)
names(dados)

# Estat�stica descritiva com dplyr ----------------------------------------

library("dplyr")
library("magrittr")

dados1 <- dados %>%
  select(temp_max, HORA..UTC., m�s) %>%
  filter(HORA..UTC. == "12:00") 

dados1 %>%
  group_by(m�s) %>%
  summarise(media = mean(temp_max), sd = sd(temp_max))
