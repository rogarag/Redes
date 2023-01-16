clc;
clear all;

%%  Se lee el archivo

lines = readlines("texto_bin.txt");
[m,n]= size(lines);


%% este for convierte los elementos string a elemenots Char
% for i=1:m
% x = lines(i,1);
% x = convertStringsToChars(x);
% b(i,:)=x;
% x =0;
% end


%% Procederemos a meter el cero a la trama (experimental)
contador = 0;
for i=1:m

    x = lines(i,:);
    x = convertStringsToChars(x);
  
    [~,n]=size(x);
    for j=1:n
        
        if x(1,j)=='1'
            contador = contador +1; 
        elseif x(1,j)=='0'
            contador =0;
        end
    
            if contador==5
            valor = '0';
            x = [x(1:j),valor,x(j+1:end)];
            contador =0;
            end
    end
     y = convertCharsToStrings(x);
     z(i,1)=y;%es la mtriz final
end

%% Agregar las flags de las tramas

flag =  string('01110');
[m,n] =size(z);
hdlc_cod= [flag z(1,1)];
hdlc_cod = [hdlc_cod flag];

for j =2:m

   hdlc_cod = [hdlc_cod z(j,1) ];
   hdlc_cod=  [hdlc_cod flag];
end

hdlc_cod

z = hdlcDecod(hdlc_cod) 











