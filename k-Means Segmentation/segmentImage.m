
function sumOfSegments = segmentImage(clustered, k)
    
    kmeansTI = rgb2lab(clustered);

    ab = double(kmeansTI(:,:,2:3));
    dy = size(ab, 1);
    dx = size(ab, 2);
    ab = reshape(ab, dy*dx, 2);

    [clusterX, ~] = kmeans(ab, k);

    pixelLabels = reshape(clusterX, dy, dx);

    segmented = cell(1, 3);
    rgbLabel = repmat(pixelLabels, [1 1 3]);

    for i=1:k
        color = clustered;
        color(rgbLabel~=i) = 0;
        segmented{i} = color;
    end
    
    sumOfSegments = segmented{1};
    for i=2:k
        sumOfSegments = imadd(segmented{i}, sumOfSegments);
    end
end