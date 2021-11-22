clear variables

image = double(imread('C:\Users\User\Desktop\TrabalhoFPI\placa-br.jpg')); %imagem para segmentar

k = 32; %numero de segmentos k-means
[clusteredImg,labeledImg,codebook] = clusterImage(image,k);
eachClusterImg = eachCluster(labeledImg,codebook);
sum = eachClusterImg{1};
for i = 2:k
    sum = sum + eachClusterImg{i};
    pause(0.25);
    imshow(sum);
end