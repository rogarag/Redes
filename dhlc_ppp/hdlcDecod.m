function z = hdlcDecod(hdlc_cod)
% clear all;
% clc;
% hdlc_cod =["01110"	"111110111110"	"01110" "010111110" "01110" "011100110" "01110"];
flag = string('01110');
contador =0;
contador1 =0;
contador2 =0;
[m,n] = size(hdlc_cod);

%% quitar las flags del inicio y el final

hdlc_cod = [[],hdlc_cod(2:end)];
[m,n] = size(hdlc_cod);
hdlc_cod =[hdlc_cod(1:n-1),[]];
[m,n] = size(hdlc_cod);

%quita las las flags intermedias
i=1; 
hdlc_cod
while i<n 
    hdlc_cod(1,i)
    if hdlc_cod(1,i) == flag
    hdlc_cod(i) = []
    n =n-1
    end
    i=i+1

end

%% Eliminar los ceros
i =1;
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
       if (contador1 == 5) && (x(1,j+1)=='0')
            x(j+1) = []
            n =n-1
            contador1 = 0;
       end
    j=j+1
    end
y = convertCharsToStrings(x)   
     z(i,1)=y;%es la mtriz final
  
 
end 


end
