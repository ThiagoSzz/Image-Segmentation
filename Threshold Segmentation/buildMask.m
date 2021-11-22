
function mask = buildMask(labeledImage, segment)
    
    mask = zeros(size(labeledImage,1), size(labeledImage,2));
    
    for i=1:size(labeledImage,1)
        for j=1:size(labeledImage,2)
            
            if(labeledImage(i, j) == segment)
                mask(i, j) = 1;
            end
        end
    end
end