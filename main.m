clear variables

% imagesPath = {'C:\Users\User\Desktop\TrabalhoFPI\temp-display.jpg', 'kobi.png'};
% nColors = {4, 3};

imagesPath = {'C:\Users\User\Desktop\TrabalhoFPI\nature.jpg'};
k = {16};

for j=1:length(imagesPath)
    image = imread(imagesPath{j});
    
    [clustered, m, n] = clusterImage(image, k{j});

    kmeansTI = rgb2lab(clustered);

    ab = double(kmeansTI(:,:,2:3));
    dy = size(ab, 1);
    dx = size(ab, 2);
    ab = reshape(ab, dy*dx, 2);

    [clusterX, clusterCenter] = kmeans(ab, k{j});

    pixelLabels = reshape(clusterX, dy, dx);

    segmented = cell(1, 3);
    rgbLabel = repmat(pixelLabels, [1 1 3]);

    for i=1:k{j}
        color = clustered;
        color(rgbLabel~=i) = 0;
        segmented{i} = color;
    end
    
    a = segmented{1};
    for i=2:k{j}
        a = imadd(segmented{i}, a);
    end
    
%     imshow(a);
end