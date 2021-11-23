path = 'C:\Users\User\Desktop\TrabalhoFPI\Threshold Segmentation\';
imagesPath = {append(path, 'carros.png'), append(path, 'mcdonalds.jpg')};

for i=1:length(imagesPath)
    
    fprintf('\nProcess for image %d initialized.\n', i);
    
    image = imread(imagesPath{i});
    limiarizationNumber = 20;

    quantized = quantizeImage(image, limiarizationNumber);
    
    fprintf('Image %d segmented successfully.\n', i);

    mask = {};
    maskedImage = zeros(size(image,1), size(image,2));
    sumOfImages = zeros(size(image,1), size(image,2));
    image = double(image)/255;
    
    figure();
        for j=1:limiarizationNumber
            mask = buildMask(quantized, j);

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