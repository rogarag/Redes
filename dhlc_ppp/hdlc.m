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
            x = [x(1:j),valor,x(j+1:end)]
            contador =0;
            end
    end
     y = convertCharsToStrings(x);
     z(i,1)=y;%es la mtriz final
end

%% Agregar las flags

flag =  string('01110')
[m,n] =size(z);
hdlc_cod= [flag z(1,1)];
hdlc_cod = [hdlc_cod flag];

for j =2:m

   hdlc_cod = [hdlc_cod z(j,1) ];
   hdlc_cod=  [hdlc_cod flag];
end

z = hdlcDecod(hdlc_cod )
T =table(z);
writetable(T,'text_bin_decod.txt');



%%
%Ya teniendo la matriz char se procede a agregar las flags (original 1)
% [m,~] =size (b);
% flag =  '01110';
% 
% 
% z = b(1,:);
% hdlc1 = [flag z];
% hdlc1 = [hdlc1 flag ];
% 
%  for j=2:m
% 
%    z = b(j,:)
%    hdlc1 = [hdlc1 z];
%    hdlc1 = [hdlc1 flag];
% 
% 
%  end
%  hdlc1

%% Procederemos a meter el cero a la trama (original 2)
% [m,n]  =size(hdlc1) ;
% contador = 0;
% for i=1:n
%     x=0;
%     if hdlc1(1,i)=='1'
%         contador = contador +1; 
%     elseif hdlc1(1,i)=='0'
%         contador =0;
%     end
% 
%     if contador==5
%     
%     valor = '0';
%     posicion =i+1;
%     hdlc1 = [hdlc1(1:posicion-1),valor,hdlc1(posicion:end)]
%     contador =0;
%     end
% 
% end










