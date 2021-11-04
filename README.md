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
#### Instalando o R
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
#### Instalando r-base-dev
```bash
sudo apt install r-base-dev
```

#### Instalando pacotes não-R requeridos pela biblioteca Tidyverse
```bash
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev
```

#### Instalando RStudio
Baixar o **.deb** pelo link: [https://www.rstudio.com/products/rstudio/download/#download](https://www.rstudio.com/products/rstudio/download/#download) e instalar pelo modo gráfico

### No Windows
#### Instalando o R
Ir nesse link [https://cran.fiocruz.br/](https://cran.fiocruz.br/) e clicar no link **Download R for Windows**, esperar baixar o executável e então iniciar a instalação pelo modo gráfico.

#### Instalando o Rtools
Ir nesse link [https://cran.r-project.org/bin/windows/Rtools/](https://cran.r-project.org/bin/windows/Rtools/) e clicar no link **rtools40v2-x86_64.exe**, esperar baixar o executável e então iniciar a instalação pelo modo gráfico.

#### Instalando o RStudio
Baixar o **.exe** pelo link: [RStudio - Download](https://www.rstudio.com/products/rstudio/download/#download) e instalar pelo modo gráfico

## 💻 Executando a aplicação

### :octocat: Clonando o Repositório

```bash
$ git clone https://github.com/marioandre01/machineLearningTechniquesForVoiceRecognitionByGender_R.git

# entre na pasta do projeto
$ cd machineLearningTechniquesForVoiceRecognitionByGender_R
```
### 💻 Executando o script

Abra o programa **RStudio** e selecione o script **machineLearningTechniquesForVoiceRecognitionByGender.R**

Com ele aberto vá na janela onde está o script e clique nela e aperte **Ctrl + A** para selecionar todo o código e em seguida aperte **Ctrl + ENTER** para o código ser executado. Aguarde a execução terminar para ver os resultados da análise.

O código foi desenvolvido para funcionar da seguinte maneira: Em uma parte do código com o comentário **"# Definindo configuração para o treinamento - (seed, numberOfLines, dataDivisionMethod)"**, deve-se definir vetores com três informações **seed, numberOfLines e dataDivisionMethod**. Com os vetores definidos, deve-se inseri-los em uma lista, e então passar essa lista para a estrutura de repetição **For** para iniciar a análise de aprendizado de máquina das técnicas selecionadas. Com a lista possuindo um vetor, isso significa que será feita uma análise com as informações passadas. Com a lista possuindo dois ou mais vetores, então será feito a análise de aprendizado de máquina ao número correspondente de vetores passado na lista.

A variável **seed** é usada para definir uma semente para poder se reproduzir uma análise de treino por outra pessoa. 

A variável **numberOfLines** é usada para se escolher o número de amostras usadas para a análise. Para se escolher usar todas as amostras do **dataset**, foi determinado colocar o valor **"all"**. Caso se queira usar um valor de amostras menor que o do **dataset**, deve-se colocar um valor menor que esse. Isto é, o dataset usado para análise tem **3168** amostras, caso se queira usar todas, colocar o valor **"all"**, caso se queira menos que isso, colocar um valor menor, por exemplo 2000. 

A variável **dataDivisionMethod** é usada para escolher o método usado para dividir os dados de treino e os dados de teste. Foi determinado dois métodos, sendo eles **"createDP"** e **"sample-prob"**. O valor **"createDP"** define que a divisão será feita usando a função **createDataPartition()** da biblioteca **caret**. Já o valor **"sample-prob"** determina que a divisão será feita usando a função **sample()** nativa do R. O método escolhido para a análise é o **"createDP"** pois divide os dados de treino e teste igualmente. A opção **sample()** foi inserida pois ela foi usada nos testes iniciais para a divisão das amostras, mas ela não divide igualmente os dados para os dados de treino e teste, e com isso esse método foi colocado para ver se o resultado das análises de aprendizado de máquina das técnicas escolhidas resultava em valores diferentes.

Por configuração padrão no código, a análise de aprendizado de máquina feito para as técnicas selecionadas, será feita com a configuração **seed=123, numberOfLines="all" e dataDivisionMethod="createDP"**. Com isso só se tem um vetor na lista, e assim só uma análise será feita.

Os resultados serão salvos na pasta **trainingResults**.

Para ver os resultados depois que já se tenha feito uma análise, usar o arquivo **viewResultsMachineLearningTechniquesForVoiceRecognitionByGender.R**. Os resultados serão mostrados no RStudio.

**OBS:**
Depois que foi feita a primeira análise de aprendizado de máquina seguindo os passos de ir na janela onde está o script e clicar nela e apertar **Ctrl + A** para selecionar todo o código e em seguida apertar **Ctrl + ENTER** para o código ser executado. Caso se deseje fazer outras análise, alterando os valores dos vetores que serão colocados na lista, é necessário iniciar a execução do código não mais selecionando todo o código, mas sim a partir do trecho de código que tem o comentário **"# Definindo configurações para o treinamento - (seed, numberOfLines, dataDivisionMethod)"**. A execução deve-se ser realizada a partir desse ponto, pois acima desse ponto já foi configurado a pastas onde será lido o dataset, e onde será salvo os resultados da análise. Dessa forma, caso se selecione novamente o código todo para ser executado, o caminhos das pastas serão alterados, resultando em erro na execução.


## :gear: Contribuição

Para contribuir com esse projeto faça os seguintes passos:

- Faça um fork desse repositório;
- Crie uma branch com a sua feature: `git checkout -b minha-feature`;
- Faça commit das suas alterações: `git commit -m 'feat: Minha nova feature'`;
- Faça push para a sua branch: `git push origin minha-feature`.

## :memo: Licença

Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](./LICENSE.md) para mais detalhes.




