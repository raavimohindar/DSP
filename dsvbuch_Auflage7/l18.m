% ##############################################################################
% ##  Loesung:  Entwurf eines Differenzieres (Remez-Verfahren)                ##
% ##                                                                          ##
% ##  Die funktion remez() wurde durch die in Matlab7 verwendete Funktion     ##
% ##  firpm() ersetzt!                                                        ##
% ##                                                                          ##
% ##############################################################################

% #####  Teilaufgabe a: Differenzierer entwerfen  ##############################
f = [0 1];          % Frequenzen der Sperr- und Durchlassbereiche
m = [0 1];          % Impulsantwort
b1 = firpm(22,f,m);

f = [0 0.9]; 
m = [0 1];   
b2 = firpm(21,f,m);

[H1 W1] = freqz(b1,1,512); 
[H2 W2] = freqz(b2,1,512); 

% # grafise Ausgabe # %
figure; 
plot(W1/pi,abs(H1) ); 
grid; 
xlabel('Omega/pi');
ylabel('|H(exp(j*Omega))|'); 
title('Entwurfsparameter: 22, Filterordnung: 23, Typ I');

figure; 
plot(W2/pi,abs(H2) ); 
grid; 
xlabel('Omega/pi');
ylabel('|H(exp(j*Omega))|'); 
title('Entwurfsparameter: 21, Filterordnung: 22, Typ III');

figure; 
stem([0:22], b1); 
axis([0 22 -0.3 0.5]);       
grid; 
xlabel('k');
ylabel('Impulsantwort');     
title('Entwurfsparameter: 22, Filterordnung: 23, Typ I');

figure; 
stem(0:length(b2)-1, b2); 
axis([0 length(b2)-1 -0.3 0.5]);
grid; 
xlabel('k');
ylabel('Impulsantwort');     
title('Entwurfsparameter: 21, Filterordnung: 22, Typ III');

% #####  Teilaufgabe b: Uebertragungsfunktion vergleichen  #####################
f = [0 1];   
m = [0 1];   
b2 = firpm(21,f,m,'d');

f = [0 0.9]; 
m = [0 1];   
b1 = firpm(22,f,m,'d');

[H1 W] = freqz(b1,1,512); 
[H2 W] = freqz(b2,1,512); 

figure; 
plot(W1/pi,abs(H1) ); 
grid; 
xlabel('Omega/pi');
ylabel('|H_D(exp(j*Omega))|'); 
title('Filterordnung: 22, Typ II');

figure;
plot(W2/pi,abs(H2));  
grid; 
xlabel('Omega/pi');
ylabel('|H_D(exp(j*Omega))|');
title('Filterordnung: 21, Typ IV');

figure; 
stem([0:22], b1);
axis([0 22 -0.4 0.5]);      
grid; 
xlabel('k');
ylabel('Impulsantwort');       
title('Filterordnung: 22, Typ II');

figure;
stem([0:21], b2);
axis([0 21 -0.4 0.5]);    
grid;
xlabel('k');
ylabel('Impulsantwort');
title('Filterordnung: 21, Typ IV');
% #####  EOF  #####