
clc;
clear;

lines = readlines("texto_bin.txt");
[m,n]= size(lines);
valor_cero = '0';
%% Cambiar caracteres a numeros
for i =1:m
    x = lines(i,1);
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

%% se agregan ceros para cmpletar los 7 binarios
[m,n]=size(matriz_bin);
contador = 0;
for i=1:m

   for j=1:n
        q =  matriz_bin(i,j);
        q1= convertStringsToChars(q)
        [m1,n1]=size(q1)
            if n1 < 7
            
                q1 = ['0',q1(1:end)];
                
            end
         q1 = convertCharsToStrings(q1);
         w(i,j) =q1;
   end
   
end
%% Se crean un vector de m x 1

[m,n] = size(w);

for i=1:m
    
    b = w (i,:);
    
    b1 = strcat(b(1),b(2));
    j=3;
    while j<=n
       b1 = strcat(b1,b(j));
       j = j+1;
    end
matrizb(i,1) = b1;
end

%% Agregar las flags de las tramas

flag =  string('@');
[m,n] =size(matrizb);
matrizFlag= [flag matrizb(1,1)];
matrizFlag = [matrizFlag flag];

for j =2:m

   matrizFlag = [matrizFlag matrizb(j,1) ];
   matrizFlag=  [matrizFlag flag];
end

matrizFlag;
qwer =0;

%% Procederemos a meter el cero a la trama (experimental)
contador = 0;

    x = matrizFlag(1,:);
    [~,n]=size(x);


    for j=1:n
        d = convertStringsToChars(x(1,j))
        [~,f]= size(d)

        for i=1:f
              
                if d(i)=='1'
                    contador = contador +1; 
                elseif d(i)=='0' | d(i)=='@'
                    contador =0;
                end
            
                    if contador==5
                    valor = '@';
                    d = [d(1:i),valor,d(i+1:end)];
                    contador =0;
                    end
        end
         y = convertCharsToStrings(d);
        hdlc_cod(1,j)=y;%es la mtriz final
    end
    

[matrizDec,var, matrizChar] = hdlcDecod(hdlc_cod);


