% ##############################################################################
% ##  Loesung:  Eulersche Beziehung                                           ##
% ##############################################################################

% #####  Teilaufgabe a:  Sinussignal  #####
k=0:95;
x=sin(2*pi/32*k);

% # grafische Ausgabe # %
figure;
stem(k/32,x);           % Darstellung der Abtastwerte
hold on; 
plot(k/32,x,'y');       % Darstellung des kontinuierlichen Sinussignals
plot([0 3], [0 0],'k'); 
hold off;
title('Sinus-Funktion x(k)'); 
xlabel('k/32'); 
ylabel('x(k)');

% #####  Teilaufgabe b:  Real- und Imaginaerteil  #####
y=exp(j*2*pi/32*k);

% # grafische Ausgabe #%
% komplexe Ebene
figure; 
plot(real(y),imag(y),'bo-');
hold on; 
plot([-1 1], [0 0],'k'); 
plot([0 0 ],[-1 1],'k'); 
hold off; 
axis square
title('komplexwertige Exponentialfolge y(k)'); 
xlabel('Realteil'); ylabel('Imaginaerteil'); 

% Realteil
figure; 
plot(k/32,real(y));
hold on; 
plot([0 3], [0 0],'k'); 
hold off;
xlabel('k/32'); 
ylabel('Re\{y(k)\}');

% Imaginaerteil
figure; 
plot(k/32,imag(y)); 
hold on; 
plot([0 3], [0 0],'k'); 
hold off;
xlabel('k/32'); 
ylabel('Im\{y(k)\}');

% Betrag
figure; 
plot(k/32,abs(y));  
hold on; 
plot([0 3], [0 0],'k'); 
hold off;
axis([-0.05 3 0 1.1]); 
xlabel('k/32'); 
ylabel('|y(k)|');


% #####  Teilaufgabe c:  Eulersche Beziehung => Sinus #####
z = -j*0.5 *(exp(j*2*pi/32*k) - exp(-j*2*pi/32*k));

% # grafische Ausgabe #%
figure
stem(k/32,z,'y');
hold on; 
plot(k/32,x,'b-'); 
plot([0 3], [0 0],'k'); 
hold off;
title('Sinus-Funktion nach Euler'); 
xlabel('k/32'); 
ylabel('Amplitude');
% #####  EOF  #####
