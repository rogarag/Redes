function datos1 = CambioTrama(datos)

dato2Chars=convertStringsToChars(datos);
[~,n] =size(dato2Chars);
fila=randi([1,7])

if dato2Chars([1,fila])== '0'

    dato2Chars(1,fila)='1';

else

    dato2Chars(1,fila)='0';

end

datos1=dato2Chars;
end