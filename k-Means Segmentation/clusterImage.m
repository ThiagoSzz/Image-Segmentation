
function [clustered, labeled, indexVector] = clusterImage(image, k)

    pixelVector = resizeI(image);%tranforma a imagem em um vetor de pixels

    [pixelVector, indexVector] = kmeans(pixelVector, k,'Distance','sqeuclidean','MaxIter',500,'Start','sample');%Aplica o algoritmo k-means no vetor de pixels com a métrica escolhida

    indexVector = indexVector/255;%normaliza os vetores de cada indice
    
    labeled = reshape(pixelVector, size(image,1), size(image,2));%tranforma o vetor em uma matriz de pixels

    clustered = label2rgb(labeled, indexVector);%mapeia cada indice para sua cor correspondente
end