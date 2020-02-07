close all;
clear all;

T1 = 0.0;
T2 = 0.02;

Fs = 16*250;
Ts = 1/Fs;

t = (0:Ts:T2);

N = length(t);

relative_f = (-N/2:N/2-1) * (Fs/N);
relative_t = (-N/2:N/2-1) * (1/(Fs));

S = sin(2*pi*100*t + pi/4) + cos(2*pi*250*t) + sin(2*pi*100*t + 5*pi/2);

X = fftshift(fft(S,N));

Phase = angle(X);

figure 1
subplot(311)
plot(t, S);
xlabel('t')
ylabel('S')

subplot(312)
stem(relative_f, abs(X));
axis([-Fs/2 Fs/2])
xlabel('f')
ylabel('magnitude (S)')

subplot(313)
stem(relative_t, Phase);
axis([relative_t(1) relative_t(end)])
xlabel('t')
ylabel('phase (S) in rad')
