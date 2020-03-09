% ##############################################################################
% ##  Loesung:  Schaetzung des Leistungsdichtespektrums nach Blackman-Tuckey  ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lblack.m und darin: lrader.m                  ##
% ##############################################################################

% Modellrauschprozesse
N     = 2^12;           % Anzahl der Abtastwerte um das System in den eingeschw.
N_vor = 500;            % Zustand zu setzen

n  = randn(1,N+N_vor);  

h1 = [1 -4 6 -4 +1]; x1_all = filter(h1,1,n); x1=x1_all(N_vor+1:length(x1_all));
h2 = [1 0.8];        x2_all = filter(1,h2,n); x2=x2_all(N_vor+1:length(x2_all));

% "Wahres" Leistungsdichtespektrum zum Vergleich berechnen
NFFT = 2^12;  
Sx1x1 = abs(fft(h1,NFFT)).^2;                axis_Sx1=[0 1 0 1.35*max(Sx1x1)];
Sx2x2 = ones(1,NFFT)./abs(fft(h2,NFFT)).^2;  axis_Sx2=[0 1 0 1.35*max(Sx2x2)];
fT = 0:1/NFFT:1-1/NFFT;

% Schaetzung des Leistungsdichtespektrums fuer M=8, 32, 128
win = 'triang';

Sxx_x1_8   = lblack(x1,8,win,NFFT);
Sxx_x1_32  = lblack(x1,32,win,NFFT); 
Sxx_x1_128 = lblack(x1,128,win,NFFT);

Sxx_x2_8   = lblack(x2,8,win,NFFT);
Sxx_x2_32  = lblack(x2,32,win,NFFT); 
Sxx_x2_128 = lblack(x2,128,win,NFFT); 

% # grafische Ausgabe # %
figure;
plot(fT,Sx1x1,'--'); 
hold on;  
plot(fT,Sxx_x1_8); 
xlabel('\Omega/2\pi = f \cdot T'); 
ylabel('S_{XX}(exp(j\cdot \Omega))');
title('Bl.-Tukey-Sch. von S_{X1X1}(exp(j\cdot \Omega)), M=8 (Dreieck)');
axis(axis_Sx1);  

figure;   
plot(fT,Sx1x1,'--'); 
hold on;  
plot(fT,Sxx_x1_32); 
xlabel('\Omega/2\pi = f \cdot T'); 
ylabel('S_{XX}(exp(j\cdot \Omega))');
title('Bl.-Tukey-Sch. von S_{X1X1}(exp(j\cdot \Omega)), M=32 (Dreieck)'); 
axis(axis_Sx1); 
 
figure;  
plot(fT,Sx1x1,'--');
hold on; 
plot(fT,Sxx_x1_128);
xlabel('\Omega/2\pi = f \cdot T'); 
ylabel('S_{XX}(exp(j\cdot \Omega))');
title('Bl.-Tukey-Sch. von S_{X1X1}(exp(j\cdot \Omega)), M=128 (Dreieck)'); 
axis(axis_Sx1); 

input('....Zum Fortfahren: RETURN druecken');

figure;   
plot(fT,Sx2x2,'--'); 
hold on;  
plot(fT,Sxx_x2_8); 
xlabel('\Omega/2\pi = f \cdot T'); 
ylabel('S_{XX}(exp(j\cdot \Omega))');
title('Bl.-Tukey-Sch. von S_{X2X2}(exp(j\cdot \Omega)), M=8 (Dreieck)');
axis(axis_Sx2);  

figure;
plot(fT,Sx2x2,'--'); 
hold on; 
plot(fT,Sxx_x2_32); 
xlabel('\Omega/2\pi = f \cdot T'); 
ylabel('S_{XX}(exp(j\cdot \Omega))');
title('Bl.-Tukey-Sch. von S_{X2X2}(exp(j\cdot \Omega)), M=32 (Dreieck)'); 
axis(axis_Sx2); 

figure;  
plot(fT,Sx2x2,'--');
hold on; 
plot(fT,Sxx_x2_128); 
xlabel('\Omega/2\pi = f \cdot T'); 
ylabel('S_{XX}(exp(j\cdot \Omega))');
title('Bl.-Tukey-Sch. von S_{X2X2}(exp(j\cdot \Omega)), M=128 (Dreieck)'); 
axis(axis_Sx2); 
% #####  EOF  #####
