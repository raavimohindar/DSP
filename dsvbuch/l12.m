% ##############################################################################
% ##  Loesung:   Filterstrukturen                                             ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lcascade.m                                    ##
% ##############################################################################

% #####  Teilaufgabe b:  Filterkoeffizienten berechnen  #####
[b a] = ellip(7,0.1,40,0.4); % Filter entwerfen
[B A] = lcascade(b,a);       % 3-te kanonische Form
[Hg W] = freqz(b,a,512);     % Uebertragungsfunktion des Gesamtsystems
[m n] = size(B);              
Hi = zeros(512,m);


for k=1:m;                 
    Hi(:,k) = freqz(B(k,:),A(k,:),512);
end;

% Produkt der Uebertragungsfunktionen der Teilsysteme
H3k = Hi(:,1) .* Hi(:,2) .* Hi(:,3) .* Hi(:,4);

% # grafische Ausgabe # %
figure;
plot(W/pi,20*log10(abs(H3k)),'--b'); 
hold on;
plot(W/pi,20*log10(abs(Hg)),'-.b');  
hold off;
grid; 
xlabel('Omega/pi (Nyquist = 1)'); 
ylabel('|H(exp(j*Omega))| in dB');
title('-- Gesamtsystem, -.Produkt der Teilsysteme');
% #####  EOF  #####
