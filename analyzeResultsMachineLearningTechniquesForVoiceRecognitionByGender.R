# ***********************************************************************************************************
# Anotações
# ***********************************************************************************************************

# "str_detect() - Detecta a presença ou ausência de um padrão em uma string

# "^" corresponde ao início da string.

# "$" corresponde ao final da string.

# A função rbind() é usada para combinar vários vetores, matrizes e/ou quadros de dados por rows. 

# Pacote dplyr ( se pronuncia diplaiar) ->  ajuda na manipulação dos dados. Recursos usados: %>% (pipe) e filter()

# %>% (pipe) -> sua função é encadear processos, isto é o resultado de uma operação e usado como entrada para 
# outra operação e assim por diante caso se tenha mais pipes.

# filter() -> escolhe casos(filtros) com base em seus valores.

# Pacote stringr ( se pronuncia stringar) ->  ajuda na manipulação de strings. Recursos usados: str_detect(),  str_c()

# str_detect() -> Detecta a presença ou ausência de um padrão em uma string.

# str_c() -> une várias strings em uma única string

# rbind() -> usada para combinar vários vetores, matrizes e/ou quadros de dados por linhas(rows).

# NA: 'Not Available'/ Missing Values ('Não disponível' / Valores ausentes)

# nrow : retorna O número de linhas de uma matriz



# ***********************************************************************************************************
# Ações iniciais
# ***********************************************************************************************************

# Importando bibliotecas que serão usadas
library(dplyr)   # "%>%" (pipe), filter()
library(stringr)   # "str_detect()",  str_c()


# Verificando em qual sistema o R esta instalado(Windows ou Linux) para selecionar a estrutura de pasta do sistema onde está os
# arquivos pra serem lidos
if(.Platform$OS.type == "windows"){
  
  filePath <- "D:/Documentos-gdrive/Engenharia de Telecomunicações - IFSC/10 fase/TCC2/Desenvolvimeto_TCC_-_Situação/Resultados/"
  
}else{
  filePath <- "/home/marioandre/scripts_R"
  #filePath <- getwd()
}

# Caminho onde será salvo os resultados da análise desse script
pathFileAnalysisResults <- "C:/Users/MarioAndre/Documents/"

# Função que cria e atualiza um arquivo .csv no caminho especificado
createAndUpdateFileCsv <- function(pathFileName,dfData){
  # Se o arquivo já existe, adiciona novas informações
  if (file.exists(pathFileName)){
    write.table(dfData, file = pathFileName, append = TRUE, sep = ",", row.names = FALSE, col.names = FALSE)
    
    # Senão cria o arquivo com as informações
  } else {
    write.table(dfData, file = pathFileName, sep = ",", row.names = FALSE)
  }
}


# Função que cria arquivo .csv no caminho especificado
createFileCsv <- function(pathFileName,dfData){
  write.table(dfData, file = pathFileName, sep = ",", row.names = FALSE)
}

# Especificando o caminho e o nome do arquivo .csv a ser lido com os resultados do script machineLearningTechniquesForVoiceRecognitionByGender.R
# Junta as string filePath e nome do arquivo.csv em uma única string, para definir o caminho onde está o arquivo
filePathAccuracyTraining <- str_c(filePath,"acuraciaDadosTreino.csv")
filePathAccuracyTechniquesTraining <- str_c(filePath,"acuraciaTecnicasTreino.csv")
filePathPredictionResult <- str_c(filePath,"resultadoPredicao.csv")
filePathPredictionResultProbability <- str_c(filePath,"resultadoPredicaoProb.csv")
filePathPredictionConfusionMatrix <- str_c(filePath,"resultadoMatrizConfusaoPredicao.csv")
filePathStatisticMatrixConfusion <- str_c(filePath,"resultadoMatrizConfusaoEstatist.csv")


# ***********************************************************************************************************
# Lendo os arquivos com os resultados e os atribuindo a variaveis
# ***********************************************************************************************************

