% ##############################################################################
% ##  Loesung:  System 2. Ordnung                                             ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lsys2.m                                       ##
% ##############################################################################

% #####  Teilaufgabe c: Impulsantwort  #####
x=[1;zeros(20,1)];  % Eingangsvektor
lsys2(x)            % lsys2: zu programmierende Funktion

% #####  Teilaufgabe d: Frequenzgang und z-Ebene  #####
% Koeffizientenvektoren der Übertragungsfunktion
b=[1 1.5 1];
a=[1 -1 0.5];

% Berechnung des Frequenzgangs
[H,w]=freqz(b,a,256);

% # grafische Ausgabe # %
% Frequenzgang
figure;
plot(w/pi,20*log10(abs(H))); 
grid on; 
axis([0 1 -35 25]); 
xlabel('\Omega/\pi'); 
ylabel('|H(e^{j \Omega})| in dB');

% Pol- und Nullstellen in der z-Ebene
figure;
zplane(b,a);
% #####  EOF  #####
