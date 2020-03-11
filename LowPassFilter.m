close all;
clear all;


z0                  = 50;
A                   = importdata("sparameters_lowpass.dat");
L                   = 20e-3;
c                   = 299792458;

tau                 = (2*L) / c;            

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

for I = 1:N

  if (I == 1)
    X_3term(1)      = ((1.0*beta/2) * X(N))   + (alpha*X(1)) + ((1.0*beta/2) * X(2));
    Y_3term(1)      = ((1.0*beta/2) * Y(N))   + (alpha*Y(1)) + ((1.0*beta/2) * Y(2));
  elseif (I == N)
    X_3term(N)      = ((1.0*beta/2) * X(N-1)) + (alpha*X(N)) + ((1.0*beta/2) * X(1));
    Y_3term(N)      = ((1.0*beta/2) * Y(N-1)) + (alpha*Y(N)) + ((1.0*beta/2) * Y(1));
  else
    X_3term(I)      = ((1.0*beta/2) * X(I-1)) + (alpha*X(I)) + ((1.0*beta/2) * X(I+1));
    Y_3term(I)      = ((1.0*beta/2) * Y(I-1)) + (alpha*Y(I)) + ((1.0*beta/2) * Y(I+1));
  endif

endfor

s11_time            = ifft(X_3term);
z_time              = ifft(Y_3term);

time                = 20*tau/1.0e-9; 
t                   = [0: time/N: time-1/N];

figure(2)

##subplot(321)
##plot(freq, 20*log10(abs(s11_freq)));
##axis([0 freq(end)])
##xlabel('f');
##ylabel('|S_{11}| (dB)');
##grid on;
##
##subplot(322)
##plot(F, abs(X));
##axis([-freq(end) freq(end)])
##xlabel('f');
##ylabel('|X| (folded)');
##grid on;
##
##
##subplot(323)
##plot(freq, 20*log10(abs(z_in_freq)));
##ylabel('|z_{in}| (dB)');
##grid on;
##
##subplot(324)
##plot(F, abs(Y));
##ylabel('|z_{in}| (folded)');
##grid on;


subplot(211)
plot(t, abs(s11_time));
xlabel('t (ns)');
ylabel('|s_{11}| (time)');
axis([0 t(end)]);
grid on;

subplot(212)
plot(t, abs(z_time), '-o');
xlabel('t (ns)');
ylabel('|Z| (time)');
%axis([0 t(end)]);
grid on;
