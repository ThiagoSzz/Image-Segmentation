% caminho da pasta aonde estão localizadas as imagens
% modifique aqui
path = 'C:\Users\User\Desktop\TrabalhoFPI\Threshold Segmentation\images\';

% nomes dos arquivos das imagens utilizadas
imagesPath = {append(path, 'carros.png'), append(path, 'mcdonalds.jpg')};

% iteração sobre as imagens da lista
for i=1:length(imagesPath)
    
    fprintf('\nProcess for image %d initialized.\n', i);
    
    % imagem lida
    image = imread(imagesPath{i});
    
    % número de n-regiões (ou seja, (n-1)-valores de limiar)
    numberOfRegions = 20;

    % realiza a conversão, quantização e segmentação da imagem
    quantized = quantizeImage(image, numberOfRegions);
    
    fprintf('Image %d segmented successfully.\n', i);

    % inicializa variáveis úteis a mostragem
    mask = {};
    maskedImage = zeros(size(image,1), size(image,2));
    sumOfImages = zeros(size(image,1), size(image,2));
    image = double(image)/255;
    
    % realiza a mostragem dos segmentos por meio da
    % criação de uma máscara com os valores de intensidade segmentados
    % e da multiplicação destes com a imagem original
    
    % após isso, o resultado desta operação
    % é somado a uma imagem totalmente preta
    figure();
        for j=1:numberOfRegions
            mask = buildMask(quantized, j);

            % aplica-se a máscara em cada um dos canais da imagem
            maskedImage(:,:,1) = image(:,:,1).*mask;
            maskedImage(:,:,2) = image(:,:,2).*mask;
            maskedImage(:,:,3) = image(:,:,3).*mask;
        
            sumOfImages = maskedImage + sumOfImages;

            imshow(sumOfImages);
            
%             imageName = append(path, 'sumOfImages\imagem', num2str(i), '-', num2str(j), '.png');
%             imwrite(sumOfImages, imageName);
%             
%             imageName = append(path, 'segments\segment', num2str(i), '-', num2str(j), '.png');
%             imwrite(maskedImage, imageName);
        end
    
    fprintf('Image %d printed successfully.\n', i);
end

fprintf('\nThreshold segmentation done!\n');