# Lendo arquivos .csv e atribuindo os seus dados para a variaveis dataframes. "df" representa dataframe
dfAccuracyTraining <- read.csv(filePathAccuracyTraining,header=TRUE,encoding="UTF-8")

# Visualizando o dataframe 
View(dfAccuracyTraining)


dfAccuracyTechniquesTraining <- read.csv(filePathAccuracyTechniquesTraining,header=TRUE,encoding="UTF-8")
View(dfAccuracyTechniquesTraining)


dfPredictionResult <- read.csv(filePathPredictionResult,header=TRUE,encoding="UTF-8")
View(dfPredictionResult)


dfPredictionResultProbability <- read.csv(filePathPredictionResultProbability,header=TRUE,encoding="UTF-8")
View(dfPredictionResultProbability)


dfPredictionConfusionMatrix <- read.csv(filePathPredictionConfusionMatrix,header=TRUE,encoding="UTF-8")
View(dfPredictionConfusionMatrix)


dfStatisticMatrixConfusion <- read.csv(filePathStatisticMatrixConfusion,header=TRUE,encoding="UTF-8")
View(dfStatisticMatrixConfusion)


#-------------------   Analisando os dataframes lidos   -------------------

# ***********************************************************************************************************
# Lendo o arquivo acuraciaDadosTreino.csv(dfAccuracyTraining) e mostrando a melhor e a pior acurácia de cada 
# técnica em relação a análise dela feita com números diferentes de amostras(samples) e sementes(seedes)
#
# ***********************************************************************************************************

# Tirando colunas não usadas na análise
# Nao seleciona as colunas 2(Mim.), 3(X1st.Qu), 4(Median), 6(X3rd.Qu), 7(Max.), e 8(NA.s) e pega as demais
dfAccuracyTrainingNew <- dfAccuracyTraining[c(-2,-3,-4,-6,-7,-8)]

# Filtra o dfAccuracyTrainingNew para ter só as linha que começam com "RNA" na coluna "tecnica"
dfAccuracyTrainingRNA <- dfAccuracyTrainingNew %>% filter(str_detect(tecnica, "^RNA"))

# A partir do dataframe filtrado contendo só resultados de RNA, faz a ordenação do e relação a coluna "Mean" do maior para o menor
dfAccuracyTrainingRNA <- dfAccuracyTrainingRNA[order(dfAccuracyTrainingRNA$Mean, decreasing=TRUE), ]
#View(dfAccuracyTrainingRNA)

dfAccuracyTrainingSVM <- dfAccuracyTrainingNew %>% filter(str_detect(tecnica, "^SVM"))
dfAccuracyTrainingSVM <- dfAccuracyTrainingSVM[order(dfAccuracyTrainingSVM$Mean, decreasing=TRUE), ]
#View(dfAccuracyTrainingSVM)

dfAccuracyTrainingCart <- dfAccuracyTrainingNew %>% filter(str_detect(tecnica, "^CART"))
dfAccuracyTrainingCart <- dfAccuracyTrainingCart[order(dfAccuracyTrainingCart$Mean, decreasing=TRUE), ]
#View(dfAccuracyTrainingCart)

dfAccuracyTrainingC5 <- dfAccuracyTrainingNew %>% filter(str_detect(tecnica, "^C5"))
dfAccuracyTrainingC5 <- dfAccuracyTrainingC5[order(dfAccuracyTrainingC5$Mean, decreasing=TRUE), ]
#View(dfAccuracyTrainingC5)

dfAccuracyTrainingRandomForest <- dfAccuracyTrainingNew %>% filter(str_detect(tecnica, "^Random"))
dfAccuracyTrainingRandomForest <- dfAccuracyTrainingRandomForest[order(dfAccuracyTrainingRandomForest$Mean, decreasing=TRUE), ]
#View(dfAccuracyTrainingRandomForest)

