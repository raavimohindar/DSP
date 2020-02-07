close all;
clear all;

N = 2048;
z0 = 50;

sampling_factor = 6;

A = importdata("sparameters_lowpass.dat");

freq = A(:,1);
realPart = A(:,2);
imagPart = A(:,3);

f_max = freq(end);
fs = sampling_factor*f_max;

input = realPart + imagPart*i;

input_length = length(input);

s11_input_symmetric = [input((input_length-1)/2+1: input_length)' input(1: (input_length-1)/2)'];

%s11_input_symmetric = fftshift(input');

X = ((padarray(s11_input_symmetric', (N/2 - ((input_length-1)/2)) , 0)))(1:N);

window = 1/N * fftshift(fft(hamming(input_length), N));

s11_time = N * ifft(ifftshift(X.*window), N);

t = [0:1:length(s11_time)-1] / fs;

z_in = z0*(1+s11_time)./(1-s11_time);


figure(1);
subplot(411)
stem(20*log10(abs(X)));
xlabel('Frequency (GHz)');
ylabel('S11 (dB)');
grid on;

subplot(412)
plot(20*log10(abs(window)));
xlabel('Hamming window')
grid on;

subplot(413)
plot(t, (s11_time));
xlabel('time (ns)')
ylabel('S11 - linear');
axis([0 5 -0.5 0.5])
grid on;

subplot(414)
plot(t, abs(z_in));
xlabel('time (ns)')
ylabel('Z_{in}');
axis([0 5 0 75])
grid on;