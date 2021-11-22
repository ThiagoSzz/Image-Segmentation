image = imread('C:\Users\User\Desktop\TrabalhoFPI\Threshold Segmentation\mcdonalds.jpg');

n = 20;

image = rgb2hsv(image);

threshVector = multithresh(image(:,:,3), n);

quantized = imquantize(image(:,:,3), threshVector);

image = hsv2rgb(image);

mask = {};

sumOfImages = zeros(size(quantized));
for i=1:n+1
    mask{i} = buildMask(quantPlane, i);
    
    maskedImage = image.*mask{i};
    sumOfImages = maskedImage + sumOfImages;
    
    imshow(sumOfImages);
end