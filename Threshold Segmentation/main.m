path = 'C:\Users\User\Desktop\TrabalhoFPI\k-Means Segmentation\';
imagesPath = {append(path, 'placa-br.jpg'), append(path, 'mcdonalds.jpg')};

for i=1:length(imagesPath)
    
    fprintf('\nProcess for image %d initialized.\n', i);
    
    image = imread(imagesPath{i});
    limiarizationNumber = 20;

    image = rgb2hsv(image);
    threshVector = multithresh(image(:,:,3), limiarizationNumber);
    quantized = imquantize(image(:,:,3), threshVector);
    image = hsv2rgb(image);
    
    fprintf('Image %d segmented successfully.\n', i);

    mask = {};
    sumOfImages = zeros(size(quantized));
    
    figure();
        for j=1:limiarizationNumber+1
            mask{j} = buildMask(quantized, j);

            maskedImage = image.*mask{j};
            sumOfImages = maskedImage + sumOfImages;

            imshow(sumOfImages);
        end
    
    fprintf('Image %d printed successfully.\n', i);
end