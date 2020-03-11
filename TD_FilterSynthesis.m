clear all;
close all;

A                       = importdata("sparameters_bandpass.dat");

frequencyPart           = A(:,1);
realPart                = A(:,2);
imaginaryPart           = A(:,3);

s11                     = (realPart + imaginaryPart*i)';
N                       = length(s11);
M                       = 2048;

s11_time                = ifft(s11, 2048);

figure(1)
plot(abs(s11_time))

  
window                  = hamming(N);

window_freq             = (2/N) * fft(window, M);

freq_multiplication     = Y.*window_freq';



figure(2)

subplot(311)
plot(20*log10(abs(s11)))
grid on;
xlabel('Frequency (GHz)')
ylabel('S11 (dB)')

subplot(312)
plot(20*log10(abs(s11_time)))
grid on;
xlabel('Time (ns)')
ylabel('S11 (dB)')
