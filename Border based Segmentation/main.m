
path = 'C:\Users\User\Desktop\TrabalhoFPI\Border based Segmentation\';
imagePath = {append(path, 'mcdonalds.jpg'), append(path, 'placa-br.jpg'), append(path, 'temp-display.jpg')};

methods = {'roberts', 'prewitt', 'sobel'};
limiars = {50, 150, 200};

for i=1:length(imagePath)
    
    image = imread(imagePath{i});
    
    figure('WindowState','maximized');
    for j=1:length(methods)
        imageBorder = getBorderByMethod(image, methods{j}, limiars{j});
        
        subplot(1, length(methods), j);
        imshow(imageBorder);
        title(['Method: ', methods{j}]);
    end
end







