 clc;
clear all;

%% variables
flag ='.';
esc='-';
esc2='--';
contador =0;

%% Se lee el el archivo txt 
lines = readlines("texto_char.txt");
[m,n]=size(lines);
f=0;

%% Se toman las condicionales para agregar las flags o los esc
q=0;
for i=1:m
    q=0;
x = lines(i,:);
x = convertStringsToChars(x);
n =0;
[~,n]=size(x);
    j=1;
    while j<=n
       
       x(1,j);
      
%       %estas seran las condiconales
%            
        if (j<n)&& (x(1,j)== esc) && (x(1,j+1)==flag)
            x = [x(1:j-1),esc2,x(j:end)];
            j=j+2;
        elseif (j<n)&& (x(1,j)== esc) && (x(1,j+1)==esc)
            x = [x(1:j-1),esc2,x(j:end)];
                j=j+2;
            
        elseif  (x(1,j)== flag) && (x(1,j-1)~= esc) %si en el texto existe una flag
            x = [x(1:j-1),esc,x(j:end)];

       elseif x(1,j)== esc && (x(1,j-1) ~= esc)% si existe esc
            x = [x(1:j-1),esc,x(j:end)];      
        end
      j=j+1;
   
    end
      y = convertCharsToStrings(x);
      z(i,1)=y;%es la mtriz final
end


%% Agregar las flags

[m,n] =size(z);
ppp_cod= [flag z(1,1)];
ppp_cod = [ppp_cod flag];

for j =2:m

   ppp_cod= [ppp_cod z(j,1) ];
   ppp_cod =[ppp_cod flag];
end

table_ppp =table(ppp_cod);
writetable(table_ppp,'text_char_cod.txt');

%% Se manda a llamar la función
 matrizFinal = ppp_decod(ppp_cod);

 table_ppp1 =table(matrizFinal);
writetable(table_ppp1,'text_char_decod.txt');