dfAccuracyTrainingKnn <- dfAccuracyTrainingNew %>% filter(str_detect(tecnica, "^k-NN"))
dfAccuracyTrainingKnn <- dfAccuracyTrainingKnn[order(dfAccuracyTrainingKnn$Mean, decreasing=TRUE), ]
#View(dfAccuracyTrainingKnn)

dfAccuracyTrainingNaiveBayes <- dfAccuracyTrainingNew %>% filter(str_detect(tecnica, "^Naive"))
dfAccuracyTrainingNaiveBayes <- dfAccuracyTrainingNaiveBayes[order(dfAccuracyTrainingNaiveBayes$Mean, decreasing=TRUE), ]
#View(dfAccuracyTrainingNaiveBayes)

# Pega a linha 1 de cada dfTecnica que representa a melhor acurácia e junta elas em um novo dataframe
dfBestTechniquesAccuracyTraining <- rbind(dfAccuracyTrainingRNA[1,], dfAccuracyTrainingSVM[1,], dfAccuracyTrainingCart[1,], dfAccuracyTrainingC5[1,], dfAccuracyTrainingRandomForest[1,], dfAccuracyTrainingKnn[1,], dfAccuracyTrainingNaiveBayes[1,])

# Pega a linha 28 de cada dfTecnica que representa a pior acurácia e junta elas em um novo dataframe
dfWorstTechnicalAccuracyTraining <- rbind(dfAccuracyTrainingRNA[28,], dfAccuracyTrainingSVM[28,], dfAccuracyTrainingCart[28,], dfAccuracyTrainingC5[28,], dfAccuracyTrainingRandomForest[28,], dfAccuracyTrainingKnn[28,], dfAccuracyTrainingNaiveBayes[28,])

# Ordena o dfBestTechniquesAccuracyTraining em relação a coluna "Mean" do maior pro menor(decrescente)
dfBestTechniquesAccuracyTraining <- dfBestTechniquesAccuracyTraining[order(dfBestTechniquesAccuracyTraining$Mean, decreasing=TRUE), ]

# Ordena o dfWorstTechnicalAccuracyTraining em relação a coluna "Mean" do maior pro menor(decrescente)
dfWorstTechnicalAccuracyTraining <- dfWorstTechnicalAccuracyTraining[order(dfWorstTechnicalAccuracyTraining$Mean, decreasing=TRUE), ]

# Concateanando caminho + nome do arquivo para salvar os resultados
fileDfBestTechniquesAccuracyTraining <- str_c(pathFileAnalysisResults,"dfBestTechniquesAccuracyTraining.csv")
fileDfWorstTechnicalAccuracyTraining <- str_c(pathFileAnalysisResults,"dfWorstTechnicalAccuracyTraining.csv")

# Chamando função para criar o arquivo .csv com os resultados
createFileCsv(fileDfBestTechniquesAccuracyTraining, dfBestTechniquesAccuracyTraining)
createFileCsv(fileDfWorstTechnicalAccuracyTraining, dfWorstTechnicalAccuracyTraining)

# Lendo os arquivos .csv salvos
dfBestTechniquesAccuracyTrainingFileCsv <- read.csv(fileDfBestTechniquesAccuracyTraining,header=TRUE,encoding="UTF-8")
dfWorstTechnicalAccuracyTrainingFileCsv <- read.csv(fileDfWorstTechnicalAccuracyTraining,header=TRUE,encoding="UTF-8")

# Mostrandos os resultados salvos nos arquivos .csv
View(dfBestTechniquesAccuracyTrainingFileCsv)
View(dfWorstTechnicalAccuracyTrainingFileCsv)



# ***************************************************************************************************
# Verifica cada resultado de acuraciaTecnicasTreino.csv(dfAccuracyTechniquesTraining) em relação aos 
# parametros "semente", "número de amostras" e "método de divisao de treino", e mostra qual foi a melhor e 
# a pior técnica em cada um desses parâmetros
# ***************************************************************************************************



# cria um vetor com os valores [50, 100,1000,2000,3000,3168] que representa o número de amostras
sample <- c(50, 100,1000,2000,3000,3168)

