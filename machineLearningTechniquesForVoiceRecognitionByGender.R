# Anotações

# Ao abrir o script.R pela primeira vez no R, ele vai pedir para instalar os pacotes necessários usado pelo script
# Aparecerá na tela uma barra amarela, mostrando quais pacotes devem ser instalados. Clique na opção "Install"



# machineLearningTechniquesForVoiceRecognitionByGender.R - versao 2.0.0

# Codigo executado no R versao 3.6.3
# No Ubuntu 18.04.4 LTS a versao do R 3.4.4 apresentou problemas na instalacao dos 
# pacotes "party" e "C50"
# Na versÃ£o 3.6.3 do R isso foi resolvido

# Data: 21/09/21
# Codigo executado no R versao 1.4.1106
# Sistema operacional Windows 10 Home


# +++ Pacote corrplot +++

# O pacote R corrplot fornece uma ferramenta exploratória visual na matriz de correlação que suporta o reordenamento automático 
# de variáveis para ajudar a detectar padrões ocultos entre as variáveis.

# corrplot é muito fácil de usar e fornece uma rica variedade de opções de plotagem no método de visualização, layout gráfico, 
# cor, legenda, rótulos de texto, etc. Ele também fornece valores p e intervalos de confiança para ajudar os usuários a determinar a significância estatística das correlações.

# corrplot()tem cerca de 50 parâmetros, porém os mais comuns são apenas alguns. Podemos obter um gráfico de matriz de correlação 
# com apenas uma linha de código na maioria dos casos.

# Os parâmetros incluem principalmente usando method, type, order, diag, e etc.

# Existem métodos de visualização sete (parâmetro method) no pacote corrplot, nomeado 'circle', 'square', 'ellipse', 'number',
# 'shade', 'color', 'pie'. A intensidade da cor do glifo é proporcional aos coeficientes de correlação por configuração de cor
# padrão.


# +++ Pacote tidyverse +++

# O "tidyverse" é um pacote guarda-chuva que consolida uma série de ferramentas que fazem parte o ciclo da ciência de dados. 
# Fazem parte do "tidyverse" os pacotes "ggplot2", "dplyr", "tidyr", "purrr", "readr", entre muitos outros.


# +++ Pacote caret +++

# O pacote caret (short for Classification And REgression Training - abreviação de Treinamento de classificação e regressão) 
# é um conjunto de funções que tem o objrtivo de simplificar o processo para a criação de modelos preditivos. O pacote contém 
#ferramentas para:
  
# - divisão de dados
# - pré-processando
# - seleção de recursos
# - ajuste de modelo usando reamostragem
# - estimativa de importância variável
# - bem como outras funcionalidades.


# +++ Pacote dplyr +++

# O dplyr é o pacote mais útil para realizar transformação de dados, aliando simplicidade e eficiência de uma forma elegante. 
# Os scripts em R que fazem uso inteligente dos verbos dplyr e as facilidades do operador pipe tendem a ficar mais legíveis e 
# organizados sem perder velocidade de execução.

# As principais funções do dplyr são:
  
# select() - seleciona colunas
# arrange() - ordena a base
# filter() - filtra linhas
# mutate() - cria/modifica colunas
# group_by() - agrupa a base
# summarise() - sumariza a base


# NA: 'Not Available'/ Missing Values ('Não disponível' / Valores ausentes)

# seq() -  gerar uma sequência de números

# rbind() -> usada para combinar vários vetores, matrizes e/ou quadros de dados por linhas(rows).

# str_c() -> une várias strings em uma única string

# getwd() - retorna um caminho de arquivo absoluto que representa o diretório de trabalho atual do processo R

# setwd(dir) - é usado para definir o diretório de trabalho como "dir"

# sample(x, tamanho) - obtém uma amostra do tamanho especificado dos elementos de x.
# sample(1:6, 10)
# [1] 2 2 5 3 5 3 5 6 3 5
# Os numeros são gerados aleatoriamente
# para as amostras terem o mesmo valor, no caso em que se tenha que se repetir um cenario de uso, usar semente (set.seed(seed))

# c() - O método combina seus argumentos para formar um vetor.

# set.seed() -  Essa funcao serve para poder se reproduzir os resultados dos geradores de numeros 
# pseudo-aleatorios (RNG, na sigla em Ingles). Isso e ideal para criar simulações ou objetos 
# aleatórios que podem ser reproduzidos.


# ---------------------------------------------------------------

# ********** Installing packages ********** # 
install.packages("corrplot")
install.packages("tidyverse")
install.packages("caret")
install.packages("e1071")
install.packages("RSNNS")
install.packages("kernlab")
install.packages("randomForest")
install.packages("party") 
install.packages('import')
install.packages('kknn')
install.packages('klaR')
install.packages('naivebayes')
install.packages('C50')


# ********** importing libraries ********** # 

library(corrplot)       # corrplot.mixed
library(tidyverse)      # theme_set(), ggplot()
library(caret)          # createDataPartition(), trainControl(), train()
library(dplyr)          # select()

#library(e1071)         # train(method="nnet") Nao precisa carrega-lo
#library(RSNNS)         # train(method="mlp")  Nao precisa carrega-lo
#library(kernlab)       # train(method="svmRadial") Nao precisa carrega-lo
#library(randomForest)  # train(method="rf") Nao precisa carrega-lo
#library(party)         # train(method="cforest") Nao precisa carrega-lo
#library(import)        # train(method="parRF") Nao precisa carrega-lo
#library(kknn)          # train(method="kknn") Nao precisa carrega-lo
#library(klaR)          # train(method="nb") Nao precisa carrega-lo
#library(naivebayes)    # train(method="naive_bayes") Nao precisa carrega-lo
#library(C50)           # train(method="C5.0") Nao precisa carrega-lo


# ********** Attributes ********** #
#[Vx] Name - Description - Type

#[V1] meanfreq - mean frequency (in kHz) - float
#[V2]	sd - standard deviation of frequency - float
#[V3]	median	 - median frequency (in kHz) - float
#[V4]	Q25 - first quantile (in kHz) - float
#[V5]	Q75 - third quantile (in kHz) - float
#[V6]	IQR - interquantile range (in kHz) - float
#[V7]	skew - skewness (see note in specprop description) - float
#[V8]	kurt - kurtosis (see note in specprop description) - float
#[V9]	sp.ent - spectral entropy - float
#[V10] sfm - spectral flatness - float
#[V11] mode - mode frequency - float
#[V12] centroid - frequency centroid (see specprop) - float
#[V13] meanfun - average of fundamental frequency measured across acoustic signal - float
#[V14] minfun - minimum fundamental frequency measured across acoustic signal - float
#[V15] maxfun - maximum fundamental frequency measured across acoustic signal - float
#[V16] meandom - average of dominant frequency measured across acoustic signal - float
#[V17] mindom - minimum of dominant frequency measured across acoustic signal - float
#[V18] maxdom - maximum of dominant frequency measured across acoustic signal - float
#[V19] dfrange - range of dominant frequency measured across acoustic signal - float
#[V20] modindx - modulation index. Calculated as the accumulated absolute difference between adjacent measurements of fundamental frequencies divided by the frequency range - float
#[V21] label - Predictor class, male or female - String


# Função que cria e atualiza um arquivo .csv
createAndUpdateFileCsv <- function(pathAndFilename,dfData){
  
  if (file.exists(pathAndFilename)){
    write.table(dfData, file = pathAndFilename, append = TRUE, sep = ",", row.names = FALSE, col.names = FALSE)
    # Se ja existe s? adiciona novas informa??es
  } else {
    write.table(dfData, file = pathAndFilename, sep = ",", row.names = FALSE)
  }
}

# Funcao que adiciona uma linha com valores Na(Not Available) ao final do dataframe
addNaLineAtTheEndOfTheDataframe <- function(dataFrame){
  
  # gerando uma linha com valores nulos
  rowNa <- seq(1:ncol(dataFrame))
  rowNa[1:ncol(dataFrame)] <- NA
  
  # adicionando linha nula no final do dataframe
  dataFrame <- rbind(dataFrame, rowNa) 
  
  return(dataFrame)
}


joinPathAndFilename  <- function(filePath, filename){

  return(str_c(filePath, filename))
}

