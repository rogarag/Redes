clc;
clear all;


lines = readlines("texto.txt");

[m,n]= size(lines);



for i=1:m
x = lines(i,1);
x = convertStringsToChars(x);
b(i,:)=x;
x =0;
end


unicodeValues = double(b);


y1 = hdlc(unicodeValues)