# cria um vetor com os valores [1234,123] que representa o número da semente
seed <- c(1234,123)

# cria um vetor com os valores ["createDP","sample-prob"] que representa o método usado
method <- c("createDP","sample-prob")


# pega os dados de "dfAccuracyTechniquesTraining" e o atribui para um novo dataframe
dfAccuracyTechniquesTrainingNew <- dfAccuracyTechniquesTraining
#View(dfAccuracyTechniquesTrainingNew)

# exclui as linhas que tem o valor NA
dfAccuracyTechniquesTrainingNew <- na.omit(dfAccuracyTechniquesTrainingNew)
#View(dfAccuracyTechniquesTrainingNew)

#View(dfAccuracyTechniquesTrainingNew)

haveLines <- 0 

for (m in method){ 
  
  for (a in sample){
    
    for (s in seed){
      
      # pegando só as rows que tem a coluna Amostras igual a "a", a coluna semente igual a "s", e a coluna metodo igual a "m"
      rows <- (dfAccuracyTechniquesTrainingNew$Amostras == a)&(dfAccuracyTechniquesTrainingNew$semente == s)&(dfAccuracyTechniquesTrainingNew$Metodo_divisao_Dados == m)
     
      # Pegando as linhas definidas na variavel "rows"
      dfSelectedSamples <- dfAccuracyTechniquesTrainingNew[rows,]
      
      if(nrow(dfSelectedSamples) != 0){
        
        # Se haveLines igual a 0, então será adicionado a primeira linha de informação em dfBetterAccuracyComparison e dfWorseAccuracyComparison
        if(haveLines == 0){
          dfBetterAccuracyComparison<- dfSelectedSamples[1,] 
          dfWorseAccuracyComparison <- dfSelectedSamples[7,] 
          haveLines <- 1
        
        # Se haveLines igual a 1, é adicionado as outras linhas usando rbin()
        }else{ 
          dfBetterAccuracyComparison <- rbind(dfBetterAccuracyComparison, dfSelectedSamples[1,]) 
          dfWorseAccuracyComparison <- rbind(dfWorseAccuracyComparison, dfSelectedSamples[7,]) 
        }
      }
    }
  }
}

# Concateanando caminho + nome do arquivo para salvar os resultados
fileDfBetterAccuracyComparison <- str_c(pathFileAnalysisResults,"dfBetterAccuracyComparison.csv")
fileDfWorseAccuracyComparison <- str_c(pathFileAnalysisResults,"dfWorseAccuracyComparison.csv")

# Chamando função para criar o arquivo com os resultados 
createFileCsv(fileDfBetterAccuracyComparison, dfBetterAccuracyComparison)
createFileCsv(fileDfWorseAccuracyComparison, dfWorseAccuracyComparison)

# Lendo os arquivos salvos
dfBetterAccuracyComparisonFileCsv <- read.csv(fileDfBetterAccuracyComparison,header=TRUE,encoding="UTF-8")
dfWorseAccuracyComparisonFileCsv <- read.csv(fileDfWorseAccuracyComparison,header=TRUE,encoding="UTF-8")

# Mostrandos os resultados salvos nos arquivos
View(dfBetterAccuracyComparisonFileCsv)
View(dfWorseAccuracyComparisonFileCsv)


# ***************************************************************************************************
# Verifica cada resultado de resultadoMatrizConfusaoEstatist.csv (dfPredictionConfusionMatrix) em 
# relação aos parâmetros "semente", "numero de amostras" e "metodo de divisao de treino", e mostra qual foi 
# a melhor técnica em cada um desses parâmetros
# ***************************************************************************************************

sample <- c(50, 100,1000,2000,3000,3168)
seed <- c(1234,123)
method <- c("createDP","sample-prob")


dfStatisticMatrixConfusionNew <- dfStatisticMatrixConfusion
View(dfStatisticMatrixConfusionNew)

