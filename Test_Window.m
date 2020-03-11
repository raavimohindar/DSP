close all;
clear all;

N             = 32;
window        = hamming(N);

A             = fft(window, 256);

A_ifft        = (N/2) * ifft(A)

subplot(411)
plot(window);
ylabel('w(n)')
title('Hamming window')

magnitude     = abs(fftshift(A));
subplot(412)
plot(magnitude);
ylabel('W(j\omega)')

response      = 20*log10(magnitude);
subplot(413)
plot(response);
ylabel('W(j\omega) dB')

subplot(414)
plot(abs(fftshift(A_ifft)));
ylabel('IFFT(W(j\omega))')
