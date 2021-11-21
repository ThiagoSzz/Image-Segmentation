
function [clustered, m, n] = clusterImage(image, k)

    redChannel = double(image(:,:,1));
    greenChannel = double(image(:,:,2));
    blueChannel = double(image(:,:,3));

    channels = [redChannel(:), greenChannel(:), blueChannel(:)];

    [m, n] = kmeans(channels, k);

    m = reshape(m, size(image,1), size(image,2));
    n = n/255;

    clustered = label2rgb(m, n);
end