h = randn(100, 1);
F = dftmtx(length(h));
abs(fft(h) - F*h)      

subplot(311)
stem(h);

subplot(312)
stem(fft(h));


