% ##############################################################################
% ##  Loesung:  Burg-Algorithmus                                              ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lburg_algo.m                                  ##
% ##############################################################################

MA = [1]; 
AR = [1.0000 0.3611 -0.1373 0.2685 -0.0533 -0.3353 -0.307];
NFFT=2^10;

% #####  Teilaufgabe a:  AR-System, Einschwingverhalten #####
% exakte AKF (eingeschw. Zustand)
[h_arma,t] = impz(MA,AR,80);

% # grafische Ausgabe # %
figure;
stem(t,h_arma); 
grid; 
xlabel('k'); 
ylabel('h(k)');
title(sprintf('Impulsantwort des AR(%d)-Modells',length(AR)-1));

figure; 
[h1,h2,h3]=zplane(MA,AR); set(h1,'Visible','off');
title(sprintf('Pole des AR(%d)-Modells',length(AR)-1)); 
grid;
xlabel('Realteil'); 
ylabel('Imaginaerteil');

input('....Zum Fortfahren: RETURN druecken');

% #####  Teilaufgabe b:  AR-System, LDS #####
% Analyse der Filterordnung AR(n)
Omega_norm = 0:1/NFFT:1-1/NFFT;
Sxx_arma = abs(fft(MA,NFFT)./fft(AR,NFFT)).^2;
n = [2 length(AR)-1 32];
N = 2^13;
N_vor = 80;
Noise = randn(1,N+N_vor);
x_all = filter(MA,AR,Noise);
x = x_all(N_vor+1:length(x_all));

for k = 1:3
    ar = lburg_algo(x,N,n(k),MA,AR);
    Sxx_ar = abs(ones(1,NFFT)./fft(ar,NFFT)).^2;
    Sxx_ar = Sxx_ar/sum(Sxx_ar).*sum(Sxx_arma);
    % # grafische Ausgabe # %
    figure;
    h1 = plot(Omega_norm, 10*log10(Sxx_arma/max(Sxx_arma)),'r--');  
    hold on;
    h2 = plot(Omega_norm, 10*log10(Sxx_ar/max(Sxx_ar)),'b-');
    ylabel('S_{xx}(e^{j*\Omega}) in dB');
    title(sprintf('LDS von Burg-AR(%d), N=%d', n(k),N)); 
    xlabel('\Omega/2\pi'); 
    grid;
    legend([h1(1),h2(1)],'exaktes LDS','geschaetztes LDS',3);
    
    figure; 
    zplane(AR,ar); 
    title(sprintf('Pole von Burg-AR(%d)',n(k)));
    xlabel('Realteil'); 
    ylabel('Imaginaerteil'); 
    grid;
end;

input('....Zum Fortfahren: RETURN druecken');

% #####  Teilaufgabe c:  MA-System #####
% Analyse der Filterordnung AR(n)
MA = [1 -4 6 -4 1]; 
AR = 1;

% Einschwingverhalten
[h_arma,t] = impz(MA,AR);

% # grafische Ausgabe # %
figure; 
stem(t,h_arma); 
grid; 
xlabel('k'); 
ylabel('h(k)');
title(sprintf('Impulsantwort des MA(%d)-Modells',length(MA)-1));

figure; 
zplane(MA,AR);
title(sprintf('Pole des MA(%d)-Modells',length(MA)-1));
xlabel('Realteil'); 
ylabel('Imaginaerteil'); 
grid;

input('....Zum Fortfahren: RETURN druecken');

% Analyse der Filterordnung AR(n), LDS
Omega_norm  = 0:1/NFFT:1-1/NFFT;
Sxx_arma = abs(fft(MA,NFFT)./fft(AR,NFFT)).^2;

n = [2 6 32];
N = 2^13;
N_vor = 5;
noise = randn(1,N+N_vor);
x_all = filter(MA,AR,noise);
x = x_all(N_vor+1:length(x_all));

for k = 1:3
    ar = lburg_algo(x,N,n(k),MA,AR);
    Sxx_ar = abs(ones(1,NFFT)./fft(ar,NFFT)).^2;
    Sxx_ar = Sxx_ar/sum(Sxx_ar).*sum(Sxx_arma);
    
    % # grafische Ausgabe # %
    figure;
    Sxx_ar(find(Sxx_ar==0)) = 1e-10;
    Sxx_arma(find(Sxx_arma==0)) = 1e-10;
    h1 = plot(Omega_norm, 10*log10(Sxx_arma/max(Sxx_arma)),'r--');  
    hold on;
    h2 = plot(Omega_norm, 10*log10(Sxx_ar/max(Sxx_ar)),'b-');
    xlabel('\Omega/2\pi'); 
    ylabel('S_{xx}(e^{j*\Omega}) in dB');
    title(sprintf('LDS von Burg-AR(%d), N=%d', n(k),N)); 
    grid;
    legend([h1(1),h2(1)],'exaktes LDS','geschaetztes LDS',3);
    axis([0 1 -70 0]);
    
    figure; 
    zplane(AR,ar); 
    title(sprintf('Pole von Burg-AR(%d)',n(k)));
    xlabel('Realteil'); 
    ylabel('Imaginaerteil'); 
    grid;
end;
% #####  EOF  #####