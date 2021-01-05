clear all
close all
clc

%C = xlsread('C:\Toan\New_PJT\CDPR_LSTM_test\20200414\0414_data',1);
C = xlsread('C:\Toan\New_PJT\CDPR_LSTM_test\20200427\0427_data',1);

X_error = C(:,4);
Y_error = C(:,7);
Z_error = C(:,10);
t = C(:,1);

Fs = 1/60;                    % Sampling frequency
T = 1/Fs;                     % Sampling period
L=length(t);                     % Length of signal

X = [X_error Y_error Z_error];

for i = 1:3
    %subplot(3,1,i)
    plot(t(1:L),X(1:L,i),'LineWidth',2)
    hold on
    title('Original data in the Time Domain')
    %legend('X error', 'Y error', 'Z error')
    ylabel('Error (mm)')
    xlabel('Time(sec)')
    set(gcf,'color','w');
end
legend('X error', 'Y error', 'Z error')
%n = 2^nextpow2(L);
n=L;
dim = 1;
Y = fft(X,n,dim);

P2 = abs(Y/n);
P1 = P2(1:round(n/2),:);
P1(2:end-1,:) = 2*P1(2:end-1,:);

f1 = transpose(Fs*(0:(n/2))/n);

figure(2)
for i=1:3
    %subplot(3,1,i)
    plot(f1,P1(:,i),'LineWidth',2)
    hold on
    title('Original data in the Frequency Domain')
    %legend('X error', 'Y error', 'Z error')
    ylabel('Amplitude (mm)')
    xlabel('Freq.(hz)')
    set(gcf,'color','w');
end
legend('X error', 'Y error', 'Z error')

cut_off = 0.00135; %0.00135; %0.00272;
r = round(cut_off/(Fs/n)); % range of frequencies we want to preserve

%low
rectangle = zeros(size(Y));
rectangle(1:r+1,:) = 1;
rectangle(end-r+1:end,:) = 1;
Low = ifft(Y.*rectangle,n);

figure(3)    
for i=1:3
    %subplot(3,1,i)
    plot(t,Low(:,i),'LineWidth',2)
    hold on
    title('Low freq. data in the Time Domain')
    %legend('X error', 'Y error', 'Z error')
    ylabel('Error (mm)')
    xlabel('Time(sec)')
    set(gcf,'color','w');
end
legend('X error', 'Y error', 'Z error')

%high
rectangle2 = zeros(size(Y));
rectangle2(r+2:end-r,:) = 1;
High = ifft(Y.*rectangle2,n);

figure(4)    
for i=1:3
    %subplot(3,1,i)
    plot(t,High(:,i),'LineWidth',2)
    hold on
    title('High freq. data in the Time Domain')
    %legend('X error', 'Y error', 'Z error')
    ylabel('Error (mm)')
    xlabel('Time(sec)')
    set(gcf,'color','w');
end
  legend('X error', 'Y error', 'Z error')

%sum low freq. and high freq. data
sum = Low + High;
figure(5)
for i=1:3
    subplot(3,1,i)
    plot(t,sum(:,i),'LineWidth',2)
    hold on
    title('Low+High freq. data in the Time Domain')
    ylabel('Error (mm)')
    xlabel('Time(sec)')
    set(gcf,'color','w');
end