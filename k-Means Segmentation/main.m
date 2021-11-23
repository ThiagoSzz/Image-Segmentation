% caminho da pasta aonde estão localizadas as imagens
% modifique aqui
path = 'C:\Users\User\Desktop\TrabalhoFPI\k-Means Segmentation\images\';

% nomes dos arquivos das imagens utilizadas
imagesPath = {append(path, 'carros.png'), append(path, 'mcdonalds.jpg')};

% iteração sobre as imagens da lista
for i=1:length(imagesPath)
    
    fprintf('\nProcess for image %d initialized.\n', i);
    
    % imagem lida e convertida para double
    image = double(imread(imagesPath{i}));

    % número de k-segmentos para segmentação
    k = 32;
    
    % executa o algoritmo de agrupamento
    [clusteredImg, labeledImg, codebook] = clusterImage(image, k);
    
    % coleta cada agrupamento em um vetor
    eachClusterImg = eachCluster(labeledImg, codebook);
    
    fprintf('Image %d segmented successfully.\n', i);

    % realiza a mostragem dos segmentos por meio da
    % soma destes a uma imagem totalmente preta
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

fprintf('\nK-means segmentation done!\n');