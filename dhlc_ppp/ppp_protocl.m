clc;
clear all;
%%variables
flag ='@';
esc='/';
vec1=[];
contador =0;

%%
lines = readlines("texto_char.txt");
[m,n]=size(lines);
f=0;

%%
q=0;
for i=1:m
    q=0;
x = lines(i,:);
x = convertStringsToChars(x);
n =0;
[m,n]=size(x);
    for j=1:n
        
       x(1,j)
       x(i,j+1)
       %estas seran las condiconales
      % if (x(1,j)=='@') && (x(1,j)=='/')

       if  x(1,j)== '@' %si en el texto existe una flag
       vect1 = [x(1:j-1),esc,x(j:end)]
       elseif x(1,j)== '/'% si existe esc
       vect1 = [x(1:j-1),esc,x(j:end)]
       end

   
    end
      y = convertCharsToStrings(vect1)   
      z(i,1)=y;
 end

% for i =2:m
% x = lines(i,:);
% x = convertStringsToChars(x);
% [~,n]= size(x)
%        
% vec1 = [vec1 x];
% vec1 = [vec1 flag];
% x = 0;
% end
% vec1


% for i=1:m
%     
%    A= lines(i,:);
%     v = genvarname(['x',num2str(i)]);
%    eval([v,'= x']);
%     x=0;
% end




% % este for convierte los elementos string a elemenots Char
% for i=1:m
% x = lines(i,1);
% x = convertStringsToChars(x);
% b(i,:)=x;
% x =0;
% end

% str  = ["a","b","c","Q","W","e","q","w","o","d","p","c","s","c","s","c","k","c"];
% str2 = [];
% x = length(str);
%  for i=1:x
% 
%     if str(1,i)=="-"
%       
%     elseif str(1,i)=="."
% 
%     end
%    
%  end
% flag = "-";
% 
% str = [flag str];
% str = [str flag];