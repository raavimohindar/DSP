close all;
clear all;

% Construct a cosine wave

A = 0.5;
fc = 10; 

sampling_factor = 30;
fs = sampling_factor * fc;

time = 2;
t = 0:1/fs:time-1/fs;

phase = 30;
phi = phase * pi / 180;

x_t = A * cos(2*pi*fc*t+ phi);

figure(1);
subplot(4, 1, 1);
plot(t, x_t);
axis([0 time -A A])

% Transform time-domain signal to frequency-domain

N = 512; 
X = N * fftshift(fft(x_t, N))

% Extract the magnitude and plot it against the relative frequecny

df = fs / N;
sampleIndex = -N/2:N/2-1;
relative_f = sampleIndex * df;

subplot(4, 1, 2);
stem(relative_f, abs(X));
axis([-30 30])
xlabel('f (Hz)'); ylabel('|X(k)|');


% Extract the phase and noise removal

X2=X;
threshold = max(abs(X))/10000; 
X2(abs(X) < threshold) = 0; 

phase_X2=atan2(imag(X2),real(X2))*180/pi;

subplot(4, 1, 3);
stem(relative_f,phase_X2);
axis([-30 30])

% Signal reconstruction

x_reconstruction = 1/N * ifft(ifftshift(X), N);

t = [0:1:length(x_reconstruction)-1] / fs;

subplot(4, 1, 4);
plot(t, x_reconstruction);
axis([0 time -A A])

%