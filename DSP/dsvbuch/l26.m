% ##############################################################################
% ##  Loesung:  Vergleich versch. Fensterfunktionen                           ##
% ##############################################################################

N = 63;                          NFFT  = 2^9;
f_re = boxcar(N);                aF_re = abs(fft(f_re,NFFT)/sum(f_re));
f_hn = hanning(N);               aF_hn = abs(fft(f_hn,NFFT)/sum(f_hn));
f_hm = hamming(N);               aF_hm = abs(fft(f_hm,NFFT)/sum(f_hm));
f_bl = blackman(N);              aF_bl = abs(fft(f_bl,NFFT)/sum(f_bl));
a_d1=48.6; f_d1=chebwin(N,a_d1); aF_d1 = abs(fft(f_d1,NFFT)/sum(f_d1));
a_d2=76.1; f_d2=chebwin(N,a_d2); aF_d2 = abs(fft(f_d2,NFFT)/sum(f_d2));
kk = 0:N-1;                      fT = 0:1/NFFT:1-1/NFFT;

% Berechnung von a_{min}  (fsT:=Omega_s/(2*pi); Sperrber.: n_s+1<=n<=NFFT+1-n_s)
fsT=1/N; n_s=round(NFFT*fsT); a_re=20*log10(max(aF_re(n_s+1:NFFT+1-n_s)));
fsT=2/N; n_s=round(NFFT*fsT); a_hn=20*log10(max(aF_hn(n_s+1:NFFT+1-n_s)));
fsT=2/N; n_s=round(NFFT*fsT); a_hm=20*log10(max(aF_hm(n_s+1:NFFT+1-n_s)));
fsT=3/N; n_s=round(NFFT*fsT); a_bl=20*log10(max(aF_bl(n_s+1:NFFT+1-n_s)));

% # grafisch Ausgabe # %
% RECHTECK-Fenster
figure;           
bar(kk,f_re); 
axis([-.5 N-.5 0 1.1]); 
title('Rechteck-Fenster'); 
ylabel('f(k)');
xlabel('k');

figure; 
plot(fT,20*log10(aF_re+eps)); 
hold on; 
axis([0 1 -150 10]);
text(.3,a_re+13,sprintf('a_{min} = %3.1f dB',-a_re));
plot([0 1.9],[a_re a_re],'--'); 
title('|Normierte Spektralfunktion|');
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB'); 
xlabel('Omega/2pi = f T');

input('....Zum Fortfahren: RETURN druecken');

% HANNING-Fenster
figure;           
bar(kk,f_hn); axis([-.5 N-.5 0 1.1]); 
title('Hanning-Fenster'); 
ylabel('f(k)');
xlabel('k');

figure; 
plot(fT,20*log10(aF_hn+eps));  
hold on; 
axis([0 1 -150 10]);
text(.3,a_hn+15,sprintf('a_{min} = %3.1f dB', -a_hn));
plot([0 1.9],[a_hn a_hn],'--'); 
title('|Normierte Spektralfunktion|');
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB'); 
xlabel('Omega/2pi = f T');

input('....Zum Fortfahren: RETURN druecken');

% HAMMING-Fenster
figure;           
bar(kk,f_hm); 
axis([-.5 N-.5 0 1.1]); 
title('Hamming-Fenster'); 
ylabel('f(k)');
xlabel('k'); 

figure; 
plot(fT,20*log10(aF_hm+eps));  
hold on; 
axis([0 1 -150 10]);
text(.3,a_hm+15,sprintf('a_{min} = %3.1f dB', -a_hm));
plot([0 1.9],[a_hm a_hm],'--'); 
title('|Normierte Spektralfunktion|'); 
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB'); 
xlabel('Omega/2pi = f T'); 

input('....Zum Fortfahren: RETURN druecken');

% BLACKMAN-Fenster
figure;           
bar(kk,f_bl); 
axis([-.5 N-.5 0 1.1]); 
title('Blackman-Fenster'); 
ylabel('f(k)');
xlabel('k');

figure; 
plot(fT,20*log10(aF_bl+eps));  
hold on; 
axis([0 1 -150 10]);
text(.3,a_bl+15,sprintf('a_{min} = %3.1f dB', -a_bl));
plot([0 1.9],[a_bl a_bl],'--'); 
title('|Normierte Spektralfunktion|');
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB'); 
xlabel('Omega/2pi = f T');

input('....Zum Fortfahren: RETURN druecken');

% DOLPH-TSCHEBYSCHEFF-1
figure;           
bar(kk,f_d1); 
axis([-.5 N-.5 0 1.1]);
title(sprintf('Dolph-Tscheby.,%3.1fdB',a_d1));
ylabel('f(k)'); 
xlabel('k');

figure; 
plot(fT,20*log10(aF_d1+eps)); 
hold on; 
axis([0 1 -150 10]);
text(.3,-a_d1+15,sprintf('a_{min} = %3.1f dB',a_d1));
title('|Normierte Spektralfunktion|'); 
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB');
xlabel('Omega/2pi = f T'); 

input('....Zum Fortfahren: RETURN druecken');

% DOLPH-TSCHEBYSCHEFF-2
figure;           
bar(kk,f_d2); 
axis([-.5 N-.5 0 1.1]);
title(sprintf('Dolph-Tscheby.,%3.1fdB',a_d2));
ylabel('f(k)'); 
xlabel('k');

figure; 
plot(fT,20*log10(aF_d2+eps)); 
hold on; 
axis([0 1 -150 10]);
text(.3,-a_d2+15,sprintf('a_{min} = %3.1f dB',a_d2));
title('|Normierte Spektralfunktion|'); 
ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB');
xlabel('Omega/2pi = f T');                          
% #####  EOF  #####