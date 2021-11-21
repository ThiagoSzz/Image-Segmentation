function only = onlyClusterI(labeledImg,codebook,i)
newCodebook = remap(codebook,i);
only = label2rgb(labeledImg, newCodebook);%mapeia pixel do segmento 1 para sua cor, e o resto para 0
end