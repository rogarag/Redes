function [matrizChar] = hdlcDecod(hdlc_cod)
% clear all;
% clc;
% hdlc_cod =["@"	"10010001001000110110111011111@000100110100111101111001100111010001000001000011111@010011001000101101110010111011111@1001101100100010000011100100100000100100011000011101111"	"@"	"10010001001000110110111011111@000100110100111101111001100111010001000001000011111@010011001000101101110010111011111@1001101100100010000011100100100000100100011000011101111"	"@"	"10010001001000110110111011111@000100110100111101111001100111010001000001000011111@010011001000101101110010111011111@1001101100100010000011100100100000100100011000011101111"	"@"];
% hdlc_cod

flag = string('@');
contador =0;
contador1 =0;
contador2 =0;
[m,n] = size(hdlc_cod);

%% quitar las flags del inicio y el final

hdlc_cod = [[],hdlc_cod(2:end)];
[m,n] = size(hdlc_cod);
hdlc_cod =[hdlc_cod(1:n-1),[]];
[m,n] = size(hdlc_cod);

%quita las las flags entre tramas
i=1; 
hdlc_cod
while i<n 
    hdlc_cod(1,i);
    if hdlc_cod(1,i) == flag
    hdlc_cod(i) = [];
    n =n-1;
    end
    i=i+1;

end

%% Eliminar los ceros

[~,n]= size(hdlc_cod);
for i=1:n

x = hdlc_cod(1,i);
x = convertStringsToChars(x);
[~,n]= size(x);
       j=1;
    while j<n % este for cuenta los caracteres
        x(j)
        if (x(1,j)=='1') 
             contador1=contador1+1;   
        elseif x(1,j) =='0'
            contador1 = 0;
        end
       if (contador1 == 5) && (x(1,j+1)==flag)
            x(j+1) = [];
            n =n-1;
            contador1 = 0;
       end
    j=j+1;
    end
    y = convertCharsToStrings(x);   
     z(i,1)=y;%es la mtriz final
  
qwer=0; 
end 
qwe=0
%% acoplar en 7 cada celda

[m,n] = size(z);
contador0 =0;
for i=1:m
F = convertStringsToChars(z(i,:));
    [~,n] = size(F);
    x1= n/7
    y1=1;
    y2=0
    for j=1:x1
       y1 = y2+1
       y2 = 7*j
       x2= F(y1:y2);
        var(i,j)=convertCharsToStrings(x2);% será la matiz de numeros binarios
    
    end
    
end

%% conversion de binario a decimal 

[m,n] = size(var)
for i=1:m

    for j=1:n
        auxbd = var(i,j);
        auxDec=bin2dec(auxbd);
        matrizDec(i,j) = auxDec 
    end

end

%% conversion de decimal a character

[m,n] = size(matrizDec)
for i=1:m
     
   
    for j=1:n
        auxdchar = matrizDec(i,j);
        auxChar=char(auxdchar);
        matrizChar(i,j) = auxChar ;
    end

end

end