% L = 32 # number of digital samples per data bit
% Fs = 8*L # Sampling frequency
% voltageLevel = 5 # peak voltage level in Volts
% data = (np.random.rand(10000)>0.5).astype(int) # random 1s and 0s for data
% clk = np.arange(0,2*len(data)) % 2 # clock samples


L= 32;
Fs = 8*L;
data = [0 1 1 0 0 0];
clk = (0:0.2*length(data))


