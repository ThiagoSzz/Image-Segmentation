# Image Segmentation using Threshold and K-means Methods

## Sobre

Este projeto foi criado para estudar e implementar métodos de segmentação de imagens por meio de duas abordagens: segmentação por k-médias e segmentação por limiarização multivalorada.

Este projeto foi desenvolvido como trabalho final da disciplina de Fundamentos de Processamento de Imagens da CIC/UFRGS.

### Segmentação por k-médias

Neste método, a imagem é subdividida em k segmentos, onde cada segmento é um conjunto de pixels com cores semelhantes. O algoritmo utiliza a métrica de distância euclidiana das matrizes RGB de cada pixel para avaliar a semelhança entre as cores. A segmentação é realizada de forma a minimizar o erro de aproximação global dos pixels para a cor representante do segmento.

### Segmentação por limiarização multivalorada

Este método considera o brilho de cada pixel para dividi-los em segmentos. Inicialmente, a imagem é convertida do formato RGB para o formato HSV, utilizando apenas o canal V (Value/Brilho). Os valores de limiar ótimos são calculados para subdividir a imagem em regiões, e os pixels são atribuídos a níveis de intensidade correspondentes aos rótulos calculados.

## Resultados

1. Segmentação por limiarização multivalorada: Imagem Carros

![Threshold-carros](https://github.com/ThiagoSzz/Image-Segmentation/blob/main/gif-sumOfImages-image1-threshold.gif?raw=true)

2. Segmentação por limiarização multivalorada: Imagem McDonalds

![Threshold-mcdonalds](https://github.com/ThiagoSzz/Image-Segmentation/blob/main/gif-sumOfImages-image2-threshold.gif?raw=true)

3. Segmentação por k-médias: Imagem Carros

![Kmeans-carros](https://github.com/ThiagoSzz/Image-Segmentation/blob/main/gif-sumOfImages-imagem1-kmeans.gif?raw=true)

4. Segmentação por k-médias: Imagem McDonals

![Kmeans-mcdonalds](https://github.com/ThiagoSzz/Image-Segmentation/blob/main/gif-sumOfImages-imagem2-kmeans.gif?raw=true)

## Tecnologias

![Matlab](https://img.shields.io/badge/Matlab-%23D00000.svg?style=for-the-badge&logo=Plotly&logoColor=white)

## Créditos

- Thiago Haab
- João Zandoná
