function [hdlc1,aux1] = hdlc(unicodeValues)
[m,~] =size (unicodeValues);
flag =  '01110';
flag = bin2dec(flag);



 z = unicodeValues(1,:);
 hdlc1 = [z flag];

 for j=2:m

   z = unicodeValues(2,:);
   hdlc1 = [hdlc1 z];
   hdlc1 = [hdlc1 flag];
 end

 hdlc1
 hdlc1_bin = dec2bin(hdlc1);

m=0;n=0;i=0;
[m,n]= size(hdlc1_bin);
aux1 = [];

for k=1:m
aux =hdlc1_bin(k,:);
aux1 =[aux1 aux];
end



end
