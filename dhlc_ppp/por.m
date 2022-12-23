x=[2 4 6 8 4];
s=[0 find(x==4)];
r=[];
for k=1:length(s)-1
    r=[r x(s(k)+1:s(k+1)) 11 12];
end
r=[r x(s(end)+1:length(x))];
x=r;
disp(x)

xoriginal = [2 4 6 8 10];
valor = 5;
posicion =4;
xmodificado = [xoriginal(1:posicion-1),valor,xoriginal(posicion:end)]