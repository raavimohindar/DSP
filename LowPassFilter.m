close all;
clear all;

z0                    = 50;
A                     = importdata("sparameters_lowpass.dat");
N                     = 512;      % number of samples in final result desired

freq                  = A(:,1);
realPart              = A(:,2);
imagPart              = A(:,3);

s11                   = realPart + imagPart*i; % In frequency domain
s11_resamp            = resample(s11, N, 1);

s11_time_zero_pad     = [ifft(s11)' zeros(1,N-length(s11))];
s11_freq_interpol     = fft(s11_time_zero_pad);

figure(1);
subplot(311)
plot(20*log10(abs(s11)));
xlabel('Frequency (GHz)');
ylabel('S11 (dB)');
grid on;

subplot(312)
plot(20*log10(abs(s11_resamp)));
xlabel('Unknown');
ylabel('S11 (dB)');
grid on;

subplot(313)
plot(20*log10(abs(s11_freq_interpol)));
xlabel('N');
ylabel('S11 (dB)');
grid on;
