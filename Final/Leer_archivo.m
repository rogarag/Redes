
function matriztrama= Leer_archivo()
lines = readlines("texto_bin.txt");
[m,n]= size(lines);


% 

for i=1:m
    contador =1;
    aux=lines(i,1);
    aux= convertStringsToChars(aux);
    

    aux1= aux(1:8); % aggara todos lo caracteres
    aux1= convertCharsToStrings(aux1);
    matriztrama(i,contador) = aux1;
    contador =contador +1;
    
    aux2 = aux(9:16);
     aux2= convertCharsToStrings(aux2);
    matriztrama(i,contador) = aux2;
    contador =contador +1;
   
    
    aux3 = aux(17:24);
    aux3= convertCharsToStrings(aux3);
    matriztrama(i,contador) = aux3;
    contador =0;
    
end


end

