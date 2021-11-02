[![Author](https://img.shields.io/badge/author-marioandre01-61dafb?style=flat-square)](https://github.com/marioandre01)
[![Languages](https://img.shields.io/github/languages/count/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R?color=%2361dafb&style=flat-square)](#)
[![Stars](https://img.shields.io/github/stars/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R?color=61dafb&style=flat-square)](https://github.com/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R/stargazers)
[![Forks](https://img.shields.io/github/forks/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R?color=%2361dafb&style=flat-square)](https://github.com/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R/network/members)
[![Contributors](https://img.shields.io/github/contributors/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R?color=61dafb&style=flat-square)](https://github.com/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R/graphs/contributors)
[![Licence](https://img.shields.io/github/license/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R?color=%2361dafb&style=flat-square)](https://github.com/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R/blob/master/LICENCE.md)


<h1 align="center">
  <img alt="VoiceRecognitionByGender" title="VoiceRecognitionByGender" src="https://estatsite.com.br/wp-content/uploads/2020/07/cover.png" width="600px" />
  <br>
  machineLearningTechniquesForVoiceRecognitionByGender_R
</h1>

<p align="center"> 
  <a href="#-projeto">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <!-- <a href="#-layout">Layout</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; -->
  <a href="#-executando-a-aplicação">Executando a aplicação</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#gear-contribuição">Contribuição</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#memo-licença">Licença</a>
</p>

## 💻 Projeto

Este projeto está sendo desenvolvido para o trabalho de conclusão de curso (TCC) para o [Instituto Federal de Educação, Ciência e Tecnologia de Santa Catarina - Câmpus São José (IFSC-SJ)](https://www.ifsc.edu.br/web/campus-sao-jose). O tema do projeto foi definido como **Desempenho de técnicas de Aprendizado de Máquina em Reconhecimento de Voz para detecção de gênero**. Tendo como objetivo verificar o desempenho de 6 técnicas de aprendizado de máquina mais conhecidas e usadas no ramo de análise de dados, sendo elas **Redes Neurais Artificiais (RNA), Máquinas de vetores de suporte (SVM), Arvores de decisão (DT), Floresta aleatória (Random Forest), Naive Bayes e K-Vizinhos mais próximos (KNN)** para o reconhecimento de voz com foco na detecção de gênero (Feminino e Masculino). Para análise foi definido o dataset [Gender voice](https://www.apispreadsheets.com/datasets/119) adquirido no site **apispreadsheets.com**.

<!-- O resultado da aplicação pode ser acessado através da seguinte URL: 
[https://machineLearningTechniquesForVoiceRecognitionByGender_R.vercel.app/](https://machineLearningTechniquesForVoiceRecognitionByGender_R.vercel.app/) -->


## 📋 Tecnologias

O projeto foi desenvolvido com as seguintes tecnologias:

- [R](https://www.r-project.org/)
- [RStudio](https://www.rstudio.com/)
- [Tidyverse](https://www.tidyverse.org/)
- [Caret](https://topepo.github.io/caret/)
<!-- ## 🎨 Layout

### 💻 Web 

<p align="center">
  <img alt="Podcastr web" title="Podcastr web" src="public/podcastr-tela01.png" width="800px">
  <img alt="Podcastr web" title="Podcastr web" src="public/podcastr-tela02.png" width="800px">
  <img alt="Podcastr web" title="Podcastr web" src="public/podcastr-tela03.png" width="800px">
</p>
</p> -->

<!-- ### 📱 Mobile  -->
<!-- <p align="center">
  <img alt="Move.it mobile" title="Move.it mobile" src="img/onePiece_quiz_tela_mobile.png" width="250px">
</p> -->

## 💻 Instalando o R e o RStudio
### No Ubuntu
### Instalando o R
```bash
# update indices
sudo apt update -qq
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
# import the signing key (by Michael Rutter) for these repo
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

sudo apt update

sudo apt install --no-install-recommends r-base

# Verificar se o R foi instalado
R --version
```
### Instalando r-base-dev
```bash
sudo apt install r-base-dev
```

### Instalando pacotes não-R requeridos pela biblioteca Tidyverse
```bash
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev
```

### Instalando RStudio
Baixar o **.deb** pelo link: [https://www.rstudio.com/products/rstudio/download/#download](https://www.rstudio.com/products/rstudio/download/#download) e instalar pelo modo gráfico

### No Windows
### Instalando o R
Ir nesse link [https://cran.fiocruz.br/](https://cran.fiocruz.br/) e clicar no link **Download R for Windows**, esperar baixar o executável e então iniciar a instalação pelo modo gráfico.

### Instalando o Rtools
Ir nesse link [https://cran.r-project.org/bin/windows/Rtools/](https://cran.r-project.org/bin/windows/Rtools/) e clicar no link **rtools40v2-x86_64.exe**, esperar baixar o executável e então iniciar a instalação pelo modo gráfico.

### Instalando o RStudio
Baixar o **.exe** pelo link: [RStudio - Download](https://www.rstudio.com/products/rstudio/download/#download) e instalar pelo modo gráfico

## 💻 Executando a aplicação

### :octocat: Clonando o Repositório

```bash
$ git clone https://github.com/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R.git

# entre na pasta do projeto
$ cd machineLearningTechniquesForVoiceRecognitionByGender_R
```
### 💻 Executando o script

Abra o programa **R** e selecione o script **machineLearningTechniquesForVoiceRecognitionByGender.R**

Com ele aberto vá na janela onde está o script e clique nela e aperte **Ctrl + A** para selecionar todo o código e em seguida aperte **Ctrl + ENTER** para o código ser executado. Aguarde a execução terminar para ver os resultados da análise.

Os resultados serão salvos na pasta **trainingResults**

Para ver os resultados depois que ja se tenha feito o treino, usar o arquivo **viewResultsMachineLearningTechniquesForVoiceRecognitionByGender.R**


## :gear: Contribuição

Para contribuir com esse projeto faça os seguintes passos:

- Faça um fork desse repositório;
- Crie uma branch com a sua feature: `git checkout -b minha-feature`;
- Faça commit das suas alterações: `git commit -m 'feat: Minha nova feature'`;
- Faça push para a sua branch: `git push origin minha-feature`.

## :memo: Licença

Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](./LICENSE.md) para mais detalhes.




