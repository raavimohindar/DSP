% ##############################################################################
% ##  Loesung:  Sinus-Generator                                               ##
% ##############################################################################

% normierte dimensionslose Kreisfrequenz
Omega0 = 2*pi*1/32;

% #####  Teilaufgabe b:  Sinus-Generator  #####
b = [0 sin(Omega0) 0]
a = [1 -2*cos(Omega0) 1]

% abgetastetes Sinussignal
k = 0:99; 
x = sin(Omega0*k);

% # grafische Ausgabe # %
% Pol- und Nullstellen in der z-Ebene
figure; 
zplane(b,a);
xlabel('Realteil'); 
ylabel('Imaginärteil');
title('z-Ebene');

% Impulsantwort
figure; 
impz(b,a,100); 
xlabel('k'); 
ylabel('h(k)');
title('Impulsantwort');
hold on; 
plot(k,x,'r-'); 
hold off;

% #####  Teilaufgabe c:  Vorwaertszweig  #####
b = [1 0 0]
a = [1 -2*cos(Omega0) 1]

% # grafische Ausgabe # %
figure; 
impz(b,a,100); 
xlabel('k'); 
ylabel('h(k)');
title('Impulsantwort');

% #####  Teilaufgabe d:  Instabilitaet  #####
b = [0 sin(Omega0) 0]
a = [1 -2.1*cos(Omega0) 1]

% # grafische Ausgabe # %
% Pol- und Nullstellen in der z-Ebene
figure; 
zplane(b,a);
xlabel('Realteil'); 
ylabel('Imaginärteil');
title('z-Ebene');

% Impulsantwort
figure; 
impz(b,a,100); 
xlabel('k'); 
ylabel('h(k)');
title('Impulsantwort');
% #####  EOF  #####