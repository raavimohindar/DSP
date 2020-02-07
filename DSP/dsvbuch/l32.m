% ##############################################################################
% ## Loesung: Schaetzung des Leistungsdichtespektrums nach Bartlett und Welch ##
% ## ----------------------------------------------------------------------   ##
% ## Benoetigte(s) m-File(s): lwelch.m                                        ##
% ##############################################################################

N     = 2^10; 
N_vor = 500; 

n  = randn(1,N+N_vor);             

h1 = [1 -4 6 -4 +1];  x1_all = filter(h1,1,n); x1=x1_all(N_vor+1:length(x1_all));
h2 = [1 0.8];         x2_all = filter(1,h2,n); x2=x2_all(N_vor+1:length(x2_all));

% "Wahres" Leistungsdichtespektrum zum Vergleich
NFFT = 2^10;                    
Sx1x1 = abs(fft(h1,NFFT)).^2;                axis_Sx1=[0 1 0  1.5*max(Sx1x1)];
Sx2x2 = ones(1,NFFT)./abs(fft(h2,NFFT)).^2;  axis_Sx2=[0 1 0  1.5*max(Sx2x2)];
fT = 0:1/NFFT:1-1/NFFT;
v_K = [1 4 16 64];

% BARTLETT fuer x1
win='boxcar';                                       
for k=v_K
    S_xx=lwelch(x1,k,win,NFFT);
    
    % # grafische Ausgabe # %
    figure; 
    plot(fT,S_xx); 
    hold on;
    plot(fT,Sx1x1,'--');
    axis(axis_Sx1);
    xlabel('\Omega/2\pi = f \cdot T');
    ylabel('S_{XX}(exp(j\cdot \Omega))');
    title(sprintf('Bartlett-Sch. von S_{X1X1}(exp(j*Om.); K=%d und L=%d/K',k, N));
    text(0.73,900,'== Periodogramm');
end;

input('......zum Fortfahren: RETURN druecken');

% WELCH-Verf. mit Hamming fuer x1
win='hamming';                       
for k=v_K
    S_xx=lwelch(x1,k,win,NFFT);

    % # grafische Ausgabe # %
    figure;  
    plot(fT,S_xx);  
    hold on; 
    plot(fT,Sx1x1,'--'); 
    axis(axis_Sx1);
    xlabel('\Omega/2\pi = f\cdot T');
    ylabel('S_{XX}(exp(j\cdot \Omega))');
    title(sprintf('Welch-Sch. von S_{X1X1}(exp(j*Om.)); K=%d und L=%d/K (Hamming)',k, N));
end;

input('......zum Fortfahren: RETURN druecken');

% BARTLETT fuer x2
win='boxcar';                                       
for k=v_K
    S_xx=lwelch(x2,k,win,NFFT);
    
    % # grafische Ausgabe # %
    figure; 
    plot(fT,S_xx);  
    hold on;
    plot(fT,Sx2x2,'--');
    axis(axis_Sx2); 
    xlabel('\Omega/2\pi = f\cdot T');
    ylabel('S_{XX}(exp(j \cdot \Omega))');
    title(sprintf('Bartlett-Sch. von S_{X2X2}(exp(j*Om.)); K=%d und L=%d/K',k, N));
    text(0.73,900,'== Periodogramm');
end;

input('......zum Fortfahren: RETURN druecken');

% WELCH-Verf. mit Hamming fuer x2
win='hamming';                       
for k=v_K
    S_xx=lwelch(x2,k,win,NFFT);
    
    % # grafische Ausgabe # %
    figure; 
    plot(fT,S_xx); 
    hold on;
    plot(fT,Sx2x2,'--');
    axis(axis_Sx2); 
    xlabel('\Omega/2\pi = f\cdot T');
    ylabel('S_{XX}(exp(j\cdot \Omega))');
    title(sprintf('Welch-Sch. von S_{X2X2}(exp(j*Om.)); K=%d und L=%d/K (Hamming)',k, N));
end; 
% #####  EOF  