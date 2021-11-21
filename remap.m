function ni = remap(n,i)
%Altera a tabela cores
%Apenas a cor de indice i fica na tabela
%Serve para printar apenas o segmento i da imagem
[x,y] = size(n);
ni = zeros(x,y);
ni(i,1) = n(i,1);
ni(i,2) = n(i,2);
ni(i,3) = n(i,3);

end