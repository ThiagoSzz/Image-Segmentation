path = 'C:\Users\User\Desktop\TrabalhoFPI\k-Means Segmentation\';
imagesPath = {append(path, 'carros.png'), append(path, 'mcdonalds.jpg')};

for i=1:length(imagesPath)
    
    fprintf('\nProcess for image %d initialized.\n', i);
    
    image = double(imread(imagesPath{i})); % imagem para segmentar

    k = 32; % numero de segmentos k-means
    [clusteredImg, labeledImg, codebook] = clusterImage(image, k);
    eachClusterImg = eachCluster(labeledImg, codebook);
    
    fprintf('Image %d segmented successfully.\n', i);

    
    figure();
        for j = 1:k
            if(j == 1)
                sumOfImages = eachClusterImg{j};
            else
                sumOfImages = sumOfImages + eachClusterImg{j};
            end
            
            imshow(sumOfImages);
            
%             imageName = append(path, 'sumOfImages\imagem', num2str(i), '-', num2str(j), '.png');
%             imwrite(sumOfImages, imageName);
%             
%             imageName = append(path, 'segments\segment', num2str(i), '-', num2str(j), '.png');
%             imwrite(eachClusterImg{j}, imageName);
        end
    
    fprintf('Image %d printed successfully.\n', i);
end