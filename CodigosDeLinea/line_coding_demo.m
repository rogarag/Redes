clc;
clear;
% Demo of using different line codings
bits = [0 1 0 1 1 0 0 0];
bitrate = 1; % bits per second



subplot(6,1,1)
[t,s] = unrz(bits,bitrate);
plot(t,s,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar NRZ: [' num2str(bits) ']']);

subplot(6,1,2)
[t,s] = urz(bits,bitrate);
plot(t,s,'LineWidth',3);
axis([0 t(end) -0.1 1.1])
grid on;
title(['Unipolar RZ: [' num2str(bits) ']']);

subplot(6,1,3)
[t,s] = prz(bits,bitrate);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Polar RZ: [' num2str(bits) ']']);

subplot(6,1,4)
[t,s] = manchester(bits,bitrate);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['Manchester: [' num2str(bits) ']']);

subplot(6,1,5)
[t,s] = biNRZ(bits,bitrate);
plot(t,s,'LineWidth',3);
axis([0 t(end) -1.1 1.1])
grid on;
title(['bipolar NRZ: [' num2str(bits) ']']);

