function  [matrizTramaschangue, matris2] = Error1(tramasBinario)

tramas =1; % posteriormente se tiene que cambiar, son las cantidad de tramas a cambiar

% se incertan los errores
for i=1:tramas
    [m,n] = size(tramasBinario);
%      columnas= randi([1 n]); 
    columnas= 1;
%      filas = randi([1 m]);
    filas = 1;

    matrizTramaschangue(1,i)=filas; % esta matriz nos indicara en que parte se cambiaron
    matrizTramaschangue(2,i)=columnas;

    Bit = tramasBinario(filas,columnas);% se escoje la trama de la matriz
    Bit = convertStringsToChars(Bit);%convierte a carsacteres para mejor manejo
    [~,n] = size(Bit);
%     bitTrama=randi([1 n]); % se escoje el bit de la trama 
    bitTrama=2;
    Bit(bitTrama);

    if Bit(bitTrama) =='0'
        Bit(bitTrama) = '1';
    else
        Bit(bitTrama) = '0';
    end
    Bit= convertStringsToChars(Bit);
    tramasBinario(filas,columnas) = Bit; % se remplaza en la matriz de tramasbinario
    matrizTramaschangue(3,i)=bitTrama;
end
m=0;


% convertir a string
contador =0;
contador1 =0;
contador2 =0;
contador3 =0;
contadorfil=0;


[m,~]= size(tramasBinario);
for i=1:m
    [m,n]= size(tramasBinario);
    for k=1:n % es el for de las tramas
        contador3=0;
        aux3 = tramasBinario(i,k);
        aux3 = convertStringsToChars(aux3);
        [~,n]=size(aux3);
        x=1;
        for j=1:n


            contador2=contador2 + 1;
            contador3 =contador3 +1;% contador de todo el vector
            aux3(j);


            if contador2 == 7
                contadorfil=contadorfil+1;
                aux4 =aux3(x:contador3);
               
                contador2=0; % reinicia el conteo de los 7 

                aux5= bin2dec(aux4);% convierte de binario a dec
              
                matris1(i,contadorfil)= aux5; % la matriz con los numeros, esta matriz se convertira a caracter abc
                x =contador3+1;
            end
        end

    end
    contadorfil=0;
    contador3 =0;

end

%conversion de numeros a char
[m,n]=size(matris1);

for i=1:m

        aux6 = matris1(i,:);
        matris2(i,:) = char(aux6);% convierte a unicode// Esta se regresa para crear un archivo comparandolo con el original y ver que si se metieron errores
end
m=0;

end