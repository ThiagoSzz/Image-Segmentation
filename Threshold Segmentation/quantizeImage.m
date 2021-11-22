
function quantized = quantizeImage(image, n)

    image = rgb2hsv(image);

    threshVector = multithresh(image(:,:,3), n);

    quantized = imquantize(image(:,:,3), threshVector);
end