# Seleciona as linhas do dataframe que tem  valor NA que separa os resultados no dataframe
deletedLinesNA <- c(8,16,24,32,40,48,56,64,72,80,88,96,104)

# Exclui as linhas do dataframe que são NA que separa os resultados
dfStatisticMatrixConfusionNew <- dfStatisticMatrixConfusionNew[-deletedLinesNA, ]

#View(dfStatisticMatrixConfusionNew)


haveLines <- 0 

for (m in method) { 
  
  for (a in sample) {
    
    for (s in seed) {
      
      # pegando só as rows que tem a coluna Amostras igual a "a", a coluna semente igual a "s", e a coluna metodo igual a "m"
      rows <- (dfStatisticMatrixConfusionNew$Amostras == a)&(dfStatisticMatrixConfusionNew$semente == s)&(dfStatisticMatrixConfusionNew$Metodo_divisao_Dados == m)
      
      # Pegando as linhas definidas na variavel "rows"
      dfSelectedSamplesMatConf <- dfStatisticMatrixConfusionNew[rows,]
      
      
      if(nrow(dfSelectedSamplesMatConf) != 0){
        
        # Se haveLines igual a 0, então será adicionado a primeira linha de informação em dfBetterAccuracyComparisonMatrixConfusion e dfWorseAccuracyComparisonMatrixConfusion
        if(haveLines == 0){
          dfBetterAccuracyComparisonMatrixConfusion <- dfSelectedSamplesMatConf[1,] 
          dfWorseAccuracyComparisonMatrixConfusion <- dfSelectedSamplesMatConf[7,] 
          haveLines <- 1
          
        # Se haveLines igual a 1, é adicionado as outras linhas usando rbin()  
        }else{
          dfBetterAccuracyComparisonMatrixConfusion <- rbind(dfBetterAccuracyComparisonMatrixConfusion, dfSelectedSamplesMatConf[1,]) 
          dfWorseAccuracyComparisonMatrixConfusion <- rbind(dfWorseAccuracyComparisonMatrixConfusion, dfSelectedSamplesMatConf[7,]) 
        }
      }
    }
  }
}

# Concateanando caminho + nome do arquivo para salvar os resultados
fileDfBetterAccuracyComparisonMatrixConfusion <- str_c(pathFileAnalysisResults,"dfBetterAccuracyComparisonMatrixConfusion.csv")
fileDfWorseAccuracyComparisonMatrixConfusion <- str_c(pathFileAnalysisResults,"dfWorseAccuracyComparisonMatrixConfusion.csv")

# Chamando função para criar o arquivo .csv com os resultados 
createFileCsv(fileDfBetterAccuracyComparisonMatrixConfusion, dfBetterAccuracyComparisonMatrixConfusion)
createFileCsv(fileDfWorseAccuracyComparisonMatrixConfusion, dfWorseAccuracyComparisonMatrixConfusion)

# Lendo os arquivos salvos
dfBetterAccuracyComparisonMatrixConfusionFileCsv <- read.csv(fileDfBetterAccuracyComparisonMatrixConfusion,header=TRUE,encoding="UTF-8")
dfWorseAccuracyComparisonMatrixConfusionFileCsv <- read.csv(fileDfWorseAccuracyComparisonMatrixConfusion,header=TRUE,encoding="UTF-8")

# Mostrandos os resultados salvos nos arquivos .csv
View(dfBetterAccuracyComparisonMatrixConfusionFileCsv)
View(dfWorseAccuracyComparisonMatrixConfusionFileCsv)



#dfBetterAccuracyComparisonMatrixConfusion <- dfBetterAccuracyComparisonMatrixConfusion[order(dfBetterAccuracyComparisonMatrixConfusion$Accuracy, decreasing=TRUE),]
#dfWorseAccuracyComparisonMatrixConfusion <- dfWorseAccuracyComparisonMatrixConfusion[order(dfWorseAccuracyComparisonMatrixConfusion$Accuracy, decreasing=TRUE),]



