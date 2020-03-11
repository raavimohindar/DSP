close all;
clear all;

interval        = 0.5;
f0              = 16; 
t               = 0:1/2048:interval-(1/2048)
x_t             = sin(2*pi*f0*t);

figure(1);
subplot(2, 1, 1);
plot(t, x_t);
axis([0 interval])
hold on;

fs              = 64;
N               = (interval * fs);
sample_index    = [0:N-1];
x_n             = sin(2*pi*(f0/fs)*sample_index);

n               = 0:1/fs:interval-(1/fs)
stem(n, x_n);


X               = fftshift(fft(x_n, N));

df              = fs / N;
sampleIndex     = -N/2:N/2-1;
relative_f      = sampleIndex * df;

subplot(2, 1, 2);
stem(relative_f, abs(X));
xlabel('f (Hz)'); ylabel('|X(k)|');
axis([min(relative_f) max(relative_f)])
