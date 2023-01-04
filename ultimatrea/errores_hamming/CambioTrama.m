function [matrizfila,matrizcolumna, matrizCambioTrama]= CambioTrama()
lines = readlines("datosTrama.txt");
[m,~]= size(lines);

m=m-1;

%% convertir a char todas las filas
for i=1:m

    aux = lines(i,:);
    aux2 = convertStringsToChars(aux);
    matrizStr_char(i,:) =  aux2(1,:);

end

aux =0;
aux2=0;

[m,n]= size(matrizStr_char);

%% Cuantas dfilas y tamas se cambiarán de forma aleatoria

for i=1:10  % Se cambiaran un numero 2 de celdas

    fila = randi([1,m]);
    matrizfila(i,1) = fila;
    columna = randi([1,n]);
    matrizcolumna(i,1)=columna;
    x = matrizStr_char(fila,columna);

    if x == '1'

        matrizStr_char(fila,columna)='0';

    else


        matrizStr_char(fila,columna)='1';
    end

end

[m,~] = size(matrizStr_char);
for i=1:m
    
    x=matrizStr_char(m,:);
    y = convertCharsToStrings(x);
    matrizCambioTrama(i,:) = y;

end



end

% dato2Chars=convertStringsToChars(datos);
% [~,n] =size(dato2Chars);
% fila=randi([1,7])
% 
% if dato2Chars([1,fila])== '0'
% 
%     dato2Chars(1,fila)='1';
% 
% else
% 
%     dato2Chars(1,fila)='0';
% 
% end
% 
% datos1=dato2Chars;
% end