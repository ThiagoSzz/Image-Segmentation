
function blurredImage = convImage(image, kernel)
    rChannel = imfilter(image(:,:,1), kernel, 'conv');
    gChannel = imfilter(image(:,:,2), kernel, 'conv');
    bChannel = imfilter(image(:,:,3), kernel, 'conv');
    
    blurredImage = cat(3, rChannel, gChannel, bChannel);
end

