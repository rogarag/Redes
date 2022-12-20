
clc;
clear;

lines = readlines("texto_bin.txt");
[m,n]= size(lines);

%% Cambiar caracteres a numeros
for i =1:m
    x = lines(i,1)
    x = convertStringsToChars(x);
    [~,n]= size(x);
    for j=1:n
        y=x(1,j);
        z = double(y);
        matriz_num(i,j)=z;
    end

end
n=0;
m=0;
%% se convierten los valores a binario
[m,n]= size(matriz_num);
for i =1:m
   
    for j=1:n
        y=matriz_num(i,j);
        z = dec2bin(y);
        z1 =convertCharsToStrings(z);
        matriz_bin(i,j)=z1;
    end

end
