
# Install the released version from CRAN:
install.packages("stringr")

library(stringr) 


joinPathAndFilename  <- function(filePath, filename){
  
  return(str_c(filePath, filename))
}


# retorna um caminho de arquivo absoluto que representa o diretório de trabalho atual do processo R
# No windows o caminho padrão é "C:/Users/name_User/Documents"
getwd()

# Verifica o sistema operacional que o R está instalado, para definir as variaveis pathToSaveFile e o sistema operacional
if(.Platform$OS.type == "windows"){
  
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

# Definindo caminho do arquivo AccuracyOfTrainingDataTechniques.csv
filePathAccuracyOfTrainingDataTechniques <- joinPathAndFilename(pathToSaveFile, "accuracyOfTrainingDataTechniques.csv")
# Definindo o caminho a ser salvo o arquivo bestTechniqueAccuracyOfTrainingData.csv
filePathBestTechniqueAccuracyOfTrainingData <- joinPathAndFilename(pathToSaveFile, "bestTechniqueAccuracyOfTrainingData.csv")
# Definindo o caminho a ser salvo o arquivo confusionMatrixPredictionTechniques.csv
filePathTechniquePredictionConfusionMatrix <- joinPathAndFilename(pathToSaveFile, "confusionMatrixPredictionTechniques.csv")
# Definindo o caminho a ser salvo o arquivo accuracyAndOtherInformationTechniquesPrediction.csv
filePathAccuracyAndOtherInformationTechniquePrediction <- joinPathAndFilename(pathToSaveFile, "accuracyAndOtherInformationTechniquesPrediction.csv")
# Definindo o caminho a ser salvo o arquivo timeExecutionAnalysisTraining.csv
filePathTimeExecutionAnalysisTraining <- joinPathAndFilename(pathToSaveFile, "timeExecutionAnalysisTraining.csv")

# Ler arquivo AccuracyOfTrainingDataTechniques.csv
dfAccuracyOfTrainingDataTechniquesView <- read.csv(filePathAccuracyOfTrainingDataTechniques,header=TRUE,encoding="UTF-8")
# Lendo arquivo bestTechniqueAccuracyOfTrainingData.csv
dfBestTechniqueAccuracyOfTrainingDataView <- read.csv(filePathBestTechniqueAccuracyOfTrainingData,header=TRUE,encoding="UTF-8")
# Lendo confusionMatrixPredictionTechniques.csv
dfTechniquePredictionConfusionMatrixView <- read.csv(filePathTechniquePredictionConfusionMatrix,header=TRUE,encoding="UTF-8")
# Lendo accuracyHitsAndMissesTechnicalPrediction.csv
dfAccuracyAndOtherInformationTechniquePredictionView <- read.csv(filePathAccuracyAndOtherInformationTechniquePrediction,header=TRUE,encoding="UTF-8")
# Lendo timeExecutionAnalysisTraining.csv
dftimeExecutionAnalysisTrainingView <- read.csv(filePathTimeExecutionAnalysisTraining,header=TRUE,encoding="UTF-8")

# visualisa arquivo AccuracyOfTrainingDataTechniques.csv
View(dfAccuracyOfTrainingDataTechniquesView)
View(dfBestTechniqueAccuracyOfTrainingDataView)
View(dfTechniquePredictionConfusionMatrixView)
View(dfAccuracyAndOtherInformationTechniquePredictionView)
View(dftimeExecutionAnalysisTrainingView)


