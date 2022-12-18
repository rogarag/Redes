clc;
clear all;


lines = readlines("texto_bin.txt");

[m,n]= size(lines);


% este for convierte los elementos string a elemenots Char
for i=1:m
x = lines(i,1);
x = convertStringsToChars(x);
b(i,:)=x;
x =0;
end

%%
%Ya teniendo la matriz char se procede a agregar las flags
[m,~] =size (b);
flag =  '01110';


z = b(1,:);
hdlc1 = [flag z];
hdlc1 = [hdlc1 flag ];

 for j=2:m

   z = b(j,:)
   hdlc1 = [hdlc1 z];
   hdlc1 = [hdlc1 flag];


 end

 hdlc1
[m,n]  =size(hdlc1) ;
%% Procederemos a meter el cero a la trama
contador = 0;



for i=1:n

    x=0;
if hdlc1(1,i)=='1'
    contador = contador +1; 
elseif hdlc1(1,i)=='0'
    contador =0;
end

if contador==5

valor = '0';
posicion =i+1;
hdlc1 = [hdlc1(1:posicion-1),valor,hdlc1(posicion:end)]
contador =0;
end

end










