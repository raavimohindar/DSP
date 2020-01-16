% ##############################################################################
% ##  Loesung:  Entwurf eines Hilbert-Transformators (Remez-Verfahren)        ##
% ##                                                                          ##
% ##  Die funktion remez() wurde durch die in Matlab7 verwendete Funktion     ##
% ##  firpm() ersetzt!                                                        ##
% ##                                                                          ##
% ##############################################################################

% #####  Teilaufgabe a:  Hilbert-Transformator entwerfen  #####
b1 = firpm(30,[0.05 0.95],[1 1],'h');
b2 = firpm(31,[0.05 1],[1 1],'h');

[H1 W1] = freqz(b1,1,512);
[H2 W2] = freqz(b2,1,512);

% # grafische Ausgabe # %
figure; 
plot(W1/pi,abs(H1)); 
grid; 
xlabel('Omega/pi');
ylabel('|H_H(exp(j*Omega))|'); 
title('Filterordnung: 30 Typ II');

figure; 
plot(W2/pi,abs(H2)); 
grid; 
xlabel('Omega/pi');
ylabel('|H_H(exp(j*Omega))|'); 
title('Filterordnung: 31 Typ IV');

figure; 
stem([0:30], b1); 
axis([0 30 -0.8 0.8]);     
grid; 
xlabel('k');
ylabel('Impulsantwort');       
title('Filterordnung: 30 Typ II');

figure; 
stem([0:31], b2); 
axis([0 31 -0.8 0.8]);     
grid; 
xlabel('k');
ylabel('Impulsantwort');       
title('Filterordnung: 31 Typ IV');

% #####  Teilaufgabe b:  Ausgangssignal filtern  #####
b  = firpm(30,[0.05 0.95],[1 1],'h');
Fs = 1000;
t  = (0:1/Fs:2)';
x  = sin(2*pi*50*t);
xh = filter(b,1,x);

figure;
zplane(b); 
xlabel('Realteil'); 
ylabel('Imaginaerteil');
title('Pol-Nullstellen-Diagramm');

xd = [zeros(15,1); x(1:length(x)-15)];  % delay 15 samples

figure; 
plot(t(1:50),xd(1:50),t(1:50),xh(1:50),'--'); 
grid; 
xlabel('Zeit (sek)');
ylabel('Amplitude'); 
title(' - Eingangssig.   -- Ausgangssig.');

% #####  Teilaufgabe c:  Hilbert-Tranformierte berechnen  #####
Fs = 1000;
t  = (0:1/Fs:2)';
x  = sin(2*pi*50*t);
y = hilbert(x);

figure; 
plot(t(1:50), real(y(1:50))); 
grid; 
hold on;
plot(t(1:50), imag(y(1:50)),'--'); 
xlabel('Zeit (sek)'); 
ylabel('Amplitude');
title('-- Hilbert-Transform.   - Original');
% #####  EOF  #####
