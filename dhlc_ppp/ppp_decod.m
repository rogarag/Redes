function matrizFinal = ppp_decod(ppp_cod)
% clear all;
% clc;
% ppp_cod =["."	"How do HDLC--frames work."	"."	"HDLC--frames can be transmitted over either-. "	"."	"Asynchronous or synchronous communication links"	"."  ];
flag = '.';
esc= '-';
% 
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
        x(j+1)
        flag
        esc
        if (x(j)== esc) && (x(j+1)==flag)
               x(j) = []
                n =n-1
                
        elseif (x(j)==esc) && (x(j+1)==esc)
            x(j) = []
               n =n-1
               contador =contador +1;
        end
      
        j=j+1
    end
y = convertCharsToStrings(x)   
   matrizFinal(i,1)=y;%es la mtriz final

end 


 end

%% quitar los demas 