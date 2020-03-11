pkg load signal

clear all;
close all;

a                           = [1 2 3 4];
N                           = 2*length(a)-1;

a_zeropad                   = [a zeros(1, N-length(a))];

fft_a                       = fft(a, N);
fft_a_zeropad               = fft(a_zeropad);


ifft_a                      = ifft(fft_a_zeropad);

stem(a_zeropad)

hold on

stem(ifft_a)