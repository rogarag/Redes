function [c] = hdlc(x)
%%
unicodeValues= x;
flag =  '01110';


%%
 
 w1 = dec2bin(unicodeValues);
 [m,n] =size(w1);


 c =strcat(flag,w1(1,:));

%  for i=1:m
% 
%    c = [w1(m,:) flag]
% 
%  end






