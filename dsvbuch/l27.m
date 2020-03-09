% ##############################################################################
% ##  Loesung: Seitenbanddaempfung des Blackman-Fenster                       ##
% ##############################################################################

NFFT=2^10;
f_bl032= blackman(32);  aF_bl032= abs(fft(f_bl032,NFFT)/sum(f_bl032));
f_bl064= blackman(64);  aF_bl064= abs(fft(f_bl064,NFFT)/sum(f_bl064));
f_bl128= blackman(128); aF_bl128= abs(fft(f_bl128,NFFT)/sum(f_bl128));
fT = 0:1/NFFT:1-1/NFFT;

% Berechnung der minimalen Sperrdaempfung a_{min}:
% Os := Omega_s/(2*pi);  n_s: Sperrbereich-Indices: n_s+1<=n<=NFFT+1-n_s
Os=3/32;  n_s=round(NFFT*Os); a032=20*log10(max(aF_bl032(n_s+1:NFFT+1-n_s)));
Os=3/64;  n_s=round(NFFT*Os); a064=20*log10(max(aF_bl064(n_s+1:NFFT+1-n_s)));
Os=3/128; n_s=round(NFFT*Os); a128=20*log10(max(aF_bl128(n_s+1:NFFT+1-n_s)));

% # grafische Ausgabe # %
figure; 
plot(fT, 20*log10(aF_bl032+eps));  
hold on;  
axis([0 1 -180 10]);
text(0.41,a032,sprintf('a_{min} = %3.1f dB',-a032));
plot([0 0.39], [a032 a032], '--');
title('|Norm. Spektralfunktion| des Blackmanfensters:  N=32');
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB'); 
xlabel('Omega/2pi = f T');

figure; 
plot(fT, 20*log10(aF_bl064+eps));  
hold on;  
axis([0 1 -180 10]);
text(0.41,a064,sprintf('a_{min} = %3.1f dB',-a064));
plot([0 0.39], [a064 a064], '--');
title('|Norm. Spektralfunktion| des Blackmanfensters:  N=64');
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB'); 
xlabel('Omega/2pi = f T');

figure; 
plot(fT, 20*log10(aF_bl128+eps));  
hold on;  
axis([0 1 -180 10]);
text(0.41,a128,sprintf('a_{min} = %3.1f dB',-a128));
plot([0 0.39], [a128 a128], '--');
title('|Norm. Spektralfunktion| des Blackmanfensters:  N=128');
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB');  
xlabel('Omega/2pi = f T');
% #####  EOF  #####