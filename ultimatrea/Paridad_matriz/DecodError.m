%esta función decodifica la trama matriz paridad 23esta función decodifica la trama matriz paridad

function [cero1DecodError,matrizParidadAbajoDecodError, matrizaError,matrizParidadDecodError] = DecodError(x)

lines = readlines("Trama_CodError.txt");
vector=lines(1,:);% devido a que en el archivo nos mete un renglon de más, solo ocuparemos i-1
%Se quita el ultimo valor 
vector= convertStringsToChars(vector);
[~,n] = size(vector);

cero1DecodError = vector(1,n);
vector(n) = [];

[~,n] = size(vector);

inicio= n-(x-1);
matrizParidadAbajoDecodError = vector(inicio:n);
vector(inicio:n) =[];

%%%%%Quitar las flags entre tramas%%%%

vectorChar = vector;
[m,n]= size(vectorChar);

contador=0;
contador1=1;
contadorColum=0;

for i=1:n
qre=0;
    contador =contador +1;
    vectorChar(1,i);

    if vectorChar(1,i)=='@'|| vectorChar(1,i)=="%"
        contadorColum = contadorColum + 1;

        matrizParidadDecodError(contadorColum,1) = vectorChar(1,i);

        contador = contador - 1;
        aux=vectorChar(contador1:contador);

        matrizaError(contadorColum,:) = aux;
        contador1 = contador +2;
        contador = contador + 1;

    end
end

%Se parten en 7 para poder acomodar 7 bits en cad casilla

[m,n] = size(matrizaError);
contador0 =0;
for i=1:m
F = matrizaError(i,:);
    [~,n] = size(F);
    x1= n/7;
    y1=1;
    y2=0;
    for j=1:x1
       y1 = y2+1;
       y2 = 7*j;
       x2= F(y1:y2);
        matrizbError(i,j)=convertCharsToStrings(x2);% será la matiz de numeros binarios
    
    end
    
end

%Conversión de binario a decimal
[m,n] = size(matrizbError);
for i=1:m

    for j=1:n
        auxbd = matrizbError(i,j);
        auxDec=bin2dec(auxbd);
        matrizDec(i,j) = auxDec ;
    end

end

%Conversion de decimal a caracter
[m,n] = size(matrizDec);
for i=1:m
     
   
    for j=1:n
        auxdchar = matrizDec(i,j);
        auxChar=char(auxdchar);
        matrizCharDecDecodError(i,j) = auxChar ;
    end

end





% 
end

