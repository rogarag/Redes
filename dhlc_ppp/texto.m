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

hdlc1
 for j=2:m

   z = b(j,:)
   hdlc1 = [hdlc1 z];
   hdlc1 = [hdlc1 flag];

   hdlc1
 end

 hdlc1 
[m,n]  =size(hdlc1) ;
%% Procederemos a meter el cero a la trama


for i=1:n

if hdlc(1:n)==1
    
end
end

%[hdlc1, aux1] = hdlc(b)









