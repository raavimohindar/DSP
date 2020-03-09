% ##############################################################################
% ##  Loesung:  Korrelationsfolgen                                            ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  ldtft.m                                       ##
% ##############################################################################

% #####  Teilaufgabe a:  weisse Rauschfolge  #####
n = randn(800,1);
kappa = -799:799;
s_biased   = xcorr(n,'biased').';
s_unbiased = xcorr(n,'unbiased').';
s_coeff    = xcorr(n,'coeff').';

% # grafische Ausgabe # %
% Autokorrelationsfolge: Nicht erwartungstreu
figure; 
stem(kappa,s_biased);   
grid; 
xlabel('kappa'); 
ylabel('Amplitude'); 
title('Autokorrelationsfolge: Nicht erwartungstreu');

% Autokorrelationsfolge: erwartungstreu
figure; 
stem(kappa,s_unbiased); 
grid; 
xlabel('kappa'); 
ylabel('Amplitude'); 
title('Autokorrelationsfolge: erwartungstreu');

% Autokorrelationsfolge: auf time-lag Null normiert
figure; 
stem(kappa,s_coeff);    
grid; 
xlabel('kappa'); 
ylabel('Amplitude'); 
title('Autokorrelationsfolge: auf time-lag Null normiert');

% #####  Teilaufgabe b:  Leistungsdichtespektrum  #####
n = randn(200,1);
s = xcorr(n,'biased');
[S W] = ldtft(s,512);

% # grafische Ausgabe # %
figure; 
semilogy(W/pi, abs(S) ); % normierte Frequenz
grid; 
xlabel('Omega/pi'); 
ylabel('|S_xx(exp(j*Omega))|'); 
title('Leistungsdichtespektrum');
% #####  EOF  #####
