function clusters = eachCluster(labeledImg,codebook)
numClusters = size(codebook,1);
clusters = cell(numClusters);
for i = 1:numClusters
    clusters{i} = onlyClusterI(labeledImg,codebook,i);
end
end