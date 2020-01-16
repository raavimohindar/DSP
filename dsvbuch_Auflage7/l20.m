% ##############################################################################
% ##  Loesung:  Diskrete Fouriertransformation (DFT)                          ##
% ##############################################################################

% #####  Teilaufgabe a:  DFT von x(k) berechnen  #####
kk = 0:15;
x  = kk + j*(7-kk);
xr = real(x);  
xi = imag(x);

X  = fft(x); 
Xr = real(X);  
Xi = imag(X);

% # grafische Ausgabe # %
% Realteil
figure;
stem(kk,Xr);
title('Re(X(n))');
xlabel('n'); 
grid;

% Imaginärteil
figure;
stem(kk,Xi);
title('Im(X(n))');
xlabel('n');
grid;

input('....Fuer naechste Teilaufgabe: RETURN druecken');

% #####  Teilaufgabe b:  DFT von Re{x(k)} und Im{x(k)}  #####
% # grafische Ausgabe # %
figure;stem(kk,real(fft(xr)));  title('Re(FFT(Re(x(k))))');  xlabel('n');grid;
figure;stem(kk,imag(fft(xr)));  title('Im(FFT(Re(x(k))))');  xlabel('n');grid;
figure;stem(kk,real(fft(j*xi)));title('Re(FFT(j*Im(x(k))))');xlabel('n');grid;
figure;stem(kk,imag(fft(j*xi)));title('Im(FFT(j*Im(x(k))))');xlabel('n');grid;

input('....Fuer naechste Teilaufgabe: RETURN druecken');

% #####  Teilaufgabe c:  Zyklische Verschiebung  #####
xtmp = [x x];
x1_04 = xtmp(kk+5); 
X1_04 = fft(x1_04);
x1_08 = xtmp(kk+9); 
X1_08 = fft(x1_08);

figure;stem(kk,Xr);         title('Re(X(n))');           xlabel('n');grid;
figure;stem(kk,Xi);         title('Im(X(n))');           xlabel('n');grid;
figure;stem(kk,real(X1_04));title('Re(X1(n)), lambda=4');xlabel('n');grid;
figure;stem(kk,imag(X1_04));title('Im(X1(n)), lambda=4');xlabel('n');grid;
figure;stem(kk,real(X1_08));title('Re(X1(n)), lambda=8');xlabel('n'); grid;
figure;stem(kk,imag(X1_08));title('Im(X1(n)), lambda=8');xlabel('n'); grid;

input('....Fuer naechste Teilaufgabe: RETURN druecken');

% #####  Teilaufgabe d:  Multiplikation mit exp(j*...)  #####
x2 = x.*exp(-j*2*pi*3*kk/16);
X2 = fft(x2);

figure;stem(kk,Xr);      title('Re(X(n))'); xlabel('n');grid;
figure;stem(kk,Xi);      title('Im(X(n))'); xlabel('n');grid;
figure;stem(kk,real(X2));title('Re(X2(n))');xlabel('n');grid;
figure;stem(kk,imag(X2));title('Im(X2(n))');xlabel('n');grid;
% #####  EOF  #####