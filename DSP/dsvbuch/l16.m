% ##############################################################################
% ##  Loesung:  Entwurf nichtrekursiver Filter mittels Fensterung             ##
% ##############################################################################

% #####  Teilaufgabe a: Tiefpass entwerfen  ####################################
% Filterkoeffizienten            % Frequenzgang
bR  = fir1(50,0.4,boxcar(51));   [HR W]  = freqz(bR,1,512);
bH  = fir1(50,0.4,hanning(51));  [HH W]  = freqz(bH,1,512);
bHm = fir1(50,0.4,hamming(51));  [HHM W] = freqz(bHm,1,512);
bB  = fir1(50,0.4,blackman(51)); [HB W]  = freqz(bB,512);
bK  = fir1(50,0.4,kaiser(51,8)); [HK W]  = freqz(bK,512);

% # grafische Ausgabe # %
% Betragsfrequenzgänge
figure;
plot(W/pi,20*log10(abs(HR/max(HR))));        
hold on;
plot(W/pi,20*log10(abs(HH/max(HH))),'--');
plot(W/pi,20*log10(abs(HHM/max(HHM))),'-.'); 
hold off;
xlabel('Omega/pi'); 
ylabel('|H(exp(j*Omega))/H(1)| in dB'); 
grid
title(['Tiefpass: - Rechteck -- von Hann  -. Hamming']); 
axis([0 1 -150 0]); 

figure;
plot(W/pi,20*log10(abs(HB/max(HB))),'-');    
hold on;
plot(W/pi,20*log10(abs(HK/max(HK))),'--');   
hold off;
xlabel('Omega/pi'); ylabel('|H(exp(j*Omega))/H(1)| in dB'); grid
title(['Tiefpass: - Blackman -- Kaiser mit beta=8']);   axis([0 1 -150 0]);

% #####  Teilaufgabe b: Hochpass entwerfen  ####################################
% Filterkoeffizienten    % Frequenzgang 
b = fir1(33,0.4,'high'); [H W] = freqz(b,1,512);

% # grafische Ausgabe # %
% Hochpass
figure;
plot(W/pi,20*log10(abs(H/max(H)))); 
grid;
xlabel('Omega/pi'); 
ylabel('|H(exp(j*Omega))/H(-1)| in dB'); 
title('Hochpass');

% #####  Teilaufgabe c: Gruppenlaufzeit bestimmen  #############################
figure;
b = fir1(50,0.4);  % Filterkoeffizienten
grpdelay(b,1,256); % Berechnung der Gruppenlaufzeit und grafische Ausgabe
title('Gruppenlaufzeit in Abtastwerten'); 
ylabel(''); 
xlabel('Omega/pi');
axis([0 1 24 26]);
% #####  EOF  #####