# Funcao que determina o caminho a ser salvo o arquivo "acuraciaDadosTreino.csv" com base no sistema operacional que o R está rodando
acuraciaDadosTreino <- function(filePath, operationalSystem){
  
  fileName <- "acuraciaDadosTreino.csv"
  
  # se operationalSystem for igual a "windows" representa windows senão for representa linux
  if(operationalSystem == "windows"){
    pathAndFilename <- str_c(filePath, fileName)
  }else{
    pathAndFilename <- str_c(filePath, fileName)
  }
  
  return(pathAndFilename)
}


# Funcao que determina o caminho a ser salvo o arquivo "accuracyOfTrainingDataTechniquesTreino.csv" com base no sistema operacional que o R está rodando
accuracyOfTrainingDataTechniquesTreino <- function(filePath, operationalSystem){
  
  fileName <- "accuracyOfTrainingDataTechniquesTreino.csv"
  
  if(operationalSystem == "windows"){
    pathAndFilename <- str_c(filePath, fileName)
  }else{
    pathAndFilename <- str_c(filePath, fileName)
  }
  
  return(pathAndFilename)
}
  
# Funcao que determina o caminho a ser salvo o arquivo "resultadoPredicao.csv" com base no sistema operacional que o R está rodando
resultadoPredicao <- function(filePath, operationalSystem){
    
    fileName <- "resultadoPredicao.csv"
    
    if(operationalSystem == "windows"){
      pathAndFilename <- str_c(filePath, fileName)
    }else{
      pathAndFilename <- str_c(filePath, fileName)
    }
    
    return(pathAndFilename)
}

# Funcao que determina o caminho a ser salvo o arquivo "resultadoPredicaoProb.csv" com base no sistema operacional que o R está rodando
resultadoPredicaoProb <- function(filePath, operationalSystem){
  
  fileName <- "resultadoPredicaoProb.csv"
  
  if(operationalSystem == "windows"){
    pathAndFilename <- str_c(filePath, fileName)
  }else{
    pathAndFilename <- str_c(filePath, fileName)
  }
  
  return(pathAndFilename)
}

# Funcao que determina o caminho a ser salvo o arquivo "resultadoMatrizConfusaoPredicao.csv" com base no sistema operacional que o R está rodando
resultadoMatrizConfusaoPredicao <- function(filePath, operationalSystem){
  
  fileName <- "resultadoMatrizConfusaoPredicao.csv"
  
  if(operationalSystem == "windows"){
    pathAndFilename <- str_c(filePath, fileName)
  }else{
    pathAndFilename <- str_c(filePath, fileName)
  }
  
  return(pathAndFilename)
}

# Funcao que determina o caminho a ser salvo o arquivo "resultadoMatrizConfusaoEstatist.csv" com base no sistema operacional que o R está rodando
resultadoMatrizConfusaoEstatist <- function(filePath, operationalSystem){
  
  fileName <- "resultadoMatrizConfusaoEstatist.csv"
  
  if(operationalSystem == "windows"){
    pathAndFilename <- str_c(filePath, fileName)
  }else{
    pathAndFilename <- str_c(filePath, fileName)
  }
  
  return(pathAndFilename)
}
  

# ********** Dataset ********** #

# configuracao da analise 
#-----------------------------------------------------------------------------------------------
#seed <- 1234
seed <- 123
metric <- "Accuracy"
operationalSystem <- "unknown"
pathToSaveFile <- "unknown"

# retorna um caminho de arquivo absoluto que representa o diretório de trabalho atual do processo R
# No windows o caminho padrão é "C:/Users/name_User/Documents"
getwd()

# Verifica o sistema operacional que o R está instalado, para definir as variaveis pathToSaveFile e sistema
if(.Platform$OS.type == "windows"){
  
  pathToSaveFile <- "C:/Users/MarioAndre/Documents/"
  
  # definindo area de trabalho do R no Windows, onde será acessado o dataset para analise
  setwd("C:/RStudio/datasets")
  operationalSystem <- "windows"
  
# senao (se for "unix")
}else{
  
  pathToSaveFile <- "/home/marioandre/scripts_R"
  
  # definindo area de trabalho do R no Ubuntu, onde será acessado o dataset para analise
  setwd("/home/marioandre/scripts_R")
  operationalSystem <- "linux"
  
}


# Verifica caminho atual da area de trabalho do R para ler aquivo dataset, confirmar se o caminho foi alterado com o comando setwd()
getwd()


#Importando base de dados

# Se nao for mudar o numero de amostras do dataset para analise, usar a linha abaixo para pegar todas as amostras
#-----------------------------------------------------------------------------------------------
dfGenderVoice <- read.csv("gender_voice_dataset.csv",header=TRUE,encoding="UTF-8")


# Se for mudar o numero de amostras do dataset para um valor especifico, usar o trecho de código abaixo
#-----------------------------------------------------------------------------------------------
# datasetCsv <- "gender_voice_dataset.csv"
# 
# if (file.exists(datasetCsv)){
#   df <- read.csv(datasetCsv,header=TRUE,encoding="UTF-8")
# } else {
#   cat("Arquivo .csv nao existe!")
# }
# 
# # aqui colocar o numero de amostra para se pegar das amostras de Male e Female
# # O numero total de amostras  e o dobro de numberOfLines
# numberOfLines <- 1500
# 
# set.seed(seed)
# maleVoiceLines <- sample(1:1584, numberOfLines)
# 
# set.seed(seed)
# femaleVoiceLines <- sample(1585:3168, numberOfLines)
# 
# pegas as amostras de linhas em maleVoiceLines e femaleVoiceLines e junta tudo em um unico vetor
# dfLines <- c(maleVoiceLines,femaleVoiceLines)
# 
# Seleciona as linhas especificadas em dfLines e pegas todas as colunas
# dfGenderVoice <- df[dfLines,]

#-----------------------------------------------------------------------------------------------

# Visualisar dataset
View(dfGenderVoice)

# Pegando a coluna label, coluna das classes Male e Female
dfClass <- dfGenderVoice[ncol(dfGenderVoice)]

# Visualisar dfClass - coluna label
View(dfClass)

# Mostra resumo estatistico dos dados das colunas
summary(dfGenderVoice)

# Mostra a quantidade de linhas de cada classes da coluna "label"
table(dfClass$label)

# Pegando numero de amostras de Male e Female
numberOfSamplesOfClasses <- table(dfClass$label)

# Pegando numero de amostras de Female
numberOfFemaleClassSamples <- numberOfSamplesOfClasses[1]

# Pegando numero de amostras de Male
numberOfMaleClassSamples <- numberOfSamplesOfClasses[2]


# Ver correlacao entre variaveis do dataset 
#-----------------------------------------------------------------------------------------------
# Gerando correlacao  
# [, -(ncol(dfGenderVoice))] - Todas as linhas, e todas as colunas menos a ultima (coluna label)  
# correlation <- cor(dfGenderVoice[, -(ncol(dfGenderVoice))]
#
# Plotando correlacao
# corrplot.mixed(correlation, upper="ellipse")
#-----------------------------------------------------------------------------------------------


# Visualizando grafico de dispersao entre as variaveis correlacionadas verificadas
#-----------------------------------------------------------------------------------------------

# theme_set() -> usado para trocar de tema do ggplot2
# theme_bw() -> Um tema com fundo branco e linhas de grade pretas

# theme_set(theme_bw())
# 
# # visualizando correlacao entre variavies igual e proximo de 1
# ggplot(dfGenderVoice, aes(x=kurt, y=skew, colour=label)) + geom_point()
# ggplot(dfGenderVoice, aes(x=centroid, y=meanfreq, colour=label)) + geom_point()
# ggplot(dfGenderVoice, aes(x=dfrange, y=maxdom, colour=label)) + geom_point()

#-----------------------------------------------------------------------------------------------


#Preparacao para a analise dos dados
#-----------------------------------------------------------------------------------------------

# Definindo uma semente(seed) para reproduzir a analise
set.seed(seed)

## Definindo 80% dos dados para treino e 20% para teste

# Modo 1
#-----------------------------------------------------------------------------------------------
dataDivisionMethod <- "createDP"

trainingDataIndex  <- createDataPartition(dfGenderVoice$label, p=0.8, list=FALSE)

