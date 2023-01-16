% L = 32 # number of digital samples per data bit
% Fs = 8*L # Sampling frequency
% voltageLevel = 5 # peak voltage level in Volts
% data = (np.random.rand(10000)>0.5).astype(int) # random 1s and 0s for data
% clk = np.arange(0,2*len(data)) % 2 # clock samples

clc; clear; close all;
L= 32;
Fs = 8*L;
voltageLevel = 5;
data = [0,1,0,0,1];
aux = [ 0:  2*length(data)-1];
clk = mod(aux ,2);
 


ami = 1*data; 
previousOne = 0;
for i =1:length(data)

    if (ami(i)==1) && (previousOne ==0)

        ami(i) = voltageLevel;
         previousOne =1 ;

    end
    if (ami(i)==1) && ( previousOne ==1)

    ami(i) = -1 *voltageLevel;
    previousOne =0 ;

    end

end


% clk_sequence = np.repeat(clk,L)
% data_sequence = np.repeat(data,2*L)
% unipolar_nrz_l = voltageLevel*data_sequence
% nrz_encoded = voltageLevel*(2*data_sequence - 1)
% unipolar_rz = voltageLevel * (data_sequence * (1 - clk_sequence))
% ami_sequence = np.repeat(ami,2*L)
% manchester_encoded = voltageLevel* (2*np.logical_xor(data_sequence,clk_sequence).astype(int)-1)

% clk_sequence = np.repeat(clk,L)
clk_sequence = [];
for i=1:length(clk)

    aux = clk(i);

    for j =1:L
    clk_sequence =[clk_sequence aux];
        
    end

end

%%data secuence
data_sequence = [];
for i=1:length(data)

    aux = data(i);

    for j =1:(2*L)
    data_sequence =[data_sequence aux];
        
    end

end


unipolar_nrz_l = voltageLevel.*data_sequence
nrz_encoded = voltageLevel.*(2.*data_sequence - 1)
unipolar_rz = voltageLevel.* (data_sequence.* (1 - clk_sequence))



%ami_sequence = np.repeat(ami,2*L)

ami_sequence = [];
for i=1:length(ami)

    aux = ami(i);

    for j =1:(2*L)
    ami_sequence =[ami_sequence aux];
        
    end

end
%manchester_encoded = voltageLevel* (2*np.logical_xor(data_sequence,clk_sequence).astype(int)-1)
manchester_encoded = voltageLevel* (2.*xor(data_sequence,clk_sequence)-1)

%x = linspace(0,320);
x = linspace(0,320,320)


figure(1)
subplot(7,1,1)
plot(x, clk_sequence)
subplot(7,1,2)
plot(x, data_sequence)
subplot(7,1,3)
plot(x, unipolar_nrz_l)
subplot(7,1,4)
plot(x, nrz_encoded)
subplot(7,1,5)
plot(x, unipolar_rz)
subplot(7,1,6)
plot(x, ami_sequence)
subplot(7,1,7)
plot(x, manchester_encoded)

