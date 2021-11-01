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

# Comentar linha no R -> coloque o cursosr na linha e aperte Ctrl + shift + C

# Comentar varias linhas no R -> selecione as linhas e aperte Ctrl + shift + C

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
install.packages("hms")


# ********** importing libraries ********** # 

library(corrplot)       # corrplot.mixed
library(tidyverse)      # theme_set(), ggplot()
library(caret)          # createDataPartition(), trainControl(), train()
library(dplyr)          # select()
library(hms)            # Formatar valores de hora do dia (00:00:00), com base na classe 'difftime'

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

addUnderLineAtTheEndOfTheDataframe <- function(dataFrame){
  
  # gerando uma linha com valores nulos
  rowUnderLine <- seq(1:ncol(dataFrame))
  rowUnderLine[1:ncol(dataFrame)] <- '-'
  
  # adicionando linha nula no final do dataframe
  dataFrame <- rbind(dataFrame, rowUnderLine) 
  
  return(dataFrame)
}

addUnderlineAndZeroToSeparateLinesInTheDataframe  <- function(dataFrameconfusionMatrix, lineNumber){
  dataFrameconfusionMatrix <- dataFrameconfusionMatrix %>% add_row(Technique= '-', 
                                     Prediction= '-', 
                                     Reference= '-',
                                     Freq= 0,
                                     value_counts= '-',
                                     Test_data_accuracy= 0,
                                     Training_data_accuracy= 0,
                                     Seed= 0,
                                     Samples= 0,
                                     Female_samples= 0,
                                     Male_samples= 0,
                                     Data_division_method= '-',
                                     Training_samples_80p= 0,
                                     Training_samples_Female= 0,
                                     Training_samples_Male= 0,
                                     Test_samples_20p= 0,
                                     Test_samples_Female= 0,
                                     Test_samples_Male= 0,
                                     Operational_System= '-',
                                     .before = lineNumber)
  
  return(dataFrameconfusionMatrix)
}


joinPathAndFilename  <- function(filePath, filename){

  return(str_c(filePath, filename))
}

runtime  <- function(endTime, startTime){
  
  runtimeFormated <- as_hms(endTime - startTime)
  
  runtimeFormatedAndRound <- round_hms(runtimeFormated, sec = 1)
  
  return(runtimeFormatedAndRound)
}

# ********** Dataset ********** #

# configuracao da analise 
#-----------------------------------------------------------------------------------------------
metric <- "Accuracy"
operationalSystem <- "unknown"
pathToSaveFile <- "unknown"

# retorna um caminho de arquivo absoluto que representa o diretório de trabalho atual do processo R
# No windows o caminho padrão é "C:/Users/name_User/Documents"
getwd()

# Verifica o sistema operacional que o R está instalado, para definir as variaveis pathToSaveFile e o sistema operacional
if(.Platform$OS.type == "windows"){
  
  # getwd() - "C:/Users/folder_user/Documents/"
  pathToSaveFile <- str_c(getwd(), "/machineLearningTechniquesForVoiceRecognitionByGender_R/trainingResults/")
  
  # definindo area de trabalho do R no Windows, onde será acessado o dataset para analise
  setwd(str_c(getwd(), "/machineLearningTechniquesForVoiceRecognitionByGender_R"))
 
  operationalSystem <- "windows"
  
# senao (se for "unix")
}else{
  
  # getwd() - "/home/folder_user"
  pathToSaveFile <- str_c(getwd(), "/machineLearningTechniquesForVoiceRecognitionByGender_R/trainingResults/")
  
  # definindo area de trabalho do R no Ubuntu, onde será acessado o dataset para analise
  setwd(str_c(getwd(), "/machineLearningTechniquesForVoiceRecognitionByGender_R"))

  operationalSystem <- "unix"
  
}


# Verifica caminho atual da area de trabalho do R para ler aquivo dataset, confirmar se o caminho foi alterado com o comando setwd()
getwd()


# Nome do dataset
nameDatasetCsv <- "gender_voice_dataset.csv"


# aqui colocar o numero de amostra para se pegar das amostras de Male e Female
# O numero total de amostras  e o dobro de numberOfLines
# numberOfLines <- 'all'


# c(seed, numberOfLines, dataDivisionMethod)

# Definindo configuração para o treinamento
analysis1<-c(123, "all", "createDP")
analysis2<-c(1234, "all", "createDP")
analysis3<-c(123, "all", "sample-prob")
analysis4<-c(1234, "all", "sample-prob")


# analysis1<-c(123, 2000, "createDP")
# analysis2<-c(123, 1000, "createDP")
# analysis3<-c(123, 500, "createDP")

# Juntando configurações escohidas em uma lista
# analysisList<-list(analysis1)
# analysisList<-list(analysis1, analysis2)
# analysisList<-list(analysis1, analysis2, analysis3)
analysisList<-list(analysis1, analysis2, analysis3, analysis4)


# Importando base de dados
# Se for mudar o numero de amostras do dataset para um valor especifico, usar o trecho de código abaixo
#-----------------------------------------------------------------------------------------------


