close all;
clear all;

z0                  = 50;
A                   = importdata("sparameters_lowpass.dat");
L                   = 20e-3;
c                   = 299792458;

tau                 = (2*L) / c;            
time                = 20*tau/1.0e-9; 

alpha               = 0.54;
beta                = 0.46;

freq                = A(:,1);
freq_neg            = -1.0*flip(freq);
F                   = [freq_neg(1:end-1)', freq(1),     freq(2:end)'];

s11_freq            = A(:,2) + A(:,3)*i;
s11_conj            = conj(flip(s11_freq));

X                   = [s11_conj(1:end-1)', s11_freq(1), s11_freq(2:end)']; 


z_in_freq           = z0 * (1 + s11_freq)./(1 - s11_freq);
z_in_conj           = conj(flip(z_in_freq));

Y                   = [z_in_conj(1:end-1)', z_in_freq(1), z_in_freq(2:end)']; 

N                   = length(Y);

window              = fft(hamming(32), N);

s11_time            = ifft(X.*window');
z_time              = ifft(Y.*window');

t                   = [0: time/N: time-1/N];

figure(2)

subplot(211)
plot(t, abs(s11_time));
xlabel('t (ns)');
ylabel('|s_{11}| (time)');
grid on;

subplot(212)
plot(t, abs(z_time));
xlabel('t (ns)');
ylabel('|Z| (time)');
grid on;
