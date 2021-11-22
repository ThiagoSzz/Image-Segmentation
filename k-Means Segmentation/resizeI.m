function resized = resizeI(image)
    redChannel = double(image(:,:,1));
    greenChannel = double(image(:,:,2));
    blueChannel = double(image(:,:,3));
    resized = [redChannel(:), greenChannel(:), blueChannel(:)];
end