# Dividindo dados para treino e para teste

# pega todas as linhas que está definida em "trainingDataIndex"
trainingData <- dfGenderVoice[ trainingDataIndex, ]


# pega todas as linhas que não está definida em "trainingDataIndex", o sinal de - (menos) diz pra não pegar essas linhas
testData  <- dfGenderVoice[-trainingDataIndex, ]

#-----------------------------------------------------------------------------------------------

# Modo 2
#-----------------------------------------------------------------------------------------------
# dataDivisionMethod <- "sample-prob"
# 
# grupos <- sample(2, nrow(dfGenderVoice), replace=TRUE, prob=c(0.8, 0.2))
# 
# ## Dividindo dados para treino e para teste
# trainingData <- dfGenderVoice[grupos==1,]
# testData <- dfGenderVoice[grupos==2,]
#-----------------------------------------------------------------------------------------------

# Pegando numero de amostra das classes Male e Female dos dados de treino
numberOfSamplesClassesTrainingData <- table(trainingData$label)
numberOfSamplesFemaleTrainingData <- numberOfSamplesClassesTrainingData[1]
numberOfSamplesMaleTrainingData <- numberOfSamplesClassesTrainingData[2]

# Pegando numero de amostra das classes Male e Female dos dados de teste
numberOfSamplesClassesTestData <- table(testData$label)
numberOfSamplesFemaleTestData <- numberOfSamplesClassesTestData[1]
numberOfSamplesMaleTestData <- numberOfSamplesClassesTestData[2]


# Visualizando os dados de treino e teste
view(trainingData)
view(testData)

# Vendo a quantidade de amostras das classes após a  divisao dos dados de treino e teste
table(trainingData$label)
table(testData$label)

# Pegando as colunas das variaveis de entrada(menos a coluna label) dos dados de treino
trainingDataWithoutLabelColumn <- trainingData[-(ncol(dfGenderVoice))]
trainingDataWithoutLabelColumnScaled = as.data.frame(lapply(trainingDataWithoutLabelColumn, scale))

# Pegando as colunas das variaveis de entrada(menos a coluna label) dos dados de teste
testDataWithoutLabelColumn <- testData[-(ncol(dfGenderVoice))]
testDataWithoutLabelColumnScaled = as.data.frame(lapply(testDataWithoutLabelColumn, scale))

# Pegando a coluna label dos dados de treino
trainingDataLabelColumn <- trainingData$label

# Pegando a coluna label dos dados de teste
testDataLabelColumn <- testData$label


## Visualizando os atributos do dataset ##
#-----------------------------------------------------------------------------------------------
# Plot de densidade

# featurePlot(x = trainingDataWithoutLabelColumnScaled, 
#             y = trainingDataLabelColumn, 
#             plot = "density",
#             strip=strip.custom(par.strip.text=list(cex=.7)),
#             scales = list(x = list(relation="free"), 
#                           y = list(relation="free")),
#             auto.key=list(columns=3),
#             pch = "|",
#             layout = c(3, 7), 
#             adjust = 1.5
# )

#-----------------------------------------------------------------------------------------------

  
# ********** Criando modelos de machine learning ********** #

# Parametros funcao Train #

# Define funcao trainControl para validacao cruzada
# 10-fold repetido 3 vezes

# controle de ajuste da função de treino
fitControl <- trainControl(method = "repeatedcv", number = 10, repeats = 3, savePredictions = T, classProbs = T, returnResamp = "all")


## Criando modelo de treinamento com tecnicas de machine learning ##

#-------------------- RNA --------------------#
model_rna1 <- train(label ~ ., data=trainingData, method="nnet", trControl=fitControl, metric=metric, preProcess=c("center","scale"))

model_rna2 <- train(label ~ ., data=trainingData, method="mlp", trControl=fitControl, metric=metric,  preProcess=c("center","scale"))

model_rna3 <- train(label ~ ., data=trainingData, method="mlpML", trControl=fitControl, metric=metric, preProcess=c("center","scale"))

#-------------------- SVM --------------------#
model_svm1 <- train(label ~ ., data=trainingData, method="svmRadial", trControl=fitControl, metric=metric, preProc=c("center", "scale"),  fit=FALSE)

model_svm2 <- train(label ~ ., data=trainingData, method="svmRadialWeights", trControl=fitControl, metric=metric, preProc=c("center", "scale"),  fit=FALSE)

model_svm3 <- train(label ~ ., data=trainingData, method="svmPoly", trControl=fitControl, metric=metric, preProc=c("center", "scale"),  fit=FALSE)

#-------------------- RPART - Recursive Partitioning And Regression Trees --------------------#
model_cart1 <- train(label ~ ., data=trainingData, method="rpart", trControl=fitControl, metric=metric)

model_cart2 <- train(label ~ ., data=trainingData, method="rpart1SE", trControl=fitControl, metric=metric)

model_cart3 <- train(label ~ ., data=trainingData, method="rpart2", trControl=fitControl, metric=metric)

#-------------------- C5.0 Decision Trees --------------------#
model_c50_1 <- train(label ~ ., data=trainingData, method="C5.0", trControl=fitControl, metric=metric)

model_c50_2<- train(label ~ ., data=trainingData, method="C5.0Rules", trControl=fitControl, metric=metric)

model_c50_3 <- train(label ~ ., data=trainingData, method="C5.0Tree", trControl=fitControl, metric=metric)

#-------------------- RANDOM FOREST --------------------#
model_rf1 <- train(label ~ ., data=trainingData, method="rf", trControl=fitControl, metric=metric)

model_rf2 <- train(label ~ ., data=trainingData, method="cforest", trControl=fitControl, metric=metric)

model_rf3 <- train(label ~ ., data=trainingData, method="parRF", trControl=fitControl, metric=metric)

#-------------------- KNN --------------------#
model_knn1 <- train(label ~ ., data=trainingData, method="knn", trControl=fitControl, metric=metric, preProc=c("center", "scale"))

model_knn2 <- train(label ~ ., data=trainingData, method="kknn", trControl=fitControl, metric=metric, preProc=c("center", "scale"))

#-------------------- NAIVE BAYES --------------------#
model_nbayes1 <- train(label ~ ., data=trainingData, method="nb", trControl=fitControl, metric=metric, preProcess=c("center","scale"))

model_nbayes2 <- train(label ~ ., data=trainingData, method="naive_bayes", trControl=fitControl, metric=metric, preProcess=c("center","scale"))


# Resultados dos treinos 
results <- resamples(list("RNA 1"=model_rna1, "RNA 2"=model_rna2, "RNA 3"=model_rna3, 
                          "SVM 1"=model_svm1,"SVM 2"=model_svm2, "SVM 3"= model_svm3,
                          "CART 1"=model_cart1, "CART 2"=model_cart2, "CART 3"=model_cart3, 
                          "C5.0 1"=model_c50_1, "C5.0 2"=model_c50_2, "C5.0 3"=model_c50_3,
                          "Random Forest 1"=model_rf1,"Random Forest 2"=model_rf2, "Random Forest 3"=model_rf3,
                          "k-NN 1"=model_knn1, "k-NN 2"=model_knn2, 
                          "Naive Bayes 1"=model_nbayes1, "Naive Bayes 2"=model_nbayes2
                          )) 


# Comparacao - Ver os resultados
summary(results)

# Pegando informacoes para gerar arquivo .csv dos resultados das tecnicas - acuracia
#---------------------------------------------
resultOfTrainingDataTechniques <- summary(results)

accuracyOfTrainingDataTechniques <- resultOfTrainingDataTechniques$statistics$Accuracy
#View(accuracyOfTrainingDataTechniques)

# Criando um dataframe com a matriz accuracyOfTrainingDataTechniques
dfAccuracyOfTrainingDataTechniques <- data.frame(accuracyOfTrainingDataTechniques)

