clear variables
Image = imread('C:\Users\joaoz\Desktop\Aulas FPI\trabfpi\imagens\ferrari.jpg');%imagem para segmentar
Image = double(Image);
k = 32;%numero de segmentos k-means
[clusteredImg,labeledImg,codebook] = clusterImage(Image,k);
eachClusterImg = eachCluster(labeledImg,codebook);
sum = eachClusterImg{1};
for i = 2:k
    sum = sum + eachClusterImg{i};
    pause(0.25);
    imshow(sum);
end
    


