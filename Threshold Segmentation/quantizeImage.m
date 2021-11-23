
function quantized = quantizeImage(image, n)

    img = rgb2hsv(image);
    img = double(img);

    threshVector = multithresh(img(:,:,3), n-1);

    quantized = imquantize(img(:,:,3), threshVector);
end