# Criando novas colunas no dataframe
dfAccuracyOfTrainingDataTechniques$Technique <- rownames(dfAccuracyOfTrainingDataTechniques)
dfAccuracyOfTrainingDataTechniques$semente <- seed
dfAccuracyOfTrainingDataTechniques$Amostras <- nrow(dfGenderVoice)
dfAccuracyOfTrainingDataTechniques$Amostras_Male <- numberOfMaleClassSamples
dfAccuracyOfTrainingDataTechniques$Amostras_Female <- numberOfFemaleClassSamples
dfAccuracyOfTrainingDataTechniques$Metodo_divisao_Dados <- dataDivisionMethod
dfAccuracyOfTrainingDataTechniques$Amostras_Treino_80p <- nrow(trainingData)
dfAccuracyOfTrainingDataTechniques$Amostras_Treino_Male <- numberOfSamplesMaleTrainingData
dfAccuracyOfTrainingDataTechniques$Amostras_Treino_Female <- numberOfSamplesFemaleTrainingData
dfAccuracyOfTrainingDataTechniques$Amostras_Teste_20p <- nrow(testData)
dfAccuracyOfTrainingDataTechniques$Amostras_Teste_Male <- numberOfSamplesMaleTestData
dfAccuracyOfTrainingDataTechniques$Amostras_Teste_Female <- numberOfSamplesFemaleTestData

# Mudando o nome das linhas do data frame, tira o nome das tecnicas e coloca o numero da linha
rownames(dfAccuracyOfTrainingDataTechniques) <- 1:nrow(dfAccuracyOfTrainingDataTechniques)

#alterando ordem das colunas do dataframe, a coluna "tecnica" e colocada como primeira coluna
dfAccuracyOfTrainingDataTechniques <- dfAccuracyOfTrainingDataTechniques %>% select(Technique, everything())

# chamando funcao para adicionar uma linha Na(Not Available) no dataframe
dfAccuracyOfTrainingDataTechniques <- addNaLineAtTheEndOfTheDataframe(dfAccuracyOfTrainingDataTechniques)

# Definindo caminho do arquivo AccuracyOfTrainingDataTechniques.csv
filePathAccuracyOfTrainingDataTechniques <- joinPathAndFilename(pathToSaveFile, "AccuracyOfTrainingDataTechniques.csv")

#arqAcuraciaTreino <- acuraciaDadosTreino(pathToSaveFile, operationalSystem)

#arqAcuraciaTreino

#Salvando informacoes do dataframe no arquivo .csv
createAndUpdateFileCsv(filePathAccuracyOfTrainingDataTechniques, dfAccuracyOfTrainingDataTechniques)

# Ler arquivo AccuracyOfTrainingDataTechniques.csv
dfAccuracyOfTrainingDataTechniquesView <- read.csv(filePathAccuracyOfTrainingDataTechniques,header=TRUE,encoding="UTF-8")

# visualisa arquivo AccuracyOfTrainingDataTechniques.csv
view(dfAccuracyOfTrainingDataTechniquesView)

#--------------------------------------------

#Pega as demais colunas menos as colunas 2(Min.), 3(X1st.Qu.), 4(Median), 6(X3rd.Qu.), 7(Max.) e 8(NA.s)
dfAccuracyOfTrainingDataTechniquesNew <- dfAccuracyOfTrainingDataTechniques[c(-2,-3,-4,-6,-7,-8)]

# Pega as linhas que comecam com RNA a partir da coluna tecnica 
dfRnaAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^RNA"))

