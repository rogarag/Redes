clear all;
clc;
flag = string('@');
esc= '/';
ppp_cod =["@"    "h////ola"    "@"   "t///@r" "@" "Karlos/@" "@"   ];
contador =0;
contador1 =0;
contador2 =0;
[m,n] = size(ppp_cod);


%% quitar las flags del inicio y el final

ppp_cod = [[],ppp_cod(2:end)];
[m,n] = size(ppp_cod);
ppp_cod =[ppp_cod(1:n-1),[]];
[m,n] = size(ppp_cod);

%% quita las las flags intermedias
i=1; 
ppp_cod
while i<n 
    ppp_cod(1,i)
    if ppp_cod(1,i) == flag
    ppp_cod(i) = []
    n =n-1
    end
    i=i+1

end
ppp_cod

%% quita las las flags y esc

[~,n]= size(ppp_cod);
for i=1:n

x = ppp_cod(1,i);
x = convertStringsToChars(x);
[~,n]= size(x);
       j=1;
    while j<n % este for cuenta los caracteres
        x(j)
        if (x(1,j)=='/') && (x(1,j+1)=='@')
               x(j) = []
                n =n-1
                
        elseif (x(1,j)=='/') && (x(1,j+1)=='/')
            x(j) = []
               n =n-1
               contador =contador +1
%         elseif (contador ==2) && (x(1,j+1)=='/')
%                 j=j+2
        end
      
        j=j+1
    end
y = convertCharsToStrings(x)   
   z(i,1)=y;%es la mtriz final
  
 
end 

%% quitar los demas 
