close all;

clear all;

N = 128;

x = [1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0,1,1,0,0];

X    = fft(x, N);
H    = fft(ones(1, N));
HAMM = fft(hamming(N));
HANN = fft(hanning(N));

%figure(1)
t = title('FFT of a given sequence N=2^8')

subplot(221)
plot(abs(X));
xlabel('No Window')
title('N=256')
grid on

subplot(222)
plot(abs(X.*H));
xlabel('Rectangular window')
title('N=256')
grid on

subplot(223)
plot(abs(X.*HANN'));
xlabel('Hann Window')
title('N=256')
grid on

subplot(224)
plot(abs(X.*HAMM'));
xlabel('Hamming Window')
title('N=256')
grid on