# Ordenando o resultado em ordem decrescente
dfRnaAccuracyOfTrainingData <- dfRnaAccuracyOfTrainingData[order(dfRnaAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
# view(dfRnaAccuracyOfTrainingData)

dfSvmAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^SVM"))
dfSvmAccuracyOfTrainingData <- dfSvmAccuracyOfTrainingData[order(dfSvmAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
# view(dfSvmAccuracyOfTrainingData)

dfCartAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^CART"))
dfCartAccuracyOfTrainingData <- dfCartAccuracyOfTrainingData[order(dfCartAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
# view(dfCartAccuracyOfTrainingData)

dfC5AccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^C5"))
dfC5AccuracyOfTrainingData <- dfC5AccuracyOfTrainingData[order(dfC5AccuracyOfTrainingData$Mean, decreasing=TRUE), ]
#view(dfC5AccuracyOfTrainingData)

dfRandomForestAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^Random"))
dfRandomForestAccuracyOfTrainingData <- dfRandomForestAccuracyOfTrainingData[order(dfRandomForestAccuracyOfTrainingData$Mean, decreasing=TRUE), ]

dfKnnAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^k-NN"))
dfKnnAccuracyOfTrainingData <- dfKnnAccuracyOfTrainingData[order(dfKnnAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
# view(dfKnnAccuracyOfTrainingData)

dfNaiveBayesAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^Naive"))
dfNaiveBayesAccuracyOfTrainingData <- dfNaiveBayesAccuracyOfTrainingData[order(dfNaiveBayesAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
# view(dfNaiveBayesAccuracyOfTrainingData)

# Pegando a melhor tecnica de cada tecnica analisada e juntando em um dataframe
dfBestTechniqueAccuracyOfTrainingData <- rbind(dfRnaAccuracyOfTrainingData[1,], dfSvmAccuracyOfTrainingData[1,], dfCartAccuracyOfTrainingData[1,], dfC5AccuracyOfTrainingData[1,], dfRandomForestAccuracyOfTrainingData[1,], dfKnnAccuracyOfTrainingData[1,], dfNaiveBayesAccuracyOfTrainingData[1,])

# Ordenando o resultado
dfBestTechniqueAccuracyOfTrainingData <- dfBestTechniqueAccuracyOfTrainingData[order(dfBestTechniqueAccuracyOfTrainingData$Mean, decreasing=TRUE), ]

#Adicionando linha Na(Not Available) no dataframe
dfBestTechniqueAccuracyOfTrainingData <- addNaLineAtTheEndOfTheDataframe(dfBestTechniqueAccuracyOfTrainingData)

# Definindo o caminho a ser salvo o arquivo bestTechniqueAccuracyOfTrainingData.csv
filePathBestTechniqueAccuracyOfTrainingData <- joinPathAndFilename(pathToSaveFile, "bestTechniqueAccuracyOfTrainingData.csv")
#arqaccuracyOfTrainingDataTechniques <- accuracyOfTrainingDataTechniquesTreino(pathToSaveFile, operationalSystem)

# Salvando informacoes no arquivo .csv
createAndUpdateFileCsv(filePathBestTechniqueAccuracyOfTrainingData, dfBestTechniqueAccuracyOfTrainingData)

# Lendo arquivo bestTechniqueAccuracyOfTrainingData.csv
dfBestTechniqueAccuracyOfTrainingDataView <- read.csv(filePathBestTechniqueAccuracyOfTrainingData,header=TRUE,encoding="UTF-8")

View(dfBestTechniqueAccuracyOfTrainingDataView)

#-------------------------------



#--------------------------------


# Boxplots das accuracy dos modelos treinados
#---------------------------------------------------

# accuracy_training_models = bwplot(results,pch='|')
# plot(accuracy_training_models[1])

#-----------------------------------------------


# ********** Predição dos resultados ********** #

# Modelos escolhidos com base nos valores de summary(results)
# Olhar o valor da Mean(Media) - representa a acuracia

#-------------------- RNA --------------------#

# Pegando a melhor tecnica de RNA, pega a linha da coluna "tecnica" que comeca com "RNA"
bestTechniqueRna <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^RNA"))

if (bestTechniqueRna[1] == "RNA 1") {
  
  bestRna <- "RNA 1"
  model_rna1
  model_rna1$results
  
  # Realizando a predicao com os dados de teste sem a coluna label
  predictionRna <- predict(model_rna1, testDataWithoutLabelColumn)

  # Comparando os resultados da predicao com os resultados da coluna label dos dados de teste
  resulteHitsAndMissesPredictionRna <- table(Predictions = predictionRna, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionRna
  
  # Pegando a probabilidade do numero de acertos(acuracia) e erros da predicao
  accuracyHitsAndMissesPredictionRna <- prop.table(table(predictionRna == testDataLabelColumn))
  accuracyHitsAndMissesPredictionRna

  
} else if (bestTechniqueRna[1] == "RNA 2") {
  
  bestRna <- "RNA 2"
  model_rna2
  model_rna2$results
  
  predictionRna <- predict(model_rna2, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionRna <- table(Predictions = predictionRna, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionRna
  
  accuracyHitsAndMissesPredictionRna <- prop.table(table(predictionRna == testDataLabelColumn))
  accuracyHitsAndMissesPredictionRna
  
} else {
  
  bestRna <- "RNA 3"
  model_rna3
  model_rna3$results
  
  predictionRna <- predict(model_rna3, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionRna <- table(Predictions = predictionRna, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionRna
  
  accuracyHitsAndMissesPredictionRna <- prop.table(table(predictionRna == testDataLabelColumn))
  accuracyHitsAndMissesPredictionRna
  
}

# preparando os dados de "resulteHitsAndMissesPredictionRna" para o arquivo .csv
#--------------------------------
dfResulteHitsAndMissesPredictionRna <- data.frame(resulteHitsAndMissesPredictionRna)
dfResulteHitsAndMissesPredictionRna$Technique <-  bestRna
dfResulteHitsAndMissesPredictionRna$Mean <- dfRnaAccuracyOfTrainingData$Mean[1]
#--------------------------------
View(dfResulteHitsAndMissesPredictionRna)
# preparando os dados de "accuracyHitsAndMissesPredictionRna" para o arquivo .csv
#------------------------------------------------
dfAccuracyHitsAndMissesPredictionRnaTemp <- data.frame(accuracyHitsAndMissesPredictionRna)

dfAccuracyHitsAndMissesPredictionRna <- data.frame("Errors"=dfAccuracyHitsAndMissesPredictionRnaTemp$Freq[1], "Test_data_accuracy"=dfAccuracyHitsAndMissesPredictionRnaTemp$Freq[2])
dfAccuracyHitsAndMissesPredictionRna$Training_data_accuracy <- dfRnaAccuracyOfTrainingData$Mean[1]
dfAccuracyHitsAndMissesPredictionRna$Technique <- bestRna
#-----------------------------------------------------
View(dfAccuracyHitsAndMissesPredictionRna)


#-------------------- SVM --------------------#

bestTechniqueSvm <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^SVM"))

if (bestTechniqueSvm[1] == "SVM 1") {
  
  bestSvm <- "SVM 1"
  model_svm1
  model_svm1$results
  
  predictionSvm <- predict(model_svm1, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionSvm <- table(Predictions = predictionSvm, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionSvm
  
  accuracyHitsAndMissesPredictionSvm <- prop.table(table(predictionSvm == testDataLabelColumn))
  accuracyHitsAndMissesPredictionSvm
  
  
} else if (bestTechniqueSvm[1] == "SVM 2") {
  
  bestSvm <- "SVM 2"
  model_svm2
  model_svm2$results
  
  predictionSvm <- predict(model_svm2, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionSvm <- table(Predictions = predictionSvm, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionSvm
  
  accuracyHitsAndMissesPredictionSvm <- prop.table(table(predictionSvm == testDataLabelColumn))
  accuracyHitsAndMissesPredictionSvm
  
} else {
  
  bestSvm <- "SVM 3"
  model_svm3
  model_svm3$results
  
  predictionSvm <- predict(model_svm3, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionSvm <- table(Predictions = predictionSvm, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionSvm
  
  accuracyHitsAndMissesPredictionSvm <- prop.table(table(predictionSvm == testDataLabelColumn))
  accuracyHitsAndMissesPredictionSvm
  
}

# # preparando os dados de "resulteHitsAndMissesPredictionSvm" para o arquivo .csv
#--------------------------------
dfResulteHitsAndMissesPredictionSvm <- data.frame(resulteHitsAndMissesPredictionSvm)
dfResulteHitsAndMissesPredictionSvm$Technique <- bestSvm
dfResulteHitsAndMissesPredictionSvm$Mean <- dfSvmAccuracyOfTrainingData$Mean[1]
#--------------------------------
View(dfResulteHitsAndMissesPredictionSvm)
# # preparando os dados de "accuracyHitsAndMissesPredictionSvm" para o arquivo .csv
#------------------------------------------------
dfAccuracyHitsAndMissesPredictionSvmTemp <- data.frame(accuracyHitsAndMissesPredictionSvm)

dfAccuracyHitsAndMissesPredictionSvm <- data.frame("Errors"=dfAccuracyHitsAndMissesPredictionSvmTemp$Freq[1], "Test_data_accuracy"=dfAccuracyHitsAndMissesPredictionSvmTemp$Freq[2])
dfAccuracyHitsAndMissesPredictionSvm$Training_data_accuracy <- dfSvmAccuracyOfTrainingData$Mean[1]
dfAccuracyHitsAndMissesPredictionSvm$Technique <- bestSvm
#-----------------------------------------------------
View(dfAccuracyHitsAndMissesPredictionSvm)


#-------------------- RPART - Recursive Partitioning And Regression Trees--------------------#

bestTechniqueCart <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^CART"))

if (bestTechniqueCart[1] == "CART 1") {
  
  bestCart <- "CART 1"
  model_cart1
  model_cart1$results
  
  predictionCart <- predict(model_cart1, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionCart <- table(Predictions = predictionCart, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionCart
  
  accuracyHitsAndMissesPredictionCart <- prop.table(table(predictionCart == testDataLabelColumn))
  accuracyHitsAndMissesPredictionCart
  
  
} else if (bestTechniqueCart[1] == "CART 2") {
  
  bestCart <- "CART 2"
  model_cart2
  model_cart2$results
  
  predictionCart <- predict(model_cart2, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionCart <- table(Predictions = predictionCart, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionCart
  
  accuracyHitsAndMissesPredictionCart <- prop.table(table(predictionCart == testDataLabelColumn))
  accuracyHitsAndMissesPredictionCart
  
} else {
  
  bestCart <- "CART 3"
  model_cart3
  model_cart3$results
  
  predictionCart <- predict(model_cart3, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionCart <- table(Predictions = predictionCart, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionCart
  
  accuracyHitsAndMissesPredictionCart <- prop.table(table(predictionCart == testDataLabelColumn))
  accuracyHitsAndMissesPredictionCart
  
}

# preparando dados de predicao cart1 para arquivo .csv
#--------------------------------
dfResulteHitsAndMissesPredictionCart <- data.frame(resulteHitsAndMissesPredictionCart)
dfResulteHitsAndMissesPredictionCart$Technique <- bestCart
dfResulteHitsAndMissesPredictionCart$Mean <- dfCartAccuracyOfTrainingData$Mean[1]
#--------------------------------

# preparando dados de probabilidade predicao rna1 para arquivo .csv
#------------------------------------------------
dfAccuracyHitsAndMissesPredictionCartTemp <- data.frame(accuracyHitsAndMissesPredictionCart)

dfAccuracyHitsAndMissesPredictionCart <- data.frame("Errors"=dfAccuracyHitsAndMissesPredictionCartTemp$Freq[1], "Test_data_accuracy"=dfAccuracyHitsAndMissesPredictionCartTemp$Freq[2])
dfAccuracyHitsAndMissesPredictionCart$Training_data_accuracy <- dfCartAccuracyOfTrainingData$Mean[1]
dfAccuracyHitsAndMissesPredictionCart$Technique <- bestCart
#-----------------------------------------------------





#-------------------- C5.0 Decision Trees --------------------#

bestTechniqueC5_0 <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^C5.0"))

if (bestTechniqueC5_0[1] == "C5.0 1") {
  
  bestC5_0 <- "C5.0 1"
  model_c50_1
  model_c50_1$results
  
  predictionC5_0 <- predict(model_c50_1, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionC5_0 <- table(Predictions = predictionC5_0,  Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionC5_0
  
  accuracyHitsAndMissesPredictionC5_0 <- prop.table(table(predictionC5_0 == testDataLabelColumn))
  accuracyHitsAndMissesPredictionC5_0
  
  
} else if (bestTechniqueC5_0[1] == "C5.0 2") {
  
  bestC5_0 <- "C5.0 2"
  model_c50_2
  model_c50_2$results
  
  predictionC5_0 <- predict(model_c50_2, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionC5_0 <- table(Predictions = predictionC5_0,  Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionC5_0
  
  accuracyHitsAndMissesPredictionC5_0 <- prop.table(table(predictionC5_0 == testDataLabelColumn))
  accuracyHitsAndMissesPredictionC5_0
  
} else {
  
  bestC5_0 <- "C5.0 3"
  model_c50_3
  model_c50_3$results
  
  predictionC5_0 <- predict(model_c50_3, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionC5_0 <- table(Predictions = predictionC5_0,  Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionC5_0
  
  accuracyHitsAndMissesPredictionC5_0 <- prop.table(table(predictionC5_0 == testDataLabelColumn))
  accuracyHitsAndMissesPredictionC5_0
  
}

# preparando dados de predicao c50_1 para arquivo .csv
#--------------------------------
dfResulteHitsAndMissesPredictionC5_0 <- data.frame(resulteHitsAndMissesPredictionC5_0)
dfResulteHitsAndMissesPredictionC5_0$Technique <- bestC5_0
dfResulteHitsAndMissesPredictionC5_0$Mean <- dfC5AccuracyOfTrainingData$Mean[1]
#--------------------------------
View(dfResulteHitsAndMissesPredictionC5_0)
# preparando dados de probabilidade predicao rna1 para arquivo .csv
#------------------------------------------------
dfAccuracyHitsAndMissesPredictionC5_0Temp <- data.frame(accuracyHitsAndMissesPredictionC5_0)

dfAccuracyHitsAndMissesPredictionC5_0 <- data.frame("Errors"=dfAccuracyHitsAndMissesPredictionC5_0Temp$Freq[1], "Test_data_accuracy"=dfAccuracyHitsAndMissesPredictionC5_0Temp$Freq[2])
dfAccuracyHitsAndMissesPredictionC5_0$Training_data_accuracy <- dfC5AccuracyOfTrainingData$Mean[1]
dfAccuracyHitsAndMissesPredictionC5_0$Technique <- bestC5_0
#-----------------------------------------------------
View(dfAccuracyHitsAndMissesPredictionC5_0)


#-------------------- RANDOM FOREST --------------------#

bestTechniqueRandomForest <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^Random"))

if (bestTechniqueRandomForest[1] == "Random Forest 1") {
  
  bestRandomForest <- "Random Forest 1"
  model_rf1
  model_rf1$results
  
  predictionRandomForest <- predict(model_rf1, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionRandomForest <- table(Predictions = predictionRandomForest, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionRandomForest
  
  accuracyHitsAndMissesPredictionRandomForest <- prop.table(table(predictionRandomForest == testDataLabelColumn))
  accuracyHitsAndMissesPredictionRandomForest
  
  
} else if (bestTechniqueRandomForest[1] == "Random Forest 2") {
  
  bestRandomForest <- "Random Forest 2"
  model_rf2
  model_rf2$results
  
  predictionRandomForest <- predict(model_rf2, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionRandomForest <- table(Predictions = predictionRandomForest, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionRandomForest
  
  accuracyHitsAndMissesPredictionRandomForest <- prop.table(table(predictionRandomForest == testDataLabelColumn))
  accuracyHitsAndMissesPredictionRandomForest
  
} else {
  
  bestRandomForest <- "Random Forest 3"
  model_rf3
  model_rf3$results
  
  predictionRandomForest <- predict(model_rf3, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionRandomForest <- table(Predictions = predictionRandomForest, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionRandomForest
  
  accuracyHitsAndMissesPredictionRandomForest <- prop.table(table(predictionRandomForest == testDataLabelColumn))
  accuracyHitsAndMissesPredictionRandomForest
  
}

# preparando dados de predicao rf para arquivo .csv
#--------------------------------
dfResulteHitsAndMissesPredictionRandomForest <- data.frame(resulteHitsAndMissesPredictionRandomForest)
dfResulteHitsAndMissesPredictionRandomForest$Technique <- bestRandomForest
dfResulteHitsAndMissesPredictionRandomForest$Mean <- dfRandomForestAccuracyOfTrainingData$Mean[1]
#--------------------------------
View(dfResulteHitsAndMissesPredictionRandomForest)
# preparando dados de probabilidade predicao rna1 para arquivo .csv
#------------------------------------------------
dfAccuracyHitsAndMissesPredictionRandomForestTemp <- data.frame(accuracyHitsAndMissesPredictionRandomForest)

dfAccuracyHitsAndMissesPredictionRandomForest <- data.frame("Errors"=dfAccuracyHitsAndMissesPredictionRandomForestTemp$Freq[1], "Test_data_accuracy"=dfAccuracyHitsAndMissesPredictionRandomForestTemp$Freq[2])
dfAccuracyHitsAndMissesPredictionRandomForest$Training_data_accuracy <- dfRandomForestAccuracyOfTrainingData$Mean[1]
dfAccuracyHitsAndMissesPredictionRandomForest$Technique <- bestRandomForest
#-----------------------------------------------------
View(dfAccuracyHitsAndMissesPredictionRandomForest)


#-------------------- KNN --------------------#

bestTechniqueKnn <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^k-NN"))

if (bestTechniqueKnn[1] == "k-NN 1") {
  
  bestKnn <- "k-NN 1"
  model_knn1
  model_knn1$results
  
  predictionKnn <- predict(model_knn1, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionKnn <- table(Predictions = predictionKnn, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionKnn
  
  accuracyHitsAndMissesPredictionKnn <- prop.table(table(predictionKnn == testDataLabelColumn))
  accuracyHitsAndMissesPredictionKnn
  
} else {
  
  bestKnn <- "k-NN 2"
  model_knn2
  model_knn2$results
  
  predictionKnn <- predict(model_knn2, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionKnn <- table(Predictions = predictionKnn, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionKnn
  
  accuracyHitsAndMissesPredictionKnn <- prop.table(table(predictionKnn == testDataLabelColumn))
  accuracyHitsAndMissesPredictionKnn
  
}

# preparando dados de predicao knn para arquivo .csv
#--------------------------------
dfResulteHitsAndMissesPredictionKnn <- data.frame(resulteHitsAndMissesPredictionKnn)
dfResulteHitsAndMissesPredictionKnn$Technique <- bestKnn
dfResulteHitsAndMissesPredictionKnn$Mean <- dfKnnAccuracyOfTrainingData$Mean[1]
#--------------------------------
View(dfResulteHitsAndMissesPredictionKnn)
# preparando dados de probabilidade predicao rna1 para arquivo .csv
#------------------------------------------------
dfAccuracyHitsAndMissesPredictionKnnTemp <- data.frame(accuracyHitsAndMissesPredictionKnn)

dfAccuracyHitsAndMissesPredictionKnn <- data.frame("Errors"=dfAccuracyHitsAndMissesPredictionKnnTemp$Freq[1], "Test_data_accuracy"=dfAccuracyHitsAndMissesPredictionKnnTemp$Freq[2])
dfAccuracyHitsAndMissesPredictionKnn$Training_data_accuracy <- dfKnnAccuracyOfTrainingData$Mean[1]
dfAccuracyHitsAndMissesPredictionKnn$Technique <- bestKnn
#-----------------------------------------------------
View(dfAccuracyHitsAndMissesPredictionKnn)



#-------------------- NAIVE BAYES --------------------#

bestTechniqueNaiveBayes <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^Naive"))

if (bestTechniqueNaiveBayes[1] == "Naive Bayes 1") {
  
  bestNaiveBayes <- "Naive Bayes 1"
  model_nbayes1
  model_nbayes1$results
  
  predictionNaiveBayes <- predict(model_nbayes1, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionNaiveBayes <- table(Predictions = predictionNaiveBayes, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionNaiveBayes
  
  accuracyHitsAndMissesPredictionNaiveBayes <- prop.table(table(predictionNaiveBayes == testDataLabelColumn))
  accuracyHitsAndMissesPredictionNaiveBayes
  
}else{
  
  bestNaiveBayes <- "Naive Bayes 2"
  model_nbayes2
  model_nbayes2$results
  
  predictionNaiveBayes <- predict(model_nbayes2, testDataWithoutLabelColumn)
  
  resulteHitsAndMissesPredictionNaiveBayes <- table(Predictions = predictionNaiveBayes, Test_data_label_column = testDataLabelColumn)
  resulteHitsAndMissesPredictionNaiveBayes
  
  accuracyHitsAndMissesPredictionNaiveBayes <- prop.table(table(predictionNaiveBayes == testDataLabelColumn))
  accuracyHitsAndMissesPredictionNaiveBayes
  
}

# preparando dados de predicao nbayes2 para arquivo .csv
#--------------------------------
dfResulteHitsAndMissesPredictionNaiveBayes <- data.frame(resulteHitsAndMissesPredictionNaiveBayes)
dfResulteHitsAndMissesPredictionNaiveBayes$Technique <- bestNaiveBayes
dfResulteHitsAndMissesPredictionNaiveBayes$Mean <- dfNaiveBayesAccuracyOfTrainingData$Mean[1]
#--------------------------------
View(dfResulteHitsAndMissesPredictionNaiveBayes)
# preparando dados de probabilidade predicao rna1 para arquivo .csv
#------------------------------------------------
dfAccuracyHitsAndMissesPredictionNaiveBayesTemp <- data.frame(accuracyHitsAndMissesPredictionNaiveBayes)

dfAccuracyHitsAndMissesPredictionNaiveBayes <- data.frame("Errors"=dfAccuracyHitsAndMissesPredictionNaiveBayesTemp$Freq[1], "Test_data_accuracy"=dfAccuracyHitsAndMissesPredictionNaiveBayesTemp$Freq[2])
dfAccuracyHitsAndMissesPredictionNaiveBayes$Training_data_accuracy <- dfNaiveBayesAccuracyOfTrainingData$Mean[1]
dfAccuracyHitsAndMissesPredictionNaiveBayes$Technique <- bestNaiveBayes
#-----------------------------------------------------
View(dfAccuracyHitsAndMissesPredictionNaiveBayes)


# criando arquivo resulteHitsAndMissesPrediction.csv
#---------------------------------------
dfResulteHitsAndMissesTechnicalPrediction <- rbind(dfResulteHitsAndMissesPredictionRna, dfResulteHitsAndMissesPredictionSvm, dfResulteHitsAndMissesPredictionCart, dfResulteHitsAndMissesPredictionC5_0, dfResulteHitsAndMissesPredictionRandomForest, dfResulteHitsAndMissesPredictionKnn, dfResulteHitsAndMissesPredictionNaiveBayes)
View(dfResulteHitsAndMissesTechnicalPrediction)

# # Crinado nova colunas no dataframe
dfResulteHitsAndMissesTechnicalPrediction$semente <- seed
dfResulteHitsAndMissesTechnicalPrediction$Amostras <- nrow(dfGenderVoice)
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Male <- numberOfMaleClassSamples
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Female <- numberOfFemaleClassSamples
dfResulteHitsAndMissesTechnicalPrediction$Metodo_divisao_Dados <- dataDivisionMethod
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Treino_80p <- nrow(trainingData)
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Treino_Male <- numberOfSamplesMaleTrainingData
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Treino_Female <- numberOfSamplesFemaleTrainingData
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Teste_20p <- nrow(testData)
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Teste_Male <- numberOfSamplesMaleTestData
dfResulteHitsAndMissesTechnicalPrediction$Amostras_Teste_Female <- numberOfSamplesFemaleTestData


# Ordenando o resultado
dfResulteHitsAndMissesTechnicalPrediction <- dfResulteHitsAndMissesTechnicalPrediction[order(dfResulteHitsAndMissesTechnicalPrediction$Mean, decreasing=TRUE), ]

# removendo coluna "Mean" foi usada para ordenar os resultados da melhor tecnica
dfResulteHitsAndMissesTechnicalPrediction$Mean <- NULL

#Adicionando linha Na(Not Available) no dataframe
dfResulteHitsAndMissesTechnicalPrediction <- addNaLineAtTheEndOfTheDataframe(dfResulteHitsAndMissesTechnicalPrediction)

# # Definindo o caminho a ser salvo o arquivo resulteHitsAndMissesTechnicalPrediction.csv
filePathResulteHitsAndMissesTechnicalPrediction <- joinPathAndFilename(pathToSaveFile, "resulteHitsAndMissesTechnicalPrediction.csv")

# Salvando informacoes no arquivo .csv
createAndUpdateFileCsv(filePathResulteHitsAndMissesTechnicalPrediction, dfResulteHitsAndMissesTechnicalPrediction)

# Lendo arquivo resulteHitsAndMissesTechnicalPrediction.csv
dfResulteHitsAndMissesTechnicalPredictionView <- read.csv(filePathResulteHitsAndMissesTechnicalPrediction,header=TRUE,encoding="UTF-8")
view(dfResulteHitsAndMissesTechnicalPredictionView)

#----------------------------------

# criando arquivo accuracyHitsAndMissesPrediction.csv
#-------------------------------------------------

dfAccuracyHitsAndMissesTechnicalPrediction <- rbind(dfAccuracyHitsAndMissesPredictionRna, dfAccuracyHitsAndMissesPredictionSvm, dfAccuracyHitsAndMissesPredictionCart, dfAccuracyHitsAndMissesPredictionC5_0, dfAccuracyHitsAndMissesPredictionRandomForest, dfAccuracyHitsAndMissesPredictionKnn, dfAccuracyHitsAndMissesPredictionNaiveBayes)
View(dfAccuracyHitsAndMissesTechnicalPrediction)

# # Crinado nova colunas no dataframe
dfAccuracyHitsAndMissesTechnicalPrediction$semente <- seed
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras <- nrow(dfGenderVoice)
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Male <- numberOfMaleClassSamples
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Female <- numberOfFemaleClassSamples
dfAccuracyHitsAndMissesTechnicalPrediction$Metodo_divisao_Dados <- dataDivisionMethod
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Treino_80p <- nrow(trainingData)
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Treino_Male <- numberOfSamplesMaleTrainingData
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Treino_Female <- numberOfSamplesFemaleTrainingData
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Teste_20p <- nrow(testData)
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Teste_Male <- numberOfSamplesMaleTestData
dfAccuracyHitsAndMissesTechnicalPrediction$Amostras_Teste_Female <- numberOfSamplesFemaleTestData

# Ordenando o resultado
dfAccuracyHitsAndMissesTechnicalPrediction <- dfAccuracyHitsAndMissesTechnicalPrediction[order(dfAccuracyHitsAndMissesTechnicalPrediction$Test_data_accuracy, decreasing=TRUE), ]

# Adicionando linha Na(Not Available) no dataframe
dfAccuracyHitsAndMissesTechnicalPrediction <- addNaLineAtTheEndOfTheDataframe(dfAccuracyHitsAndMissesTechnicalPrediction)

# Definindo o caminho a ser salvo o arquivo accuracyHitsAndMissesTechnicalPrediction.csv
filePathAccuracyHitsAndMissesTechnicalPrediction <- joinPathAndFilename(pathToSaveFile, "accuracyHitsAndMissesTechnicalPrediction.csv")

# Salvando informacoes no arquivo .csv
createAndUpdateFileCsv(filePathAccuracyHitsAndMissesTechnicalPrediction, dfAccuracyHitsAndMissesTechnicalPrediction)

# Lendo accuracyHitsAndMissesTechnicalPrediction.csv
dfAccuracyHitsAndMissesTechnicalPredictionView <- read.csv(filePathAccuracyHitsAndMissesTechnicalPrediction,header=TRUE,encoding="UTF-8")
view(dfAccuracyHitsAndMissesTechnicalPredictionView)

#--------------------------------------------------

#str(predictionRna)
#str(testDataLabelColumn)

levels(predictionRna)
levels(testDataLabelColumn)

testDataLabelColumn <- factor(testDataLabelColumn)



# ********** Matriz de confusao - estatisticas dos resultados da predicao ********** #

confusionMatrixRna <- confusionMatrix(predictionRna, testDataLabelColumn)
confusionMatrixSvm <- confusionMatrix(predictionSvm, testDataLabelColumn)
confusionMatrixCart <- confusionMatrix(predictionCart, testDataLabelColumn)
confusionMatrixC5_0 <- confusionMatrix(predictionC5_0, testDataLabelColumn)
confusionMatrixRandomForest <- confusionMatrix(predictionRandomForest, testDataLabelColumn)
confusionMatrixKnn <- confusionMatrix(predictionKnn, testDataLabelColumn)
confusionMatrixNaiveBayes <- confusionMatrix(predictionNaiveBayes, testDataLabelColumn)


confusionMatrixRna
confusionMatrixSvm
confusionMatrixCart
confusionMatrixC5_0
confusionMatrixRandomForest
confusionMatrixKnn
confusionMatrixNaiveBayes

confusionMatrixRna$table
confusionMatrixRna$overall
confusionMatrixRna$overall[1]

# Informacoes de predicao dos dados de teste da matriz de confusao
# Pegando informacoes para confusionMatrixPredictionResult.csv
#--------------------------------------------------------------

dfConfusionMatrixRna <- data.frame(confusionMatrixRna$table)
View(dfConfusionMatrixRna)
dfConfusionMatrixRna$Technique <- bestRna
dfConfusionMatrixRna$Accuracy <- confusionMatrixRna$overall[1]

dfpredicaoSvm <- data.frame(confusionMatrixSvm$table)
dfpredicaoSvm$Technique <- bestSvm
dfpredicaoSvm$Accuracy <- confusionMatrixSvm$overall[1]

dfpredicaoRpart <- data.frame(confusionMatrixCart$table)
dfpredicaoRpart$Technique <- bestCart
dfpredicaoRpart$Accuracy <- confusionMatrixCart$overall[1]

dfpredicaoC50 <- data.frame(confusionMatrixC5_0$table)
dfpredicaoC50$Technique <- bestC5_0
dfpredicaoC50$Accuracy <- confusionMatrixC5_0$overall[1]

dfpredicaoRf <- data.frame(confusionMatrixRandomForest$table)
dfpredicaoRf$Technique <- bestRandomForest
dfpredicaoRf$Accuracy <- confusionMatrixRandomForest$overall[1]

dfpredicaoKnn <- data.frame(confusionMatrixKnn$table)
dfpredicaoKnn$Technique <- bestKnn
dfpredicaoKnn$Accuracy <- confusionMatrixKnn$overall[1]

dfpredicaonbayes <- data.frame(confusionMatrixNaiveBayes$table)
dfpredicaonbayes$Technique <- bestNaiveBayes
dfpredicaonbayes$Accuracy <- confusionMatrixNaiveBayes$overall[1]

dfpred <- rbind(dfConfusionMatrixRna, dfpredicaoSvm, dfpredicaoRpart, dfpredicaoC50, dfpredicaoRf, dfpredicaoKnn, dfpredicaonbayes)
View(dfpred)
# Crinado nova colunas no dataframe
dfpred$semente <- seed
dfpred$Amostras <- nrow(dfGenderVoice)
dfpred$Amostras_Male <- numberOfMaleClassSamples
dfpred$Amostras_Female <- numberOfFemaleClassSamples
dfpred$Metodo_divisao_Dados <- dataDivisionMethod
dfpred$Amostras_Treino_80p <- nrow(trainingData)
dfpred$Amostras_Treino_Male <- numberOfSamplesMaleTrainingData
dfpred$Amostras_Treino_Female <- numberOfSamplesFemaleTrainingData
dfpred$Amostras_Teste_20p <- nrow(testData)
dfpred$Amostras_Teste_Male <- numberOfSamplesMaleTestData
dfpred$Amostras_Teste_Female <- numberOfSamplesFemaleTestData

# Ordenar linhas com base na coluna Accuracy
dfpred <- dfpred[order(dfpred$Accuracy, decreasing=TRUE), ]

#Adicionando linha Na no dataframe
dfpred <- addNaLineAtTheEndOfTheDataframe(dfpred)

# Definindo o caminho a ser salvo o arquivo TechniquePredictionConfusionMatrix.csv
filePathTechniquePredictionConfusionMatrix <- joinPathAndFilename(pathToSaveFile, "techniquePredictionConfusionMatrix.csv")

# Salvando informacoes no arquivo .csv
createAndUpdateFileCsv(filePathTechniquePredictionConfusionMatrix, dfpred)

# Lendo accuracyHitsAndMissesTechnicalPrediction.csv
dfTechniquePredictionConfusionMatrixView <- read.csv(filePathTechniquePredictionConfusionMatrix,header=TRUE,encoding="UTF-8")
view(dfTechniquePredictionConfusionMatrixView)

#---------------------------------------------
confusionMatrixRna$overall
confusionMatrixRna$byClass

# Informacoes de estatistica(acuracia,...) dos dados de teste - matriz de confusao
# Pegando informacoes para resultadoMatrizConfusaoEstatist.csv
#-----------------------------------------------------------------
dfCfmRna <- data.frame(cbind(t(confusionMatrixRna$overall),t(confusionMatrixRna$byClass)))
dfCfmSvm <- data.frame(cbind(t(confusionMatrixSvm$overall),t(confusionMatrixSvm$byClass)))
dfCfmRpart <- data.frame(cbind(t(confusionMatrixCart$overall),t(confusionMatrixCart$byClass)))
dfCfmC50 <- data.frame(cbind(t(confusionMatrixC5_0$overall),t(confusionMatrixC5_0$byClass)))
dfCfmRf <- data.frame(cbind(t(confusionMatrixRandomForest$overall),t(confusionMatrixRandomForest$byClass)))
dfCfmKnn <- data.frame(cbind(t(confusionMatrixKnn$overall),t(confusionMatrixKnn$byClass)))
dfCfmNbayes <- data.frame(cbind(t(confusionMatrixNaiveBayes$overall),t(confusionMatrixNaiveBayes$byClass)))

dfCfmTecnicas <- rbind(dfCfmRna, dfCfmSvm, dfCfmRpart, dfCfmC50, dfCfmRf, dfCfmKnn, dfCfmNbayes)
View(dfCfmTecnicas)

# Criando coluna tecnicas
dfCfmTecnicas$Technique <- c(bestRna, bestSvm, bestCart, bestC5_0, bestRandomForest, bestKnn, bestNaiveBayes)

# Crinado nova colunas no dataframe
dfCfmTecnicas$semente <- seed
dfCfmTecnicas$Amostras <- nrow(dfGenderVoice)
dfCfmTecnicas$Amostras_Male <- numberOfMaleClassSamples
dfCfmTecnicas$Amostras_Female <- numberOfFemaleClassSamples
dfCfmTecnicas$Metodo_divisao_Dados <- dataDivisionMethod
dfCfmTecnicas$Amostras_Treino_80p <- nrow(trainingData)
dfCfmTecnicas$Amostras_Treino_Male <- numberOfSamplesMaleTrainingData
dfCfmTecnicas$Amostras_Treino_Female <- numberOfSamplesFemaleTrainingData
dfCfmTecnicas$Amostras_Teste_20p <- nrow(testData)
dfCfmTecnicas$Amostras_Teste_Male <- numberOfSamplesMaleTestData
dfCfmTecnicas$Amostras_Teste_Female <- numberOfSamplesFemaleTestData


#alterando ordem das colunas
dfCfmTecnicas <- dfCfmTecnicas %>% select(Technique, everything())

dfCfmTecnicas <- dfCfmTecnicas[order(dfCfmTecnicas$Accuracy, decreasing=TRUE), ]

#Adicionando linha Na no dataframe
dfCfmTecnicas <- addNaLineAtTheEndOfTheDataframe(dfCfmTecnicas)

# Definindo o caminho a ser salvo o arquivo accuracyAndOtherInformationTechniquePrediction.csv
filePathAccuracyAndOtherInformationTechniquePrediction <- joinPathAndFilename(pathToSaveFile, "accuracyAndOtherInformationTechniquePrediction.csv")

# Salvando informacoes no arquivo .csv
createAndUpdateFileCsv(filePathAccuracyAndOtherInformationTechniquePrediction, dfCfmTecnicas)

# Lendo accuracyHitsAndMissesTechnicalPrediction.csv
dfAccuracyAndOtherInformationTechniquePredictionView <- read.csv(filePathAccuracyAndOtherInformationTechniquePrediction,header=TRUE,encoding="UTF-8")
view(dfAccuracyAndOtherInformationTechniquePredictionView)



## ----verificar quais variaveis preditoras tiveram a maior importancia

# ggplot(varImp(model_rna1))
# ggplot(varImp(model_svm2))
# ggplot(varImp(model_cart1))
# ggplot(varImp(model_c50_1))
# ggplot(varImp(model_rf3))
# ggplot(varImp(model_knn2))
# ggplot(varImp(model_nbayes2))




