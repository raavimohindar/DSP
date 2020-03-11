close all;
clear all;

time            = 2; % in nano-seconds
z0              = 50;
A               = importdata("sparameters_lowpass.dat");
M               = 2048;

freq            = A(:,1);
freq_neg        = -1.0*flip(freq);

realPart        = A(:,2);
imagPart        = A(:,3);

s11_freq        = realPart + imagPart*i;
s11_conj        = conj(flip(s11_freq));

F               = [freq_neg(1:end-1)', freq(1),     freq(2:end)'];
X               = [s11_conj(1:end-1)', s11_freq(1), s11_freq(2:end)']; 

win             = (hamming(length(X)));

freq_multip     = (X).*win';

s11_time        = ifft(freq_multip, length(s11_freq));
    
z_in            = z0 * (1 + s11_time)./(1 - s11_time);

t               = [0: time/length(s11_time): time-1/length(s11_time)];

z_in_freq       = z0*(1+ (s11_freq))./(1- (s11_freq));
freq_resamp     = resample(freq, M, length(freq));
z_in_resamp     = resample(z_in, M, length(freq));

figure(2)

subplot(511)
stem(freq, (abs(s11_freq)));
axis([0 20])
xlabel('f');
ylabel('|S11|');
grid on;

subplot(512)
stem(F, (abs(X)));
axis([-freq(end) freq(end)])
xlabel('f');
ylabel('|S11|');
grid on;

subplot(513)
plot(F, (abs(win)));
ylabel('window');
grid on;

subplot(514)
plot(t, 20*log10(abs(s11_time)));
xlabel('t');
ylabel('|S11| (time)');
axis([0 t(end) -10 10]);
grid on;

subplot(515)
plot(t, abs(z_in));
ylabel('Z_in');
grid on;
