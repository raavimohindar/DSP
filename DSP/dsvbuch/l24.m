% ##############################################################################
% ##  Loesung:  Spektraltransformation reeller Bandpass-Signale               ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lband.m                                       ##
% ##############################################################################

NFFT = 2^10;
b1 = lband(1000,0.2,0.02);  
fT = 0:1/NFFT:1-1/NFFT;

% Originalsignal
b2 = b1; 
lb = length(b2); 
aB2_hn = abs(fft(b2.*hanning(lb),NFFT));

% # grafische Ausgabe # %
figure; 
plot(fT, aB2_hn);
axis([0 1 0 1.1*max(aB2_hn)]); 
xlabel('Omega/2pi = f T');
ylabel('|B(exp(j*Omega))|');

for k=[9 10 11 12]                     %Unterabtastung um Faktor k
    b2 = b1(1:k:1000); 
    lb = length(b2); 
    aB2_hn = abs(fft(b2.*hanning(lb),NFFT));
    
    % # grafische Ausgabe # %
    figure; 
    plot(fT,aB2_hn); 
    axis([0 1 0 1.1*max(aB2_hn)]); 
    xlabel('Omega/2pi = f T');
    ylabel('|B_M(exp(j*Omega))|'); 
    title(sprintf('Unterabtastung um Faktor M=%d',k));
end;
% #####  EOF  #####
