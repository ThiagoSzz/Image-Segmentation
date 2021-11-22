path = 'C:\Users\User\Desktop\TrabalhoFPI\k-Means Segmentation\';
imagesPath = {append(path, 'placa-br.jpg'), append(path, 'mcdonalds.jpg')};

for i=1:length(imagesPath)
    
    fprintf('\nProcess for image %d initialized.\n', i);
    
    image = double(imread(imagesPath{i})); % imagem para segmentar

    k = 32; % numero de segmentos k-means
    [clusteredImg, labeledImg, codebook] = clusterImage(image, k);
    eachClusterImg = eachCluster(labeledImg, codebook);
    
    fprintf('Image %d segmented successfully.\n', i);

    sumOfImages = eachClusterImg{1};
    
    figure();
        for j = 2:k
            sumOfImages = sumOfImages + eachClusterImg{j};
            imshow(sumOfImages);
        end
    
    fprintf('Image %d printed successfully.\n', i);
end