if (file.exists(nameDatasetCsv)){

  for(i in 1:length(analysisList)) {
 
    seed <- as.numeric(analysisList[[i]][1])
    numberOfLines <- analysisList[[i]][2]
    dataDivisionMethod <- analysisList[[i]][3]
    
    set.seed(seed)
    
    if (numberOfLines == 'all'){
      dfGenderVoice <- read.csv(nameDatasetCsv,header=TRUE,encoding="UTF-8")
    } else {
      dfGenderVoiceTemp <- read.csv(nameDatasetCsv,header=TRUE,encoding="UTF-8")
      
      halfTheNumberOfLines <- as.numeric(numberOfLines)/2
      
      valueOfHalfTheNumberOfSamplesOfDf <- nrow(dfGenderVoiceTemp)/2
  
      femaleVoiceLines <- sample(1:valueOfHalfTheNumberOfSamplesOfDf, halfTheNumberOfLines)
      
      maleVoiceLines <- sample((valueOfHalfTheNumberOfSamplesOfDf + 1):(nrow(dfGenderVoiceTemp)), halfTheNumberOfLines)
      
      #pegas as amostras de linhas em maleVoiceLines e femaleVoiceLines e junta tudo em um unico vetor
      dfLines <- c(maleVoiceLines,femaleVoiceLines)
      
      #Seleciona as linhas especificadas em dfLines e pegas todas as colunas
      dfGenderVoice <- dfGenderVoiceTemp[dfLines,]
    }

    #-----------------------------------------------------------------------------------------------
    
    # Visualisar dataset
    #View(dfGenderVoice)
    
    # Pegando a coluna label, coluna das classes Male e Female
    dfClass <- dfGenderVoice[ncol(dfGenderVoice)]
    
    # Visualisar dfClass - coluna label
    #View(dfClass)
    
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
    
    
    # fucao para adicionar colunas com os prametros da analise
    addTrainingParameterColumns  <- function(dataFrame, 
                             seed, 
                             dfGenderVoice, 
                             numberOfFemaleClassSamples, 
                             numberOfMaleClassSamples, 
                             dataDivisionMethod, 
                             trainingData, 
                             numberOfSamplesFemaleTrainingData, 
                             numberOfSamplesMaleTrainingData, 
                             testData, 
                             numberOfSamplesFemaleTestData, 
                             numberOfSamplesMaleTestData, 
                             operationalSystem){
      
      dataFrame$Seed <- seed
      dataFrame$Samples <- nrow(dfGenderVoice)
      dataFrame$Female_samples <- numberOfFemaleClassSamples
      dataFrame$Male_samples <- numberOfMaleClassSamples
      dataFrame$Data_division_method <- dataDivisionMethod
      dataFrame$Training_samples_80p <- nrow(trainingData)
      dataFrame$Training_samples_Female <- numberOfSamplesFemaleTrainingData
      dataFrame$Training_samples_Male <- numberOfSamplesMaleTrainingData
      dataFrame$Test_samples_20p <- nrow(testData)
      dataFrame$Test_samples_Female <- numberOfSamplesFemaleTestData
      dataFrame$Test_samples_Male <- numberOfSamplesMaleTestData
      dataFrame$Operational_System <- operationalSystem
      
      # Mudando o nome das linhas do data frame, tira o nome das tecnicas e coloca o numero da linha
      rownames(dataFrame) <- 1:nrow(dataFrame)
      
      #alterando ordem das colunas do dataframe, a coluna "tecnica" e colocada como primeira coluna
      dataFrame <- dataFrame %>% select(Technique, everything())
      
      # chamando funcao para adicionar uma linha Na(Not Available) no dataframe
      dataFrame <- addNaLineAtTheEndOfTheDataframe(dataFrame)
      
      return(dataFrame)
    }
    
    # Funcao para adicionar colunas com parametros da analise de matriz de confusao
    dfConfusionMatrixPredictionTechniqueWithParameterColumns <- function(confusionMatrixPredictionTechniqueWithTable, 
                                                              bestTechnique, 
                                                              dfTechniqueAccuracyOfTrainingData){
      
      dataFrame <- data.frame(confusionMatrixPredictionTechniqueWithTable)
      dataFrame$value_counts <- rbind("True Negative", "False Negative", "False Positive", "True Positive") 
      dataFrame$Technique <-  bestTechnique
      dataFrame$Training_data_accuracy <- dfTechniqueAccuracyOfTrainingData$Mean_Accuracy[1]
      
      #alterando ordem das colunas do dataframe, a coluna "Technique" e colocada como primeira coluna
      dataFrame <- dataFrame %>% select(Technique, everything())
      
      # chamando funcao para adicionar uma linha Na(Not Available) no dataframe
      #dataFrame <- addNaLineAtTheEndOfTheDataframe(dataFrame)
      
      return(dataFrame)
    }
    
    # Funcao para adicionar colunas com parametros da analise de matriz de confusao
    dfConfusionMatrixPredictionTechniqueWithParameterColumns2 <- function(confusionMatrixPredictionTechnique, 
                                                                         bestTechnique,
                                                                         dfTechniqueAccuracyOfTrainingData){
      
      dataFrame <- data.frame(confusionMatrixPredictionTechnique$table)
      dataFrame$value_counts <- rbind("True Negative", "False Negative", "False Positive", "True Positive") 
      dataFrame$Technique <-  bestTechnique
      dataFrame$Test_data_accuracy <- confusionMatrixPredictionTechnique$overall[1]
      dataFrame$Training_data_accuracy <- dfTechniqueAccuracyOfTrainingData$Mean_Accuracy[1]
      
      #alterando ordem das colunas do dataframe, a coluna "Technique" e colocada como primeira coluna
      dataFrame <- dataFrame %>% select(Technique, everything())
      
      # chamando funcao para adicionar uma linha Na(Not Available) no dataframe
      #dataFrame <- addNaLineAtTheEndOfTheDataframe(dataFrame)
      
      return(dataFrame)
    }
    
    # Funcao para adicionar colunas com parametros da analise de acuracia e taxa de erro da matriz de confusao
    dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns <- function(dfaccuracyAndErrorRatePredictionTechniqueTemp, 
                                                                               dfTechniqueAccuracyOfTrainingData, 
                                                                               bestTechnique){
    
      
      dataFrame <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionTechniqueTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionTechniqueTemp$Freq[2])
      dataFrame$Training_data_accuracy <- dfTechniqueAccuracyOfTrainingData$Mean_Accuracy[1]
      dataFrame$Technique <- bestTechnique
      dataFrame$Runtime_Training <- dfTechniqueAccuracyOfTrainingData$Runtime_Training[1]
      
      #alterando ordem das colunas do dataframe, a coluna "Technique" e colocada como primeira coluna
      dataFrame <- dataFrame %>% select(Technique, everything())
      
      return(dataFrame)
    }
    
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
    
    if (dataDivisionMethod == "createDP"){
      # Modo 1
      #-----------------------------------------------------------------------------------------------
      # Gerando valores de indices com 80% das amostras do dataset, os valores são aleatorios
      trainingDataIndex  <- createDataPartition(dfGenderVoice$label, p=0.8, list=FALSE)
      
      # Dividindo dados para treino e para teste
      
      # pega todas as linhas que está definida em "trainingDataIndex", as amostras serão selecionas pelos indices passados
      trainingData <- dfGenderVoice[ trainingDataIndex, ]
      
      
      # pega todas as linhas que não está definida em "trainingDataIndex", o sinal de - (menos) diz pra não pegar essas linhas
      testData  <- dfGenderVoice[-trainingDataIndex, ]
    } else {
      # Modo 2 - dataDivisionMethod <- "sample-prob"
      #-----------------------------------------------------------------------------------------------
      grupos <- sample(2, nrow(dfGenderVoice), replace=TRUE, prob=c(0.8, 0.2))
    
      ## Dividindo dados para treino e para teste
      trainingData <- dfGenderVoice[grupos==1,]
      testData <- dfGenderVoice[grupos==2,]
    
    }
    
    
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
    # view(trainingData)
    # view(testData)
    
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
    startTimeRna1 <- Sys.time()
    modelRna1 <- train(label ~ ., data=trainingData, method="nnet", trControl=fitControl, metric=metric, preProcess=c("center","scale"))
    endTimeRna1 <- Sys.time()
    
    runtimeTrainingModelRna1 <- runtime(endTimeRna1, startTimeRna1)
    runtimeTrainingModelRna1
    
    startTimeRna2 <- Sys.time()
    modelRna2 <- train(label ~ ., data=trainingData, method="mlp", trControl=fitControl, metric=metric,  preProcess=c("center","scale"))
    endTimeRna2 <- Sys.time()
    
    runtimeTrainingModelRna2 <- runtime(endTimeRna2, startTimeRna2)
    runtimeTrainingModelRna2
    
    startTimeRna3 <- Sys.time()
    modelRna3 <- train(label ~ ., data=trainingData, method="mlpML", trControl=fitControl, metric=metric, preProcess=c("center","scale"))
    endTimeRna3 <- Sys.time()
    
    runtimeTrainingModelRna3 <- runtime(endTimeRna3, startTimeRna3)
    runtimeTrainingModelRna3
    
    #-------------------- SVM --------------------#
    startTimeSvm1 <- Sys.time()
    modelSvm1 <- train(label ~ ., data=trainingData, method="svmRadial", trControl=fitControl, metric=metric, preProc=c("center", "scale"),  fit=FALSE)
    endTimeSvm1 <- Sys.time()
    
    runtimeTrainingModelSvm1 <- runtime(endTimeSvm1, startTimeSvm1)
    runtimeTrainingModelSvm1
    
    startTimeSvm2 <- Sys.time()
    modelSvm2 <- train(label ~ ., data=trainingData, method="svmRadialWeights", trControl=fitControl, metric=metric, preProc=c("center", "scale"),  fit=FALSE)
    endTimeSvm2 <- Sys.time()
    
    runtimeTrainingModelSvm2 <- runtime(endTimeSvm2, startTimeSvm2)
    runtimeTrainingModelSvm2
    
    startTimeSvm3 <- Sys.time()
    modelSvm3 <- train(label ~ ., data=trainingData, method="svmPoly", trControl=fitControl, metric=metric, preProc=c("center", "scale"),  fit=FALSE)
    endTimeSvm3 <- Sys.time()
    
    runtimeTrainingModelSvm3 <- runtime(endTimeSvm3, startTimeSvm3)
    runtimeTrainingModelSvm3
    
    #-------------------- RPART - Recursive Partitioning And Regression Trees --------------------#
    startTimeCart1 <- Sys.time()
    modelCart1 <- train(label ~ ., data=trainingData, method="rpart", trControl=fitControl, metric=metric)
    endTimeCart1 <- Sys.time()
    
    runtimeTrainingModelCart1 <- runtime(endTimeCart1, startTimeCart1)
    runtimeTrainingModelCart1
    
    startTimeCart2 <- Sys.time()
    modelCart2 <- train(label ~ ., data=trainingData, method="rpart1SE", trControl=fitControl, metric=metric)
    endTimeCart2 <- Sys.time()
    
    runtimeTrainingModelCart2 <- runtime(endTimeCart2, startTimeCart2)
    runtimeTrainingModelCart2
    
    startTimeCart3 <- Sys.time()
    modelCart3 <- train(label ~ ., data=trainingData, method="rpart2", trControl=fitControl, metric=metric)
    endTimeCart3 <- Sys.time()
    
    runtimeTrainingModelCart3 <- runtime(endTimeCart3, startTimeCart3)
    runtimeTrainingModelCart3
    
    #-------------------- Decision Trees --------------------#
    startTimeDecisionTrees1 <- Sys.time()
    modelDecisionTrees1 <- train(label ~ ., data=trainingData, method="C5.0", trControl=fitControl, metric=metric)
    endTimeDecisionTrees1 <- Sys.time()
    
    runtimeTrainingModelDecisionTrees1 <- runtime(endTimeDecisionTrees1, startTimeDecisionTrees1)
    runtimeTrainingModelDecisionTrees1
    
    startTimeDecisionTrees2 <- Sys.time()
    modelDecisionTrees2<- train(label ~ ., data=trainingData, method="C5.0Rules", trControl=fitControl, metric=metric)
    endTimeDecisionTrees2 <- Sys.time()
    
    runtimeTrainingModelDecisionTrees2 <- runtime(endTimeDecisionTrees2, startTimeDecisionTrees2)
    runtimeTrainingModelDecisionTrees2
    
    startTimeDecisionTrees3 <- Sys.time()
    modelDecisionTrees3 <- train(label ~ ., data=trainingData, method="C5.0Tree", trControl=fitControl, metric=metric)
    endTimeDecisionTrees3 <- Sys.time()
    
    runtimeTrainingModelDecisionTrees3 <- runtime(endTimeDecisionTrees3, startTimeDecisionTrees3)
    runtimeTrainingModelDecisionTrees3
    
    #-------------------- RANDOM FOREST --------------------#
    startTimeRandomForest1 <- Sys.time()
    modelRandomForest1 <- train(label ~ ., data=trainingData, method="rf", trControl=fitControl, metric=metric)
    endTimeRandomForest1 <- Sys.time()
    
    runtimeTrainingModelRandomForest1 <- runtime(endTimeRandomForest1, startTimeRandomForest1)
    runtimeTrainingModelRandomForest1
    
    startTimeRandomForest2 <- Sys.time()
    modelRandomForest2 <- train(label ~ ., data=trainingData, method="cforest", trControl=fitControl, metric=metric)
    endTimeRandomForest2 <- Sys.time()
    
    runtimeTrainingModelRandomForest2 <- runtime(endTimeRandomForest2, startTimeRandomForest2)
    runtimeTrainingModelRandomForest2
    
    startTimeRandomForest3 <- Sys.time()
    modelRandomForest3 <- train(label ~ ., data=trainingData, method="parRF", trControl=fitControl, metric=metric)
    endTimeRandomForest3 <- Sys.time()
    
    runtimeTrainingModelRandomForest3 <- runtime(endTimeRandomForest3, startTimeRandomForest3)
    runtimeTrainingModelRandomForest3
    
    #-------------------- KNN --------------------#
    startTimeKnn1 <- Sys.time()
    modelKnn1 <- train(label ~ ., data=trainingData, method="knn", trControl=fitControl, metric=metric, preProc=c("center", "scale"))
    endTimeKnn1 <- Sys.time()
    
    runtimeTrainingModelKnn1 <- runtime(endTimeKnn1, startTimeKnn1)
    runtimeTrainingModelKnn1
    
    startTimeKnn2 <- Sys.time()
    modelKnn2 <- train(label ~ ., data=trainingData, method="kknn", trControl=fitControl, metric=metric, preProc=c("center", "scale"))
    endTimeKnn2 <- Sys.time()
    
    runtimeTrainingModelKnn2 <- runtime(endTimeKnn2, startTimeKnn2)
    runtimeTrainingModelKnn2
    
    #-------------------- NAIVE BAYES --------------------#
    startTimeNaiveBayes1 <- Sys.time()
    modelNaiveBayes1 <- train(label ~ ., data=trainingData, method="nb", trControl=fitControl, metric=metric, preProcess=c("center","scale"))
    endTimeNaiveBayes1 <- Sys.time()
    
    runtimeTrainingModelNaiveBayes1 <- runtime(endTimeNaiveBayes1, startTimeNaiveBayes1)
    runtimeTrainingModelNaiveBayes1
    
    startTimeNaiveBayes2 <- Sys.time()
    modelNaiveBayes2 <- train(label ~ ., data=trainingData, method="naive_bayes", trControl=fitControl, metric=metric, preProcess=c("center","scale"))
    endTimeNaiveBayes2 <- Sys.time()
    
    runtimeTrainingModelNaiveBayes2 <- runtime(endTimeNaiveBayes2, startTimeNaiveBayes2)
    runtimeTrainingModelNaiveBayes2
    
    # Resultados dos treinos 
    results <- resamples(list("RNA 1 (nnet)"=modelRna1, "RNA 2 (mlp)"=modelRna2, "RNA 3 (mlpML)"=modelRna3, 
                              "SVM 1 (svmRadial)"=modelSvm1,"SVM 2 (svmRadialWeights)"=modelSvm2, "SVM 3 (svmPoly)"= modelSvm3,
                              "CART 1 (rpart)"=modelCart1, "CART 2 (rpart1SE)"=modelCart2, "CART 3 (rpart2)"=modelCart3, 
                              "Decision Trees 1 (C5.0)"=modelDecisionTrees1, "Decision Trees 2 (C5.0Rules)"=modelDecisionTrees2, "Decision Trees 3 (C5.0Tree)"=modelDecisionTrees3,
                              "Random Forest 1 (rf)"=modelRandomForest1,"Random Forest 2 (cforest)"=modelRandomForest2, "Random Forest 3 (parRF)"=modelRandomForest3,
                              "k-NN 1 (knn)"=modelKnn1, "k-NN 2 (kknn)"=modelKnn2, 
                              "Naive Bayes 1 (nb)"=modelNaiveBayes1, "Naive Bayes 2 (naive_bayes)"=modelNaiveBayes2
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
    # View(dfAccuracyOfTrainingDataTechniques)
    
    # Alterando nome das colunas "Min.", "x1st.Qu.", "Median", "Mean", "3rd.Qu." e "Max." para "Min. Accuracy", "1st.Qu. Accuracy", "Median Accuracy", "Mean Accuracy", "3rd.Qu. Accuracy", "Max. Accuracy"
    colnames(dfAccuracyOfTrainingDataTechniques)[1:6] <- c("Min_Accuracy", "1st.Qu_Accuracy", "Median_Accuracy", "Mean_Accuracy", "3rd.Qu_Accuracy", "Max_Accuracy")
    
    # Adicionando colunas com o nome das técnicas
    dfAccuracyOfTrainingDataTechniques$Technique <- rownames(dfAccuracyOfTrainingDataTechniques)
    
    # Adicioando coluna com o tempo de execução do treinamento das técnicas
    dfAccuracyOfTrainingDataTechniques$Runtime_Training <- rbind(as.character(runtimeTrainingModelRna1), as.character(runtimeTrainingModelRna2), 
                                                                 as.character(runtimeTrainingModelRna3), as.character(runtimeTrainingModelSvm1), 
                                                                 as.character(runtimeTrainingModelSvm2), as.character(runtimeTrainingModelSvm3), 
                                                                 as.character(runtimeTrainingModelCart1), as.character(runtimeTrainingModelCart2),
                                                                 as.character(runtimeTrainingModelCart3), as.character(runtimeTrainingModelDecisionTrees1), 
                                                                 as.character(runtimeTrainingModelDecisionTrees2), as.character(runtimeTrainingModelDecisionTrees3), 
                                                                 as.character(runtimeTrainingModelRandomForest1), as.character(runtimeTrainingModelRandomForest2),
                                                                 as.character(runtimeTrainingModelRandomForest3), as.character(runtimeTrainingModelKnn1), 
                                                                 as.character(runtimeTrainingModelKnn2), as.character(runtimeTrainingModelNaiveBayes1), 
                                                                 as.character(runtimeTrainingModelNaiveBayes2))
    
    # Adicionando colunas com os prametros usados para o treinamento
    dfAccuracyOfTrainingDataTechniques <- addTrainingParameterColumns(dfAccuracyOfTrainingDataTechniques, 
                                                                      seed, 
                                                                      dfGenderVoice, 
                                                                      numberOfFemaleClassSamples, 
                                                                      numberOfMaleClassSamples, 
                                                                      dataDivisionMethod, 
                                                                      trainingData, 
                                                                      numberOfSamplesFemaleTrainingData, 
                                                                      numberOfSamplesMaleTrainingData, 
                                                                      testData, 
                                                                      numberOfSamplesFemaleTestData, 
                                                                      numberOfSamplesMaleTestData, 
                                                                      operationalSystem)
    
    #dfAccuracyOfTrainingDataTechniques$Seed <- seed
    #dfAccuracyOfTrainingDataTechniques$Samples <- nrow(dfGenderVoice)
    #dfAccuracyOfTrainingDataTechniques$Female_samples <- numberOfFemaleClassSamples
    #dfAccuracyOfTrainingDataTechniques$Male_samples <- numberOfMaleClassSamples
    #dfAccuracyOfTrainingDataTechniques$Data_division_method <- dataDivisionMethod
    #dfAccuracyOfTrainingDataTechniques$Training_samples_80p <- nrow(trainingData)
    #dfAccuracyOfTrainingDataTechniques$Training_samples_Female <- numberOfSamplesFemaleTrainingData
    #dfAccuracyOfTrainingDataTechniques$Training_samples_Male <- numberOfSamplesMaleTrainingData
    #dfAccuracyOfTrainingDataTechniques$Test_samples_20p <- nrow(testData)
    #dfAccuracyOfTrainingDataTechniques$Test_samples_Female <- numberOfSamplesFemaleTestData
    #dfAccuracyOfTrainingDataTechniques$Test_samples_Male <- numberOfSamplesMaleTestData
    #dfAccuracyOfTrainingDataTechniques$Operational_System <- operationalSystem
    
    # Mudando o nome das linhas do data frame, tira o nome das tecnicas e coloca o numero da linha
    #rownames(dfAccuracyOfTrainingDataTechniques) <- 1:nrow(dfAccuracyOfTrainingDataTechniques)
    
    #alterando ordem das colunas do dataframe, a coluna "tecnica" e colocada como primeira coluna
    #dfAccuracyOfTrainingDataTechniques <- dfAccuracyOfTrainingDataTechniques %>% select(Technique, everything())
    
    # chamando funcao para adicionar uma linha Na(Not Available) no dataframe
    #dfAccuracyOfTrainingDataTechniques <- addNaLineAtTheEndOfTheDataframe(dfAccuracyOfTrainingDataTechniques)
    
    # Definindo caminho do arquivo AccuracyOfTrainingDataTechniques.csv
    filePathAccuracyOfTrainingDataTechniques <- joinPathAndFilename(pathToSaveFile, "accuracyOfTrainingDataTechniques.csv")
    
    #Salvando informacoes do dataframe no arquivo .csv
    createAndUpdateFileCsv(filePathAccuracyOfTrainingDataTechniques, dfAccuracyOfTrainingDataTechniques)
    
    # Ler arquivo AccuracyOfTrainingDataTechniques.csv
    dfAccuracyOfTrainingDataTechniquesView <- read.csv(filePathAccuracyOfTrainingDataTechniques,header=TRUE,encoding="UTF-8")
    
    # visualisa arquivo AccuracyOfTrainingDataTechniques.csv
    view(dfAccuracyOfTrainingDataTechniquesView)
    
    #--------------------------------------------
    
    # Analisando qual foram as melhores técnicas #
    # -----------------------------------------------------
    
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
    
    dfDecisionTreesAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^Decision"))
    dfDecisionTreesAccuracyOfTrainingData <- dfDecisionTreesAccuracyOfTrainingData[order(dfDecisionTreesAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
    #view(dfDecisionTreesAccuracyOfTrainingData)
    
    dfRandomForestAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^Random"))
    dfRandomForestAccuracyOfTrainingData <- dfRandomForestAccuracyOfTrainingData[order(dfRandomForestAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
    
    dfKnnAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^k-NN"))
    dfKnnAccuracyOfTrainingData <- dfKnnAccuracyOfTrainingData[order(dfKnnAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
    # view(dfKnnAccuracyOfTrainingData)
    
    dfNaiveBayesAccuracyOfTrainingData <- dfAccuracyOfTrainingDataTechniquesNew %>% filter(str_detect(Technique, "^Naive"))
    dfNaiveBayesAccuracyOfTrainingData <- dfNaiveBayesAccuracyOfTrainingData[order(dfNaiveBayesAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
    # view(dfNaiveBayesAccuracyOfTrainingData)
    
    # Pegando a melhor tecnica de cada tecnica analisada e juntando em um dataframe
    dfBestTechniqueAccuracyOfTrainingData <- rbind(dfRnaAccuracyOfTrainingData[1,], dfSvmAccuracyOfTrainingData[1,], dfCartAccuracyOfTrainingData[1,], dfDecisionTreesAccuracyOfTrainingData[1,], dfRandomForestAccuracyOfTrainingData[1,], dfKnnAccuracyOfTrainingData[1,], dfNaiveBayesAccuracyOfTrainingData[1,])
    
    # Ordenando o resultado
    dfBestTechniqueAccuracyOfTrainingData <- dfBestTechniqueAccuracyOfTrainingData[order(dfBestTechniqueAccuracyOfTrainingData$Mean, decreasing=TRUE), ]
    
    #Adicionando linha Na(Not Available) no dataframe
    dfBestTechniqueAccuracyOfTrainingData <- addNaLineAtTheEndOfTheDataframe(dfBestTechniqueAccuracyOfTrainingData)
    
    # View(dfBestTechniqueAccuracyOfTrainingData)
    
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
    
    if (bestTechniqueRna[1] == "RNA 1 (nnet)") {
      
      bestRna <- "RNA 1 (nnet)"
      modelRna1
      modelRna1$results
      
      # Realizando a predicao com os dados de teste sem a coluna label
      predictionRna <- predict(modelRna1, testDataWithoutLabelColumn)
    
      # Comparando os resultados da predicao com os resultados da coluna label dos dados de teste
      confusionMatrixPredictionRnaWithTable <- table(Predictions = predictionRna, Reference = testDataLabelColumn)
      confusionMatrixPredictionRnaWithTable
      
    
      # Pegando a probabilidade do numero de acertos(acuracia) e erros da predicao
      accuracyAndErrorRatePredictionRna <- prop.table(table(predictionRna == testDataLabelColumn))
      accuracyAndErrorRatePredictionRna
    
      
    } else if (bestTechniqueRna[1] == "RNA 2 (mlp)") {
      
      bestRna <- "RNA 2 (mlp)"
      modelRna2
      modelRna2$results
      
      predictionRna <- predict(modelRna2, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionRnaWithTable <- table(Predictions = predictionRna, Reference = testDataLabelColumn)
      confusionMatrixPredictionRnaWithTable
      
      accuracyAndErrorRatePredictionRna <- prop.table(table(predictionRna == testDataLabelColumn))
      accuracyAndErrorRatePredictionRna
      
    } else {
      
      bestRna <- "RNA 3 (mlpML)"
      modelRna3
      modelRna3$results
      
      predictionRna <- predict(modelRna3, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionRnaWithTable <- table(Predictions = predictionRna, Reference = testDataLabelColumn)
      confusionMatrixPredictionRnaWithTable
      
      accuracyAndErrorRatePredictionRna <- prop.table(table(predictionRna == testDataLabelColumn))
      accuracyAndErrorRatePredictionRna
      
    }
    
    # preparando os dados de "confusionMatrixPredictionRnaWithTable" para o arquivo .csv
    #--------------------------------
    dfconfusionMatrixPredictionRnaWithTable <- dfConfusionMatrixPredictionTechniqueWithParameterColumns(confusionMatrixPredictionRnaWithTable,
                                                                                                        bestRna,
                                                                                                        dfRnaAccuracyOfTrainingData)
    
    #dfconfusionMatrixPredictionRnaWithTable <- data.frame(confusionMatrixPredictionRnaWithTable)
    #dfconfusionMatrixPredictionRnaWithTable$value_counts <- rbind("True Negative", "False Positive", "False Negative", "True Positive")
    #dfconfusionMatrixPredictionRnaWithTable$Technique <-  bestRna
    #dfconfusionMatrixPredictionRnaWithTable$Mean_Accuracy <- dfRnaAccuracyOfTrainingData$Mean_Accuracy[1]
    #--------------------------------
    # View(dfconfusionMatrixPredictionRnaWithTable)
    # preparando os dados de "accuracyAndErrorRatePredictionRna" para o arquivo .csv
    #------------------------------------------------
    dfaccuracyAndErrorRatePredictionRnaTemp <- data.frame(accuracyAndErrorRatePredictionRna)
    
    dfaccuracyAndErrorRatePredictionRna <- dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns(dfaccuracyAndErrorRatePredictionRnaTemp,
                                                                                                         dfRnaAccuracyOfTrainingData,
                                                                                                         bestRna)
    
    
    #dfaccuracyAndErrorRatePredictionRna <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionRnaTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionRnaTemp$Freq[2])
    #dfaccuracyAndErrorRatePredictionRna$Training_data_accuracy <- dfRnaAccuracyOfTrainingData$Mean[1]
    #dfaccuracyAndErrorRatePredictionRna$Technique <- bestRna
    #-----------------------------------------------------
    # View(dfaccuracyAndErrorRatePredictionRna)
    
    
    #-------------------- SVM --------------------#
    
    bestTechniqueSvm <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^SVM"))
    
    if (bestTechniqueSvm[1] == "SVM 1 (svmRadial)") {
      
      bestSvm <- "SVM 1 (svmRadial)"
      modelSvm1
      modelSvm1$results
      
      predictionSvm <- predict(modelSvm1, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionSvmWithTable <- table(Predictions = predictionSvm, Reference = testDataLabelColumn)
      confusionMatrixPredictionSvmWithTable
      
      accuracyAndErrorRatePredictionSvm <- prop.table(table(predictionSvm == testDataLabelColumn))
      accuracyAndErrorRatePredictionSvm
      
      
    } else if (bestTechniqueSvm[1] == "SVM 2 (svmRadialWeights)") {
      
      bestSvm <- "SVM 2 (svmRadialWeights)"
      modelSvm2
      modelSvm2$results
      
      predictionSvm <- predict(modelSvm2, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionSvmWithTable <- table(Predictions = predictionSvm, Reference = testDataLabelColumn)
      confusionMatrixPredictionSvmWithTable
      
      accuracyAndErrorRatePredictionSvm <- prop.table(table(predictionSvm == testDataLabelColumn))
      accuracyAndErrorRatePredictionSvm
      
    } else {
      
      bestSvm <- "SVM 3 (svmPoly)"
      modelSvm3
      modelSvm3$results
      
      predictionSvm <- predict(modelSvm3, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionSvmWithTable <- table(Predictions = predictionSvm, Reference = testDataLabelColumn)
      confusionMatrixPredictionSvmWithTable
      
      accuracyAndErrorRatePredictionSvm <- prop.table(table(predictionSvm == testDataLabelColumn))
      accuracyAndErrorRatePredictionSvm
      
    }
    
    # # preparando os dados de "confusionMatrixPredictionSvmWithTable" para o arquivo .csv
    #--------------------------------
    dfconfusionMatrixPredictionSvmWithTable <- dfConfusionMatrixPredictionTechniqueWithParameterColumns(confusionMatrixPredictionSvmWithTable,
                                                                                                        bestSvm,
                                                                                                        dfSvmAccuracyOfTrainingData)
    
    
    #dfconfusionMatrixPredictionSvmWithTable <- data.frame(confusionMatrixPredictionSvmWithTable)
    #dfconfusionMatrixPredictionSvmWithTable$value_counts <- rbind("True Negative", "False Positive", "False Negative", "True Positive")
    #dfconfusionMatrixPredictionSvmWithTable$Technique <- bestSvm
    #dfconfusionMatrixPredictionSvmWithTable$Mean <- dfSvmAccuracyOfTrainingData$Mean[1]
    #--------------------------------
    # View(dfconfusionMatrixPredictionSvmWithTable)
    # # preparando os dados de "accuracyAndErrorRatePredictionSvm" para o arquivo .csv
    #------------------------------------------------
    dfaccuracyAndErrorRatePredictionSvmTemp <- data.frame(accuracyAndErrorRatePredictionSvm)
    
    dfaccuracyAndErrorRatePredictionSvm <- dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns(dfaccuracyAndErrorRatePredictionSvmTemp,
                                                                                                         dfSvmAccuracyOfTrainingData,
                                                                                                         bestSvm)
    
    #dfaccuracyAndErrorRatePredictionSvm <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionSvmTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionSvmTemp$Freq[2])
    #dfaccuracyAndErrorRatePredictionSvm$Training_data_accuracy <- dfSvmAccuracyOfTrainingData$Mean[1]
    #dfaccuracyAndErrorRatePredictionSvm$Technique <- bestSvm
    #-----------------------------------------------------
    # View(dfaccuracyAndErrorRatePredictionSvm)
    
    
    #-------------------- RPART - Recursive Partitioning And Regression Trees--------------------#
    
    bestTechniqueCart <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^CART"))
    
    if (bestTechniqueCart[1] == "CART 1 (rpart)") {
      
      bestCart <- "CART 1 (rpart)"
      modelCart1
      modelCart1$results
      
      predictionCart <- predict(modelCart1, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionCartWithTable <- table(Predictions = predictionCart, Reference = testDataLabelColumn)
      confusionMatrixPredictionCartWithTable
      
      accuracyAndErrorRatePredictionCart <- prop.table(table(predictionCart == testDataLabelColumn))
      accuracyAndErrorRatePredictionCart
      
      
    } else if (bestTechniqueCart[1] == "CART 2 (rpart1SE)") {
      
      bestCart <- "CART 2 (rpart1SE)"
      modelCart2
      modelCart2$results
      
      predictionCart <- predict(modelCart2, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionCartWithTable <- table(Predictions = predictionCart, Reference = testDataLabelColumn)
      confusionMatrixPredictionCartWithTable
      
      accuracyAndErrorRatePredictionCart <- prop.table(table(predictionCart == testDataLabelColumn))
      accuracyAndErrorRatePredictionCart
      
    } else {
      
      bestCart <- "CART 3 (rpart2)"
      modelCart3
      modelCart3$results
      
      predictionCart <- predict(modelCart3, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionCartWithTable <- table(Predictions = predictionCart, Reference = testDataLabelColumn)
      confusionMatrixPredictionCartWithTable
      
      accuracyAndErrorRatePredictionCart <- prop.table(table(predictionCart == testDataLabelColumn))
      accuracyAndErrorRatePredictionCart
      
    }
    
    # preparando dados de predicao cart1 para arquivo .csv
    #--------------------------------
    dfconfusionMatrixPredictionCartWithTable <- dfConfusionMatrixPredictionTechniqueWithParameterColumns(confusionMatrixPredictionCartWithTable,
                                                                                                        bestCart,
                                                                                                        dfCartAccuracyOfTrainingData)
    
    
    #dfconfusionMatrixPredictionCartWithTable <- data.frame(confusionMatrixPredictionCartWithTable)
    #dfconfusionMatrixPredictionCartWithTable$value_counts <- rbind("True Negative", "False Positive", "False Negative", "True Positive")
    #dfconfusionMatrixPredictionCartWithTable$Technique <- bestCart
    #dfconfusionMatrixPredictionCartWithTable$Mean <- dfCartAccuracyOfTrainingData$Mean[1]
    #--------------------------------
    # View(dfconfusionMatrixPredictionCartWithTable)
    
    # preparando dados de probabilidade predicao rna1 para arquivo .csv
    #------------------------------------------------
    dfaccuracyAndErrorRatePredictionCartTemp <- data.frame(accuracyAndErrorRatePredictionCart)
    
    dfaccuracyAndErrorRatePredictionCart <- dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns(dfaccuracyAndErrorRatePredictionCartTemp,
                                                                                                         dfCartAccuracyOfTrainingData,
                                                                                                         bestCart)
    
    #dfaccuracyAndErrorRatePredictionCart <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionCartTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionCartTemp$Freq[2])
    #dfaccuracyAndErrorRatePredictionCart$Training_data_accuracy <- dfCartAccuracyOfTrainingData$Mean[1]
    #dfaccuracyAndErrorRatePredictionCart$Technique <- bestCart
    #-----------------------------------------------------
    # View(dfaccuracyAndErrorRatePredictionCart)
    
    
    
    
    #-------------------- Decision Trees --------------------#
    
    bestTechniqueDecisionTrees <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^Decision"))
    
    if (bestTechniqueDecisionTrees[1] == "Decision Trees 1 (C5.0)") {
      
      bestDecisionTrees <- "Decision Trees 1 (C5.0)"
      modelDecisionTrees1
      modelDecisionTrees1$results
      
      predictionDecisionTrees <- predict(modelDecisionTrees1, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionDecisionTreesWithTable <- table(Predictions = predictionDecisionTrees,  Reference = testDataLabelColumn)
      confusionMatrixPredictionDecisionTreesWithTable
      
      accuracyAndErrorRatePredictionDecisionTrees <- prop.table(table(predictionDecisionTrees == testDataLabelColumn))
      accuracyAndErrorRatePredictionDecisionTrees
      
      
    } else if (bestTechniqueDecisionTrees[1] == "Decision Trees 1 (C5.0Rules)") {
      
      bestDecisionTrees <- "Decision Trees 1 (C5.0Rules)"
      modelDecisionTrees2
      modelDecisionTrees2$results
      
      predictionDecisionTrees <- predict(modelDecisionTrees2, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionDecisionTreesWithTable <- table(Predictions = predictionDecisionTrees,  Reference = testDataLabelColumn)
      confusionMatrixPredictionDecisionTreesWithTable
      
      accuracyAndErrorRatePredictionDecisionTrees <- prop.table(table(predictionDecisionTrees == testDataLabelColumn))
      accuracyAndErrorRatePredictionDecisionTrees
      
    } else {
      
      bestDecisionTrees <- "Decision Trees 1 (C5.0Tree)"
      modelDecisionTrees3
      modelDecisionTrees3$results
      
      predictionDecisionTrees <- predict(modelDecisionTrees3, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionDecisionTreesWithTable <- table(Predictions = predictionDecisionTrees,  Reference = testDataLabelColumn)
      confusionMatrixPredictionDecisionTreesWithTable
      
      accuracyAndErrorRatePredictionDecisionTrees <- prop.table(table(predictionDecisionTrees == testDataLabelColumn))
      accuracyAndErrorRatePredictionDecisionTrees
      
    }
    
    # preparando dados de predicao c50_1 para arquivo .csv
    #--------------------------------
    
    dfconfusionMatrixPredictionDecisionTreesWithTable <- dfConfusionMatrixPredictionTechniqueWithParameterColumns(confusionMatrixPredictionDecisionTreesWithTable,
                                                                                                        bestDecisionTrees,
                                                                                                        dfDecisionTreesAccuracyOfTrainingData)
    
    # dfconfusionMatrixPredictionDecisionTreesWithTable <- data.frame(confusionMatrixPredictionDecisionTreesWithTable)
    # dfconfusionMatrixPredictionDecisionTreesWithTable$value_counts <- rbind("True Negative", "False Positive", "False Negative", "True Positive")
    # dfconfusionMatrixPredictionDecisionTreesWithTable$Technique <- bestDecisionTrees
    # dfconfusionMatrixPredictionDecisionTreesWithTable$Mean <- dfDecisionTreesAccuracyOfTrainingData$Mean[1]
    #--------------------------------
    # View(dfconfusionMatrixPredictionDecisionTreesWithTable)
    # preparando dados de probabilidade predicao rna1 para arquivo .csv
    #------------------------------------------------
    dfaccuracyAndErrorRatePredictionDecisionTreesTemp <- data.frame(accuracyAndErrorRatePredictionDecisionTrees)
    
    dfaccuracyAndErrorRatePredictionDecisionTrees <- dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns(dfaccuracyAndErrorRatePredictionDecisionTreesTemp,
                                                                                                          dfDecisionTreesAccuracyOfTrainingData,
                                                                                                          bestDecisionTrees)
    
    # dfaccuracyAndErrorRatePredictionDecisionTrees <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionDecisionTreesTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionDecisionTreesTemp$Freq[2])
    # dfaccuracyAndErrorRatePredictionDecisionTrees$Training_data_accuracy <- dfDecisionTreesAccuracyOfTrainingData$Mean[1]
    # dfaccuracyAndErrorRatePredictionDecisionTrees$Technique <- bestDecisionTrees
    #-----------------------------------------------------
    # View(dfaccuracyAndErrorRatePredictionDecisionTrees)
    
    
    #-------------------- RANDOM FOREST --------------------#
    
    bestTechniqueRandomForest <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^Random"))
    
    if (bestTechniqueRandomForest[1] == "Random Forest 1 (rf)") {
      
      bestRandomForest <- "Random Forest 1 (rf)"
      modelRandomForest1
      modelRandomForest1$results
      
      predictionRandomForest <- predict(modelRandomForest1, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionRandomForestWithTable <- table(Predictions = predictionRandomForest, Reference = testDataLabelColumn)
      confusionMatrixPredictionRandomForestWithTable
      
      accuracyAndErrorRatePredictionRandomForest <- prop.table(table(predictionRandomForest == testDataLabelColumn))
      accuracyAndErrorRatePredictionRandomForest
      
      
    } else if (bestTechniqueRandomForest[1] == "Random Forest 2 (cforest)") {
      
      bestRandomForest <- "Random Forest 2 (cforest)"
      modelRandomForest2
      modelRandomForest2$results
      
      predictionRandomForest <- predict(modelRandomForest2, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionRandomForestWithTable <- table(Predictions = predictionRandomForest, Reference = testDataLabelColumn)
      confusionMatrixPredictionRandomForestWithTable
      
      accuracyAndErrorRatePredictionRandomForest <- prop.table(table(predictionRandomForest == testDataLabelColumn))
      accuracyAndErrorRatePredictionRandomForest
      
    } else {
      
      bestRandomForest <- "Random Forest 3 (parRF)"
      modelRandomForest3
      modelRandomForest3$results
      
      predictionRandomForest <- predict(modelRandomForest3, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionRandomForestWithTable <- table(Predictions = predictionRandomForest, Reference = testDataLabelColumn)
      confusionMatrixPredictionRandomForestWithTable
      
      accuracyAndErrorRatePredictionRandomForest <- prop.table(table(predictionRandomForest == testDataLabelColumn))
      accuracyAndErrorRatePredictionRandomForest
      
    }
    
    # preparando dados de predicao rf para arquivo .csv
    #--------------------------------
    
    dfconfusionMatrixPredictionRandomForestWithTable <- dfConfusionMatrixPredictionTechniqueWithParameterColumns(confusionMatrixPredictionRandomForestWithTable,
                                                                                                                  bestRandomForest,
                                                                                                                  dfRandomForestAccuracyOfTrainingData)
    
    # dfconfusionMatrixPredictionRandomForestWithTable <- data.frame(confusionMatrixPredictionRandomForestWithTable)
    # dfconfusionMatrixPredictionRandomForestWithTable$value_counts <- rbind("True Negative", "False Positive", "False Negative", "True Positive")
    # dfconfusionMatrixPredictionRandomForestWithTable$Technique <- bestRandomForest
    # dfconfusionMatrixPredictionRandomForestWithTable$Mean <- dfRandomForestAccuracyOfTrainingData$Mean[1]
    #--------------------------------
    # View(dfconfusionMatrixPredictionRandomForestWithTable)
    # preparando dados de probabilidade predicao rna1 para arquivo .csv
    #------------------------------------------------
    dfaccuracyAndErrorRatePredictionRandomForestTemp <- data.frame(accuracyAndErrorRatePredictionRandomForest)
    
    dfaccuracyAndErrorRatePredictionRandomForest <- dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns(dfaccuracyAndErrorRatePredictionRandomForestTemp,
                                                                                                                   dfRandomForestAccuracyOfTrainingData,
                                                                                                                   bestRandomForest)
    
    # dfaccuracyAndErrorRatePredictionRandomForest <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionRandomForestTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionRandomForestTemp$Freq[2])
    # dfaccuracyAndErrorRatePredictionRandomForest$Training_data_accuracy <- dfRandomForestAccuracyOfTrainingData$Mean[1]
    # dfaccuracyAndErrorRatePredictionRandomForest$Technique <- bestRandomForest
    #-----------------------------------------------------
    # View(dfaccuracyAndErrorRatePredictionRandomForest)
    
    
    #-------------------- KNN --------------------#
    
    bestTechniqueKnn <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^k-NN"))
    
    if (bestTechniqueKnn[1] == "k-NN 1 (knn)") {
      
      bestKnn <- "k-NN 1 (knn)"
      modelKnn1
      modelKnn1$results
      
      predictionKnn <- predict(modelKnn1, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionKnnWithTable <- table(Predictions = predictionKnn, Reference = testDataLabelColumn)
      confusionMatrixPredictionKnnWithTable
      
      accuracyAndErrorRatePredictionKnn <- prop.table(table(predictionKnn == testDataLabelColumn))
      accuracyAndErrorRatePredictionKnn
      
    } else {
      
      bestKnn <- "k-NN 2 (kknn)"
      modelKnn2
      modelKnn2$results
      
      predictionKnn <- predict(modelKnn2, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionKnnWithTable <- table(Predictions = predictionKnn, Reference = testDataLabelColumn)
      confusionMatrixPredictionKnnWithTable
      
      accuracyAndErrorRatePredictionKnn <- prop.table(table(predictionKnn == testDataLabelColumn))
      accuracyAndErrorRatePredictionKnn
      
    }
    
    # preparando dados de predicao knn para arquivo .csv
    #--------------------------------
    
    dfconfusionMatrixPredictionKnnWithTable <- dfConfusionMatrixPredictionTechniqueWithParameterColumns(confusionMatrixPredictionKnnWithTable,
                                                                                                                 bestKnn,
                                                                                                                 dfKnnAccuracyOfTrainingData)
    
    # dfconfusionMatrixPredictionKnnWithTable <- data.frame(confusionMatrixPredictionKnnWithTable)
    # dfconfusionMatrixPredictionKnnWithTable$value_counts <- rbind("True Negative", "False Positive", "False Negative", "True Positive")
    # dfconfusionMatrixPredictionKnnWithTable$Technique <- bestKnn
    # dfconfusionMatrixPredictionKnnWithTable$Mean <- dfKnnAccuracyOfTrainingData$Mean[1]
    #--------------------------------
    # View(dfconfusionMatrixPredictionKnnWithTable)
    # preparando dados de probabilidade predicao rna1 para arquivo .csv
    #------------------------------------------------
    dfaccuracyAndErrorRatePredictionKnnTemp <- data.frame(accuracyAndErrorRatePredictionKnn)
    
    dfaccuracyAndErrorRatePredictionKnn <- dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns(dfaccuracyAndErrorRatePredictionKnnTemp,
                                                                                                                  dfKnnAccuracyOfTrainingData,
                                                                                                                  bestKnn)
    
    # dfaccuracyAndErrorRatePredictionKnn <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionKnnTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionKnnTemp$Freq[2])
    # dfaccuracyAndErrorRatePredictionKnn$Training_data_accuracy <- dfKnnAccuracyOfTrainingData$Mean[1]
    # dfaccuracyAndErrorRatePredictionKnn$Technique <- bestKnn
    #-----------------------------------------------------
    # View(dfaccuracyAndErrorRatePredictionKnn)
    
    
    
    #-------------------- NAIVE BAYES --------------------#
    
    bestTechniqueNaiveBayes <- dfBestTechniqueAccuracyOfTrainingData %>% filter(str_detect(Technique, "^Naive"))
    
    if (bestTechniqueNaiveBayes[1] == "Naive Bayes 1 (nb)") {
      
      bestNaiveBayes <- "Naive Bayes 1 (nb)"
      modelNaiveBayes1
      modelNaiveBayes1$results
      
      predictionNaiveBayes <- predict(modelNaiveBayes1, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionNaiveBayesWithTable <- table(Predictions = predictionNaiveBayes, Reference = testDataLabelColumn)
      confusionMatrixPredictionNaiveBayesWithTable
      
      accuracyAndErrorRatePredictionNaiveBayes <- prop.table(table(predictionNaiveBayes == testDataLabelColumn))
      accuracyAndErrorRatePredictionNaiveBayes
      
    }else{
      
      bestNaiveBayes <- "Naive Bayes 2 (naive_bayes)"
      modelNaiveBayes2
      modelNaiveBayes2$results
      
      predictionNaiveBayes <- predict(modelNaiveBayes2, testDataWithoutLabelColumn)
      
      confusionMatrixPredictionNaiveBayesWithTable <- table(Predictions = predictionNaiveBayes, Reference = testDataLabelColumn)
      confusionMatrixPredictionNaiveBayesWithTable
      
      accuracyAndErrorRatePredictionNaiveBayes <- prop.table(table(predictionNaiveBayes == testDataLabelColumn))
      accuracyAndErrorRatePredictionNaiveBayes
      
    }
    
    # preparando dados de predicao nbayes2 para arquivo .csv
    #--------------------------------
    dfconfusionMatrixPredictionNaiveBayesWithTable <- dfConfusionMatrixPredictionTechniqueWithParameterColumns(confusionMatrixPredictionNaiveBayesWithTable,
                                                                                                        bestNaiveBayes,
                                                                                                        dfNaiveBayesAccuracyOfTrainingData)
    
    # dfconfusionMatrixPredictionNaiveBayesWithTable <- data.frame(confusionMatrixPredictionNaiveBayesWithTable)
    # dfconfusionMatrixPredictionNaiveBayesWithTable$value_counts <- rbind("True Negative", "False Positive", "False Negative", "True Positive")
    # dfconfusionMatrixPredictionNaiveBayesWithTable$Technique <- bestNaiveBayes
    # dfconfusionMatrixPredictionNaiveBayesWithTable$Mean <- dfNaiveBayesAccuracyOfTrainingData$Mean[1]
    #--------------------------------
    # View(dfconfusionMatrixPredictionNaiveBayesWithTable)
    # preparando dados de probabilidade predicao rna1 para arquivo .csv
    #------------------------------------------------
    dfaccuracyAndErrorRatePredictionNaiveBayesTemp <- data.frame(accuracyAndErrorRatePredictionNaiveBayes)
    
    dfaccuracyAndErrorRatePredictionNaiveBayes <- dfAccuracyAndErrorRatePredictionTechniqueWithParameterColumns(dfaccuracyAndErrorRatePredictionNaiveBayesTemp,
                                                                                                         dfNaiveBayesAccuracyOfTrainingData,
                                                                                                         bestNaiveBayes)
    
    # dfaccuracyAndErrorRatePredictionNaiveBayes <- data.frame("Test_data_error_rate"=dfaccuracyAndErrorRatePredictionNaiveBayesTemp$Freq[1], "Test_data_accuracy"=dfaccuracyAndErrorRatePredictionNaiveBayesTemp$Freq[2])
    # dfaccuracyAndErrorRatePredictionNaiveBayes$Training_data_accuracy <- dfNaiveBayesAccuracyOfTrainingData$Mean[1]
    # dfaccuracyAndErrorRatePredictionNaiveBayes$Technique <- bestNaiveBayes
    #-----------------------------------------------------
    # View(dfaccuracyAndErrorRatePredictionNaiveBayes)
    
    
    # criando arquivo confusionMatrixTechnicalPredictionWithTable.csv
    # Pegando o resultado de cada matriz de confusão de cada tecnica
    #---------------------------------------
    dfConfusionMatrixTechnicalPredictionWithTable <- rbind(dfconfusionMatrixPredictionRnaWithTable, dfconfusionMatrixPredictionSvmWithTable, dfconfusionMatrixPredictionCartWithTable, dfconfusionMatrixPredictionDecisionTreesWithTable, dfconfusionMatrixPredictionRandomForestWithTable, dfconfusionMatrixPredictionKnnWithTable, dfconfusionMatrixPredictionNaiveBayesWithTable)
    
    # Ordenando o resultado
    dfConfusionMatrixTechnicalPredictionWithTable <- dfConfusionMatrixTechnicalPredictionWithTable[order(dfConfusionMatrixTechnicalPredictionWithTable$Training_data_accuracy, decreasing=TRUE), ]
    
    # removendo coluna "Mean" foi usada para ordenar os resultados da melhor tecnica
    #dfConfusionMatrixTechnicalPredictionWithTable$Mean_Accuracy <- NULL
    
    # Adicionando colunas com os prametros usados para o treinamento
    dfConfusionMatrixTechnicalPredictionWithTable <- addTrainingParameterColumns(dfConfusionMatrixTechnicalPredictionWithTable, 
                                                                      seed, 
                                                                      dfGenderVoice, 
                                                                      numberOfFemaleClassSamples, 
                                                                      numberOfMaleClassSamples, 
                                                                      dataDivisionMethod, 
                                                                      trainingData, 
                                                                      numberOfSamplesFemaleTrainingData, 
                                                                      numberOfSamplesMaleTrainingData, 
                                                                      testData, 
                                                                      numberOfSamplesFemaleTestData, 
                                                                      numberOfSamplesMaleTestData, 
                                                                      operationalSystem)
    
    
    # dfConfusionMatrixTechnicalPredictionWithTable$Seed <- seed
    # dfConfusionMatrixTechnicalPredictionWithTable$Samples <- nrow(dfGenderVoice)
    # dfConfusionMatrixTechnicalPredictionWithTable$Male_samples <- numberOfMaleClassSamples
    # dfConfusionMatrixTechnicalPredictionWithTable$Female_samples <- numberOfFemaleClassSamples
    # dfConfusionMatrixTechnicalPredictionWithTable$Data_division_method <- dataDivisionMethod
    # dfConfusionMatrixTechnicalPredictionWithTable$Training_samples_80p <- nrow(trainingData)
    # dfConfusionMatrixTechnicalPredictionWithTable$Training_samples_Female <- numberOfSamplesFemaleTrainingData
    # dfConfusionMatrixTechnicalPredictionWithTable$Training_samples_Male <- numberOfSamplesMaleTrainingData
    # dfConfusionMatrixTechnicalPredictionWithTable$Test_samples_20p <- nrow(testData)
    # dfConfusionMatrixTechnicalPredictionWithTable$Test_samples_Female <- numberOfSamplesFemaleTestData
    # dfConfusionMatrixTechnicalPredictionWithTable$Test_samples_Male <- numberOfSamplesMaleTestData
    # dfConfusionMatrixTechnicalPredictionWithTable$Operational_System <- operationalSystem
    
    
    #Adicionando linha Na(Not Available) no dataframe
    #dfConfusionMatrixTechnicalPredictionWithTable <- addNaLineAtTheEndOfTheDataframe(dfConfusionMatrixTechnicalPredictionWithTable)
    
    # # Definindo o caminho a ser salvo o arquivo confusionMatrixTechnicalPredictionWithTable.csv
    #filePathResulteHitsAndMissesTechnicalPrediction <- joinPathAndFilename(pathToSaveFile, "confusionMatrixTechnicalPredictionWithTable.csv")
    
    # Salvando informacoes no arquivo .csv
    #createAndUpdateFileCsv(filePathResulteHitsAndMissesTechnicalPrediction, dfConfusionMatrixTechnicalPredictionWithTable)
    
    # Lendo arquivo resulteHitsAndMissesTechnicalPrediction.csv
    #dfConfusionMatrixTechnicalPredictionWithTableView <- read.csv(filePathResulteHitsAndMissesTechnicalPrediction,header=TRUE,encoding="UTF-8")
    # view(dfConfusionMatrixTechnicalPredictionWithTableView)
    
    #----------------------------------
    
    # criando arquivo accuracyAndErrorRateTechnicalPrediction.csv
    #-------------------------------------------------
    # Pegando o resultado de cada acuracia e taxa de erro de cada tecnica
    dfAccuracyAndErrorRateTechnicalPrediction <- rbind(dfaccuracyAndErrorRatePredictionRna, dfaccuracyAndErrorRatePredictionSvm, dfaccuracyAndErrorRatePredictionCart, dfaccuracyAndErrorRatePredictionDecisionTrees, dfaccuracyAndErrorRatePredictionRandomForest, dfaccuracyAndErrorRatePredictionKnn, dfaccuracyAndErrorRatePredictionNaiveBayes)
    # View(dfAccuracyAndErrorRateTechnicalPrediction)
    
    # Ordenando o resultado pela acuracia de dados de teste
    dfAccuracyAndErrorRateTechnicalPrediction <- dfAccuracyAndErrorRateTechnicalPrediction[order(dfAccuracyAndErrorRateTechnicalPrediction$Test_data_accuracy, decreasing=TRUE), ]
    
    # Adicionando colunas com os prametros usados para o treinamento
    dfAccuracyAndErrorRateTechnicalPrediction <- addTrainingParameterColumns(dfAccuracyAndErrorRateTechnicalPrediction, 
                                                                                 seed, 
                                                                                 dfGenderVoice, 
                                                                                 numberOfFemaleClassSamples, 
                                                                                 numberOfMaleClassSamples, 
                                                                                 dataDivisionMethod, 
                                                                                 trainingData, 
                                                                                 numberOfSamplesFemaleTrainingData, 
                                                                                 numberOfSamplesMaleTrainingData, 
                                                                                 testData, 
                                                                                 numberOfSamplesFemaleTestData, 
                                                                                 numberOfSamplesMaleTestData, 
                                                                                 operationalSystem)
    
    
    # # Crinado nova colunas no dataframe
    # dfAccuracyAndErrorRateTechnicalPrediction$Seed <- seed
    # dfAccuracyAndErrorRateTechnicalPrediction$Samples <- nrow(dfGenderVoice)
    # dfAccuracyAndErrorRateTechnicalPrediction$Male_samples <- numberOfMaleClassSamples
    # dfAccuracyAndErrorRateTechnicalPrediction$Female_samples <- numberOfFemaleClassSamples
    # dfAccuracyAndErrorRateTechnicalPrediction$Data_division_method <- dataDivisionMethod
    # dfAccuracyAndErrorRateTechnicalPrediction$Training_samples_80p <- nrow(trainingData)
    # dfAccuracyAndErrorRateTechnicalPrediction$Training_samples_Female <- numberOfSamplesFemaleTrainingData
    # dfAccuracyAndErrorRateTechnicalPrediction$Training_samples_Male <- numberOfSamplesMaleTrainingData
    # dfAccuracyAndErrorRateTechnicalPrediction$Test_samples_20p <- nrow(testData)
    # dfAccuracyAndErrorRateTechnicalPrediction$Test_samples_Female <- numberOfSamplesFemaleTestData
    # dfAccuracyAndErrorRateTechnicalPrediction$Test_samples_Male <- numberOfSamplesMaleTestData
    # dfAccuracyAndErrorRateTechnicalPrediction$Operational_System <- operationalSystem
    
    #alterando ordem das colunas do dataframe, a coluna "Technique" e colocada como primeira coluna
    #dfAccuracyAndErrorRateTechnicalPrediction <- dfAccuracyAndErrorRateTechnicalPrediction %>% select(Technique, everything())
    
    # Adicionando linha Na(Not Available) no dataframe
    #dfAccuracyAndErrorRateTechnicalPrediction <- addNaLineAtTheEndOfTheDataframe(dfAccuracyAndErrorRateTechnicalPrediction)
    
    # Definindo o caminho a ser salvo o arquivo accuracyAndErrorRateTechnicalPrediction.csv
    #filePathAccuracyHitsAndMissesTechnicalPrediction <- joinPathAndFilename(pathToSaveFile, "accuracyAndErrorRateTechnicalPrediction.csv")
    
    # Salvando informacoes no arquivo .csv
    #createAndUpdateFileCsv(filePathAccuracyHitsAndMissesTechnicalPrediction, dfAccuracyAndErrorRateTechnicalPrediction)
    
    # Lendo accuracyHitsAndMissesTechnicalPrediction.csv
    #dfAccuracyAndErrorRateTechnicalPredictionView <- read.csv(filePathAccuracyHitsAndMissesTechnicalPrediction,header=TRUE,encoding="UTF-8")
    # view(dfAccuracyAndErrorRateTechnicalPredictionView)
    
    #--------------------------------------------------
    
    #str(predictionRna)
    #str(testDataLabelColumn)
    
    #levels(predictionRna)
    #levels(testDataLabelColumn)
    
    
    # ********** Matriz de confusao - estatisticas dos resultados da predicao ********** #
    
    # Alterando type de "testDataLabelColumn" de "character" para "factor", para funcionar na funcao confusionMatrix()
    testDataLabelColumn <- factor(testDataLabelColumn)
    
    confusionMatrixPredictionRna <- confusionMatrix(predictionRna, testDataLabelColumn)
    confusionMatrixPredictionSvm <- confusionMatrix(predictionSvm, testDataLabelColumn)
    confusionMatrixPredictionCart <- confusionMatrix(predictionCart, testDataLabelColumn)
    confusionMatrixPredictionDecisionTrees <- confusionMatrix(predictionDecisionTrees, testDataLabelColumn)
    confusionMatrixPredictionRandomForest <- confusionMatrix(predictionRandomForest, testDataLabelColumn)
    confusionMatrixPredictionKnn <- confusionMatrix(predictionKnn, testDataLabelColumn)
    confusionMatrixPredictionNaiveBayes <- confusionMatrix(predictionNaiveBayes, testDataLabelColumn)
    
    
    confusionMatrixPredictionRna
    confusionMatrixPredictionSvm
    confusionMatrixPredictionCart
    confusionMatrixPredictionDecisionTrees
    confusionMatrixPredictionRandomForest
    confusionMatrixPredictionKnn
    confusionMatrixPredictionNaiveBayes
    
    confusionMatrixPredictionRna$table
    confusionMatrixPredictionRna$overall
    confusionMatrixPredictionRna$overall[1]
    
    # Informacoes de predicao dos dados de teste da matriz de confusao
    # Pegando informacoes para confusionMatrixPredictionResult.csv
    #--------------------------------------------------------------
    
    #dfConfusionMatrixPredictionRna <- data.frame(confusionMatrixPredictionRna$table)
    
    
    dfConfusionMatrixPredictionRna <- dfConfusionMatrixPredictionTechniqueWithParameterColumns2(confusionMatrixPredictionRna, 
                                                                                                bestRna,
                                                                                                dfRnaAccuracyOfTrainingData)
    #dfConfusionMatrixPredictionRna$Technique <- bestRna
    #dfConfusionMatrixPredictionRna$Test_data_accuracy <- confusionMatrixPredictionRna$overall[1]
    
    # dfConfusionMatrixPredictionRna$Prediction <- as.character(dfConfusionMatrixPredictionRna$Prediction)
    # dfConfusionMatrixPredictionRna$Reference <- as.character(dfConfusionMatrixPredictionRna$Reference)
    # 
    # 
    # dfConfusionMatrixPredictionRna <- addUnderLineAtTheEndOfTheDataframe(dfConfusionMatrixPredictionRna)
    # View(dfConfusionMatrixPredictionRna)
    
    
    dfConfusionMatrixPredictionSvm <- dfConfusionMatrixPredictionTechniqueWithParameterColumns2(confusionMatrixPredictionSvm, 
                                                                                                bestSvm,
                                                                                                dfSvmAccuracyOfTrainingData)
    # dfConfusionMatrixPredictionSvm <- data.frame(confusionMatrixPredictionSvm$table)
    # dfConfusionMatrixPredictionSvm$Technique <- bestSvm
    # dfConfusionMatrixPredictionSvm$Accuracy <- confusionMatrixPredictionSvm$overall[1]
    # View(dfConfusionMatrixPredictionSvm)
    
    dfConfusionMatrixPredictionCart <- dfConfusionMatrixPredictionTechniqueWithParameterColumns2(confusionMatrixPredictionCart, 
                                                                                                bestCart,
                                                                                                dfCartAccuracyOfTrainingData)
    # dfConfusionMatrixPredictionCart <- data.frame(confusionMatrixPredictionCart$table)
    # dfConfusionMatrixPredictionCart$Technique <- bestCart
    # dfConfusionMatrixPredictionCart$Accuracy <- confusionMatrixPredictionCart$overall[1]
    # View(dfConfusionMatrixPredictionCart)
    
    dfConfusionMatrixPredictionDecisionTrees <- dfConfusionMatrixPredictionTechniqueWithParameterColumns2(confusionMatrixPredictionDecisionTrees, 
                                                                                                 bestDecisionTrees,
                                                                                                 dfDecisionTreesAccuracyOfTrainingData)
    # dfConfusionMatrixpredictionDecisionTrees <- data.frame(confusionMatrixpredictionDecisionTrees$table)
    # dfConfusionMatrixpredictionDecisionTrees$Technique <- bestDecisionTrees
    # dfConfusionMatrixpredictionDecisionTrees$Accuracy <- confusionMatrixpredictionDecisionTrees$overall[1]
    # View(dfConfusionMatrixPredictionDecisionTrees)
    
    dfConfusionMatrixPredictionRandomForest <- dfConfusionMatrixPredictionTechniqueWithParameterColumns2(confusionMatrixPredictionRandomForest, 
                                                                                                          bestRandomForest,
                                                                                                          dfRandomForestAccuracyOfTrainingData)
    # dfConfusionMatrixPredictionRandomForest <- data.frame(confusionMatrixPredictionRandomForest$table)
    # dfConfusionMatrixPredictionRandomForest$Technique <- bestRandomForest
    # dfConfusionMatrixPredictionRandomForest$Accuracy <- confusionMatrixPredictionRandomForest$overall[1]
    # View(dfConfusionMatrixPredictionRandomForest)
    
    dfConfusionMatrixPredictionKnn <- dfConfusionMatrixPredictionTechniqueWithParameterColumns2(confusionMatrixPredictionKnn, 
                                                                                                         bestKnn,
                                                                                                         dfKnnAccuracyOfTrainingData)
    # dfConfusionMatrixPredictionKnn <- data.frame(confusionMatrixPredictionKnn$table)
    # dfConfusionMatrixPredictionKnn$Technique <- bestKnn
    # dfConfusionMatrixPredictionKnn$Accuracy <- confusionMatrixPredictionKnn$overall[1]
    # View(dfConfusionMatrixPredictionKnn)
    
    dfConfusionMatrixPredictionNaiveBayes <- dfConfusionMatrixPredictionTechniqueWithParameterColumns2(confusionMatrixPredictionNaiveBayes, 
                                                                                                bestNaiveBayes,
                                                                                                dfNaiveBayesAccuracyOfTrainingData)
    # dfConfusionMatrixPredictionNaiveBayes <- data.frame(confusionMatrixPredictionNaiveBayes$table)
    # dfConfusionMatrixPredictionNaiveBayes$Technique <- bestNaiveBayes
    # dfConfusionMatrixPredictionNaiveBayes$Accuracy <- confusionMatrixPredictionNaiveBayes$overall[1]
    # View(dfConfusionMatrixPredictionNaiveBayes)
    
    # Pegando o resultado de cada mariz de confusao de cada tecnica e juntando em um unico dataframe
    dfConfusionMatrixPredictionTechniques <- rbind(dfConfusionMatrixPredictionRna, dfConfusionMatrixPredictionSvm, dfConfusionMatrixPredictionCart, dfConfusionMatrixPredictionDecisionTrees, dfConfusionMatrixPredictionRandomForest, dfConfusionMatrixPredictionKnn, dfConfusionMatrixPredictionNaiveBayes)
    # View(dfConfusionMatrixPredictionTechniques)
    
    # Ordenar linhas com base na coluna Accuracy dos dados de teste
    dfConfusionMatrixPredictionTechniques <- dfConfusionMatrixPredictionTechniques[order(dfConfusionMatrixPredictionTechniques$Test_data_accuracy, decreasing=TRUE), ]
    
    # removendo coluna "Mean" foi usada para ordenar os resultados da melhor tecnica
    #dfConfusionMatrixPredictionTechniques$Accuracy <- NULL
    
    # Adicionando colunas com os prametros usados para o treinamento
    dfConfusionMatrixPredictionTechniques <- addTrainingParameterColumns(dfConfusionMatrixPredictionTechniques, 
                                                                             seed, 
                                                                             dfGenderVoice, 
                                                                             numberOfFemaleClassSamples, 
                                                                             numberOfMaleClassSamples, 
                                                                             dataDivisionMethod, 
                                                                             trainingData, 
                                                                             numberOfSamplesFemaleTrainingData, 
                                                                             numberOfSamplesMaleTrainingData, 
                                                                             testData, 
                                                                             numberOfSamplesFemaleTestData, 
                                                                             numberOfSamplesMaleTestData, 
                                                                             operationalSystem)
    
    # Crinado nova colunas no dataframe
    # dfConfusionMatrixPredictionTechniques$Seed <- seed
    # dfConfusionMatrixPredictionTechniques$Samples <- nrow(dfGenderVoice)
    # dfConfusionMatrixPredictionTechniques$Male_samples <- numberOfMaleClassSamples
    # dfConfusionMatrixPredictionTechniques$Female_samples <- numberOfFemaleClassSamples
    # dfConfusionMatrixPredictionTechniques$Data_division_method <- dataDivisionMethod
    # dfConfusionMatrixPredictionTechniques$Training_samples_80p <- nrow(trainingData)
    # dfConfusionMatrixPredictionTechniques$Training_samples_Female <- numberOfSamplesFemaleTrainingData
    # dfConfusionMatrixPredictionTechniques$Training_samples_Male <- numberOfSamplesMaleTrainingData
    # dfConfusionMatrixPredictionTechniques$Test_samples_20p <- nrow(testData)
    # dfConfusionMatrixPredictionTechniques$Test_samples_Female <- numberOfSamplesFemaleTestData
    # dfConfusionMatrixPredictionTechniques$Test_samples_Male <- numberOfSamplesMaleTestData
    
    # Adicionando linha Na(Not Available) no dataframe
    #dfConfusionMatrixPredictionTechniques <- addNaLineAtTheEndOfTheDataframe(dfConfusionMatrixPredictionTechniques)
    #dfConfusionMatrixPredictionTechniques <- addUnderLineAtTheEndOfTheDataframe(dfConfusionMatrixPredictionTechniques)
    
    # adiconando linhas de separacao
    # gerando uma linha com valores nulos
    
    # rowUnder <- seq(1:ncol(dfConfusionMatrixPredictionTechniques))
    # rowUnder[1:ncol(dfConfusionMatrixPredictionTechniques)] <- '-'
    # View(rowUnder)
    # rowUnder
    # dfConfusionMatrixPredictionTechniques <- dfConfusionMatrixPredictionTechniques %>% add_row(.data = rowUnder, .before = 2)
    
    dfConfusionMatrixPredictionTechniques <- addUnderlineAndZeroToSeparateLinesInTheDataframe(dfConfusionMatrixPredictionTechniques, 5)
    dfConfusionMatrixPredictionTechniques <- addUnderlineAndZeroToSeparateLinesInTheDataframe(dfConfusionMatrixPredictionTechniques, 10)
    dfConfusionMatrixPredictionTechniques <- addUnderlineAndZeroToSeparateLinesInTheDataframe(dfConfusionMatrixPredictionTechniques, 15)
    dfConfusionMatrixPredictionTechniques <- addUnderlineAndZeroToSeparateLinesInTheDataframe(dfConfusionMatrixPredictionTechniques, 20)
    dfConfusionMatrixPredictionTechniques <- addUnderlineAndZeroToSeparateLinesInTheDataframe(dfConfusionMatrixPredictionTechniques, 25)
    dfConfusionMatrixPredictionTechniques <- addUnderlineAndZeroToSeparateLinesInTheDataframe(dfConfusionMatrixPredictionTechniques, 30)
    
    # Definindo o caminho a ser salvo o arquivo confusionMatrixPredictionTechniques.csv
    filePathTechniquePredictionConfusionMatrix <- joinPathAndFilename(pathToSaveFile, "confusionMatrixPredictionTechniques.csv")
    
    # Salvando informacoes no arquivo .csv
    createAndUpdateFileCsv(filePathTechniquePredictionConfusionMatrix, dfConfusionMatrixPredictionTechniques)
    
    # Lendo confusionMatrixPredictionTechniques.csv
    dfTechniquePredictionConfusionMatrixView <- read.csv(filePathTechniquePredictionConfusionMatrix,header=TRUE,encoding="UTF-8")
    view(dfTechniquePredictionConfusionMatrixView)
    
    #---------------------------------------------
    confusionMatrixPredictionRna$overall
    confusionMatrixPredictionRna$byClass
    
    # Informacoes de estatistica(acuracia,...) dos dados de teste - matriz de confusao
    # Pegando informacoes para accuracyAndOtherInformationTechniquesPrediction.csv
    #-----------------------------------------------------------------
    dfAccuracyAndOtherInformationPredictionRna <- data.frame(cbind(t(confusionMatrixPredictionRna$overall),t(confusionMatrixPredictionRna$byClass)))
    dfAccuracyAndOtherInformationPredictionRna$Test_data_error_rate <- (1 - dfAccuracyAndOtherInformationPredictionRna$Accuracy)
    dfAccuracyAndOtherInformationPredictionRna$Training_data_accuracy <- dfRnaAccuracyOfTrainingData$Mean_Accuracy[1]
    dfAccuracyAndOtherInformationPredictionRna$Runtime_Training <- dfRnaAccuracyOfTrainingData$Runtime_Training[1]
    # View(dfAccuracyAndOtherInformationPredictionRna)
    
    dfAccuracyAndOtherInformationPredictionSvm <- data.frame(cbind(t(confusionMatrixPredictionSvm$overall),t(confusionMatrixPredictionSvm$byClass)))
    dfAccuracyAndOtherInformationPredictionSvm$Test_data_error_rate <- (1 - dfAccuracyAndOtherInformationPredictionSvm$Accuracy)
    dfAccuracyAndOtherInformationPredictionSvm$Training_data_accuracy <- dfSvmAccuracyOfTrainingData$Mean_Accuracy[1]
    dfAccuracyAndOtherInformationPredictionSvm$Runtime_Training <- dfSvmAccuracyOfTrainingData$Runtime_Training[1]
    
    dfAccuracyAndOtherInformationPredictionCart <- data.frame(cbind(t(confusionMatrixPredictionCart$overall),t(confusionMatrixPredictionCart$byClass)))
    dfAccuracyAndOtherInformationPredictionCart$Test_data_error_rate <- (1 - dfAccuracyAndOtherInformationPredictionCart$Accuracy)
    dfAccuracyAndOtherInformationPredictionCart$Training_data_accuracy <- dfCartAccuracyOfTrainingData$Mean_Accuracy[1]
    dfAccuracyAndOtherInformationPredictionCart$Runtime_Training <- dfCartAccuracyOfTrainingData$Runtime_Training[1]
    
    dfAccuracyAndOtherInformationPredictionDecisionTrees <- data.frame(cbind(t(confusionMatrixPredictionDecisionTrees$overall),t(confusionMatrixPredictionDecisionTrees$byClass)))
    dfAccuracyAndOtherInformationPredictionDecisionTrees$Test_data_error_rate <- (1 - dfAccuracyAndOtherInformationPredictionDecisionTrees$Accuracy)
    dfAccuracyAndOtherInformationPredictionDecisionTrees$Training_data_accuracy <- dfDecisionTreesAccuracyOfTrainingData$Mean_Accuracy[1]
    dfAccuracyAndOtherInformationPredictionDecisionTrees$Runtime_Training <- dfDecisionTreesAccuracyOfTrainingData$Runtime_Training[1]
    
    
    dfAccuracyAndOtherInformationPredictionRandomForest <- data.frame(cbind(t(confusionMatrixPredictionRandomForest$overall),t(confusionMatrixPredictionRandomForest$byClass)))
    dfAccuracyAndOtherInformationPredictionRandomForest$Test_data_error_rate <- (1 - dfAccuracyAndOtherInformationPredictionRandomForest$Accuracy)
    dfAccuracyAndOtherInformationPredictionRandomForest$Training_data_accuracy <- dfRandomForestAccuracyOfTrainingData$Mean_Accuracy[1]
    dfAccuracyAndOtherInformationPredictionRandomForest$Runtime_Training <- dfRandomForestAccuracyOfTrainingData$Runtime_Training[1]
    
    dfAccuracyAndOtherInformationPredictionKnn <- data.frame(cbind(t(confusionMatrixPredictionKnn$overall),t(confusionMatrixPredictionKnn$byClass)))
    dfAccuracyAndOtherInformationPredictionKnn$Test_data_error_rate <- (1 - dfAccuracyAndOtherInformationPredictionKnn$Accuracy)
    dfAccuracyAndOtherInformationPredictionKnn$Training_data_accuracy <- dfKnnAccuracyOfTrainingData$Mean_Accuracy[1]
    dfAccuracyAndOtherInformationPredictionKnn$Runtime_Training <- dfKnnAccuracyOfTrainingData$Runtime_Training[1]
    
    dfAccuracyAndOtherInformationPredictionNaiveBayes <- data.frame(cbind(t(confusionMatrixPredictionNaiveBayes$overall),t(confusionMatrixPredictionNaiveBayes$byClass)))
    dfAccuracyAndOtherInformationPredictionNaiveBayes$Test_data_error_rate <- (1 - dfAccuracyAndOtherInformationPredictionNaiveBayes$Accuracy)
    dfAccuracyAndOtherInformationPredictionNaiveBayes$Training_data_accuracy <- dfNaiveBayesAccuracyOfTrainingData$Mean_Accuracy[1]
    dfAccuracyAndOtherInformationPredictionNaiveBayes$Runtime_Training <- dfNaiveBayesAccuracyOfTrainingData$Runtime_Training[1]
    
    # View(dfAccuracyAndOtherInformationPredictionNaiveBayes)
    
    # juntando em um unico dataframe os resultados de acuracia e outras estatisicas da analise das tecnicas
    dfAccuracyAndOtherInformationTechniquesPrediction <- rbind(dfAccuracyAndOtherInformationPredictionRna, dfAccuracyAndOtherInformationPredictionSvm, dfAccuracyAndOtherInformationPredictionCart, dfAccuracyAndOtherInformationPredictionDecisionTrees, dfAccuracyAndOtherInformationPredictionRandomForest, dfAccuracyAndOtherInformationPredictionKnn, dfAccuracyAndOtherInformationPredictionNaiveBayes)
    # View(dfAccuracyAndOtherInformationTechniquesPrediction)
    
    # Alterando coluna Test_data_error_rate para ficar no lado da coluna Accuracy
    dfAccuracyAndOtherInformationTechniquesPrediction <- dfAccuracyAndOtherInformationTechniquesPrediction %>% select(Accuracy, Test_data_error_rate, everything())
    
    # Criando coluna Technique
    dfAccuracyAndOtherInformationTechniquesPrediction$Technique <- c(bestRna, bestSvm, bestCart, bestDecisionTrees, bestRandomForest, bestKnn, bestNaiveBayes)
    
    #  alterando ordem da coluna "Technique" e adicionando colunas com os prametros usados para o treinamento
    dfAccuracyAndOtherInformationTechniquesPrediction <- addTrainingParameterColumns(dfAccuracyAndOtherInformationTechniquesPrediction, 
                                                                         seed, 
                                                                         dfGenderVoice, 
                                                                         numberOfFemaleClassSamples, 
                                                                         numberOfMaleClassSamples, 
                                                                         dataDivisionMethod, 
                                                                         trainingData, 
                                                                         numberOfSamplesFemaleTrainingData, 
                                                                         numberOfSamplesMaleTrainingData, 
                                                                         testData, 
                                                                         numberOfSamplesFemaleTestData, 
                                                                         numberOfSamplesMaleTestData, 
                                                                         operationalSystem)
    
    # Crinado nova colunas no dataframe
    # dfAccuracyAndOtherInformationTechniquesPrediction$Seed <- seed
    # dfAccuracyAndOtherInformationTechniquesPrediction$Samples <- nrow(dfGenderVoice)
    # dfAccuracyAndOtherInformationTechniquesPrediction$Male_samples <- numberOfMaleClassSamples
    # dfAccuracyAndOtherInformationTechniquesPrediction$Female_samples <- numberOfFemaleClassSamples
    # dfAccuracyAndOtherInformationTechniquesPrediction$Data_division_method <- dataDivisionMethod
    # dfAccuracyAndOtherInformationTechniquesPrediction$Training_samples_80p <- nrow(trainingData)
    # dfAccuracyAndOtherInformationTechniquesPrediction$Training_samples_Female <- numberOfSamplesFemaleTrainingData
    # dfAccuracyAndOtherInformationTechniquesPrediction$Training_samples_Male <- numberOfSamplesMaleTrainingData
    # dfAccuracyAndOtherInformationTechniquesPrediction$Test_samples_20p <- nrow(testData)
    # dfAccuracyAndOtherInformationTechniquesPrediction$Test_samples_Female <- numberOfSamplesFemaleTestData
    # dfAccuracyAndOtherInformationTechniquesPrediction$Test_samples_Male <- numberOfSamplesMaleTestData
    
    
    # Tirando colunas não usadas para a analise
    dfAccuracyAndOtherInformationTechniquesPredictionNew <- dfAccuracyAndOtherInformationTechniquesPrediction[c(-4,-5, -6,-7,-8, -9, -12, -13, -15, -16, -17, -18, -19, -20)]
    # View(dfAccuracyAndOtherInformationTechniquesPredictionNew)
    
    # Mudando nome de algumas colunas
    # Alterando nome das colunas "Min.", "x1st.Qu.", "Median", "Mean", "3rd.Qu." e "Max." para "Min. Accuracy", "1st.Qu. Accuracy", "Median Accuracy", "Mean Accuracy", "3rd.Qu. Accuracy", "Max. Accuracy"
    colnames(dfAccuracyAndOtherInformationTechniquesPredictionNew)[2:6] <- c("Test_data_accuracy", "Test_data_error_rate", "Test_data_sensitivity", "Test_data_specificity", "Test_data_precision")
    
    # Ordenar linhas com base na coluna Accuracy dos dados de teste
    dfAccuracyAndOtherInformationTechniquesPredictionNew <- dfAccuracyAndOtherInformationTechniquesPredictionNew[order(dfAccuracyAndOtherInformationTechniquesPredictionNew$Test_data_accuracy, decreasing=TRUE), ]
    
    #Adicionando linha Na no dataframe
    #dfAccuracyAndOtherInformationTechniquesPrediction <- addNaLineAtTheEndOfTheDataframe(dfAccuracyAndOtherInformationTechniquesPrediction)
    
    # Definindo o caminho a ser salvo o arquivo accuracyAndOtherInformationTechniquesPrediction.csv
    filePathAccuracyAndOtherInformationTechniquePrediction <- joinPathAndFilename(pathToSaveFile, "accuracyAndOtherInformationTechniquesPrediction.csv")
    
    # Salvando informacoes no arquivo .csv
    createAndUpdateFileCsv(filePathAccuracyAndOtherInformationTechniquePrediction, dfAccuracyAndOtherInformationTechniquesPredictionNew)
    
    # Lendo accuracyHitsAndMissesTechnicalPrediction.csv
    dfAccuracyAndOtherInformationTechniquePredictionView <- read.csv(filePathAccuracyAndOtherInformationTechniquePrediction,header=TRUE,encoding="UTF-8")
    view(dfAccuracyAndOtherInformationTechniquePredictionView)
    
    
    
    ## ----verificar quais variaveis preditoras tiveram a maior importancia
    
    # ggplot(varImp(modelRna1))
    # ggplot(varImp(modelSvm2))
    # ggplot(varImp(modelCart1))
    # ggplot(varImp(modelDecisionTrees1))
    # ggplot(varImp(modelRandomForest3))
    # ggplot(varImp(modelKnn2))
    # ggplot(varImp(modelNaiveBayes2))
    
  }

} else {
  cat("Arquivo .csv nao existe!")
}




