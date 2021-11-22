
function imageBorder = getBorderByMethod(image, method, limiarValue)

    grayScaledImage = rgb2gray(imresize(image,[256 256]));
    
    robertsMatrix = {fliplr([1 0 0; 0 -1 0; 0 0 0]), [0 1 0; -1 0 0; 0 0 0]};
    prewittMatrix = {fliplr([1 0 -1; 1 0 -1; 1 0 -1]), [-1 -1 -1; 0 0 0; 1 1 1]};
    sobelMatrix = {fliplr([-1 -2 -1; 0 0 0; 1 2 1]), [-1 0 1; -2 0 2; -1 0 1]};
    
    if(strcmp(method, 'roberts'))
        chosenMethod = robertsMatrix;
    elseif(strcmp(method, 'prewitt'))
        chosenMethod = prewittMatrix;
    elseif(strcmp(method, 'sobel'))
        chosenMethod = sobelMatrix;
    end
    
    hor = chosenMethod{1};  
    ver = chosenMethod{2};
    
    cX = zeros(size(grayScaledImage,1), size(grayScaledImage,2));
    cY = zeros(size(grayScaledImage,1), size(grayScaledImage,2));
    c = zeros(size(grayScaledImage,1), size(grayScaledImage,2));
    imageBorder = zeros(size(grayScaledImage,1), size(grayScaledImage,2));
    
    % cX = horizontal e cY = vertical
    for i=2:size(grayScaledImage,1)-1
        for j=2:size(grayScaledImage,2)-1
            cX(i,j) = (abs(hor(1,1) * double(grayScaledImage(i-1,j-1)) + hor(1,2) * double(grayScaledImage(i-1,j)) + hor(1,3) * double(grayScaledImage(i-1,j+1)) + hor(2,1) * double(grayScaledImage(i,j-1)) + hor(2,2) * double(grayScaledImage(i,j)) + hor(2,3) * double(grayScaledImage(i,j+1)) + hor(3,1) * double(grayScaledImage(i+1,j-1)) + hor(3,2) * double(grayScaledImage(i+1,j)) + hor(3,3) * double(grayScaledImage(i+1,j+1))));
            cY(i,j) = (abs(ver(1,1) * double(grayScaledImage(i-1,j-1)) + ver(1,2) * double(grayScaledImage(i-1,j)) + ver(1,3) * double(grayScaledImage(i-1,j+1)) + ver(2,1) * double(grayScaledImage(i,j-1)) + ver(2,2) * double(grayScaledImage(i,j)) + ver(2,3) * double(grayScaledImage(i,j+1)) + ver(3,1) * double(grayScaledImage(i+1,j-1)) + ver(3,2) * double(grayScaledImage(i+1,j)) + ver(3,3) * double(grayScaledImage(i+1,j+1))));
            c(i,j) = (abs((double(cX(i,j)) + (double(cY(i,j))))));
            
            if(c(i,j) > limiarValue)
                imageBorder(i,j) = (1);
            else
                imageBorder(i,j) = (0);
            end
        end
    end
end