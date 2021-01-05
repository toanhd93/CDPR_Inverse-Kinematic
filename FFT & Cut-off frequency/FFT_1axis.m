clear all
close all
clc
%reference: https://stackoverflow.com/questions/28814547/matlab-low-pass-filter-using-fft
C = xlsread('C:\Toan\New_PJT\20200313\0330_data',1);

X_error = C(:,4);
Y_error = C(:,7);
Z_error = C(:,10);
t = C(:,1);

data = Z_error;

Fs = 0.1;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L=length(t);                     % Length of signal

plot(t,data);
title('Original data in the Time Domain')

n = L; %2^nextpow2(L);
Y = fft(data,n);

P2 = abs(Y/n);
P1 = P2(1:round(n/2));
P1(2:end-1) = 2*P1(2:end-1);

f1 = transpose(Fs*(0:(n/2))/n);

figure(2)   %frequency domain
plot(f1,P1)
title('Original data in the Frequency Domain')

cut_off = 0.008;
r = round(cut_off/(Fs/n)); % range of frequencies we want to preserve

%low
rectangle = zeros(size(Y));
rectangle(1:r+1) = 1;
rectangle(end-r+1:end) = 1;
Low = ifft(Y.*rectangle,n);

figure(3)    
plot(t,Low)
title('Low freq. data in the Time Domain')

%high
rectangle2 = zeros(size(Y));
rectangle2(r+2:end-r) = 1;
High = ifft(Y.*rectangle2,n);

figure(4)    
plot(t,High)
title('High freq. data in the Time Domain')

%sum low freq. and high freq. data
sum = Low + High;
figure(5)
plot(t,sum)
title('Low+High freq. data in the Time Domain')