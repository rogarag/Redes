%%%% convertir un string a binario
clear;
clc;
lines = readlines("texto_bin.txt");
[m,n]= size(lines);

for i=1:m
     x = lines(i,:);
     %y = convertStringsToChars(x);
     y = str2double(x)
     [~,n] =size(y);

     for j=1:n
         y(i,j)  
         z
     end
    

end
%X = str2num(lines);