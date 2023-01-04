
%%Esta funcion lee el archivo "texto_bin" por cada fila del archivo y
%%selecciona un elemento aleatorio 
function Matriz7Ceros = LectorArchivo()
lines = readlines("texto_bin.txt");
[m,~]= size(lines);

%% convertir string a char, para poder leer unoxuno los caracteres 
for i=1:50

    aux = lines(i,:);
    aux2 = convertStringsToChars(aux);
    matrizStr_char(i,:) =  aux2(1,:);

end

aux =0;
aux2=0;

%% Se toman la diferentes elementos aleatorios para generar una nueva matriz. En este caso solo se selcciona un elemento por fila
[m,n]=size(matrizStr_char); %m=j*1
for i=1:m

    columnas= randi([1 n]);

    vectorAle(i,1) = matrizStr_char(i,columnas);


end

%% Se convierten a entero
[m,~]=size(vectorAle);
for i=1:m
    
    auxEnt(i,1) = double(vectorAle(i,1));
   
end

%% se convierten los valores a binario
[m,n]= size(auxEnt);
for i =1:m
   
    
        y=auxEnt(i,1);
        z = dec2bin(y);
        z1 =convertCharsToStrings(z);
        matriz_bin(i,1)=z1;
    

end
%% se agregan ceros para cmpletar los 7 binarios
[m,n]=size(matriz_bin);
contador = 0;
for i=1:m

   
        q =  matriz_bin(i,1);
        q1= convertStringsToChars(q);
        [m1,n1]=size(q1);
            if n1 < 7
            
                q1 = ['0',q1(1:end)];
                
            end
         q1 = convertCharsToStrings(q1);
         Matriz7Ceros(i,1) =q1;
   
   
end

end