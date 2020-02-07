close all;
clear all;

N = 1024;
z0 = 50;
sampling_factor = 6;

A = importdata("sparameters_bandpass.dat");

freq = A(:,1);
realPart = A(:,2);
imagPart = A(:,3);

f_max = freq(end);

fs = sampling_factor*f_max;

s11_input = realPart + imagPart*i;

C = [s11_input', zeros(1, N-length(s11_input))];

window = 1/N * fft(hamming(N), N);

s11_time = N * ifft((C.*window'), N);

t = [0:1:length(s11_time)-1] / fs;

figure(2);
subplot(4, 1, 1)
plot(freq, 20*log10(abs(s11_input)));
xlabel('Frequency (GHz)')
ylabel('S11 (dB)')

subplot(4, 1, 2)
plot(20*log10(abs(window)));
xlabel('Hamming window')

subplot(4, 1, 3)
plot(t, 20*log10(abs(s11_time)));
xlabel('time (ns)')
ylabel('S11 (linear)')
axis([0 0.5 -40 40])

f0 = (freq(1)+freq(end))/2;
unwrapped_phase = unwrap(angle(s11_time))-2.0*pi*f0*t';

subplot(4, 1, 4)
plot(t, unwrapped_phase);
xlabel('time (ns)')
ylabel('phase (linear)')
axis([0 0.5 -30 5])
