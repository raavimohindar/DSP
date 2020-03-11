close all;
clear all;

fc = 10; 

sampling_factor = 100;
fs = sampling_factor * fc;

time = 0.25;
t = 0:1/fs:time-1/fs;

x_t = sin(2*pi*fc*t);

figure(1);
subplot(4, 1, 1);
plot(t, x_t);


N = length(x_t); 
X = fftshift(fft(x_t))


df = fs / N;
sampleIndex = -N/2:N/2-1;
relative_f = sampleIndex * df;

subplot(4, 1, 2);
stem(relative_f, abs(X));
xlabel('f (Hz)'); ylabel('|X(k)|');
s