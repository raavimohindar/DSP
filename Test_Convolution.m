pkg load signal

clear all;
close all;

a                           = [1 2 3 4];
b                           = [0 1 0 0];

circular_convolution        = ifft(fft(a).*fft(b))
cconv_octave                = cconv(a, b, length(a));

conv_octave                 = conv(a, b);

N                           = length(a) + length(b) - 1;

a_zeropad                   = [a zeros(1,N-length(a))];
b_zeropad                   = [b zeros(1,N-length(b))];

fast_convolution_zp         = ifft(fft(a_zeropad).*fft(b_zeropad))

fast_convolution_fft_l      = ifft(fft(a, N)     .*fft(b, N))
