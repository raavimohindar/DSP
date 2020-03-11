close all;
clear all;

A               = importdata("sparameters_bandpass.dat");

N               = 512;

freq            = A(:,1);
realPart        = A(:,2);
imagPart        = A(:,3);

s11_input       = realPart + imagPart*i;

M               = length(s11_input);

window          = hamming(M);   

multiplication  = (s11_input.*window);

s11_time        = ifft(multiplication);


figure(2);
subplot(4, 1, 1)
plot(20*log10(abs(s11_input)));
xlabel('Frequency (GHz)')
ylabel('S11 (dB)')

subplot(4, 1, 2)
plot(window);
xlabel('Hamming window')

subplot(4, 1, 3)
plot(20*log10(abs(s11_time)));
xlabel('time (ns)')
ylabel('S11 (dB)')


f0 = (freq(1)+freq(end))/2;
%unwrapped_phase = unwrap(angle(s11_time))-2.0*pi*f0*t';
unwrapped_phase = unwrap(angle(s11_time));

subplot(4, 1, 4)
plot(unwrapped_phase);
xlabel('time (ns)')
ylabel('phase (linear)')


