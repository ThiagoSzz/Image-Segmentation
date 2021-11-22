
function quantized = quantizeImage(image, n)

    img = rgb2hsv(image);

    threshVector = multithresh(img(:,:,3), n);

    quantized = imquantize(img(:,:,3), threshVector);
end