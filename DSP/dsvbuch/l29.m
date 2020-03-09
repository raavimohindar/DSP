% ##############################################################################
% ##  Loesung: Verminderung des Leckeffektes durch Fensterung                 ##
% ##############################################################################

N    = 64;
kk   = (0:N-1);            kk2  = (0:2*N-1);
x1   = sin(kk*pi/8);       X1   = fft(x1);
x1Hm = x1.*hamming(N).';   X1Hm = fft(x1Hm);
x2   = sin(kk*pi/10);      X2   = fft(x2);
x2Hm = x2.*hamming(N).';   X2Hm = fft(x2Hm);

% # grafische Ausgabe # %
figure; 
stem(kk2, [x1 x1]);  
axis([0 2*N -1.1 1.1]);  
xlabel('k');
ylabel('x1((k))');
title('x1(k)=sin(k*pi/8), k=0..63, zweifach periodisch fortgesetzt'); 

figure; 
stem(kk, abs(X1));  
axis([0 N 0 1.1*N/2]);  
xlabel('n');
ylabel('|X1(n)|');
title('Betragsspektrum von x1(k)');

figure; 
stem(kk2, [x1Hm x1Hm]);  
axis([0 2*N -1.1 1.1]);  
xlabel('k');
ylabel('x1_Hm((k))');
title('Hamming-gefenstertes x1(k), zweifach periodisch fortgesetzt');

figure; 
stem(kk, abs(X1Hm));  
axis([0 N 0 1.1*N/2]);
xlabel('n');
ylabel('|X1_Hm(n)|');
title('Betragsspektrum bei Hamming-Fensterung'); 

input('......fuer 2.Datenfolge: RETURN druecken');

figure; 
stem(kk2, [x2 x2]);  
axis([0 2*N -1.1 1.1]);  
xlabel('k'); 
ylabel('x2((k))');
title('x2(k)=sin(k*pi/10), k=0..63, zweifach periodisch fortgesetzt'); 

figure; 
stem(kk, abs(X2));  
axis([0 N 0 1.1*N/2]);
xlabel('n');
ylabel('|X2(n)|');
title('Betragsspektrum von x2(k)'); 

figure; 
stem(kk2, [x2Hm x2Hm]);  
axis([0 2*N -1.1 1.1]);
xlabel('k');
ylabel('x2_Hm((k))');
title('Hamming-gefenstertes x2(k), zweifach periodisch fortgesetzt'); 

figure; 
stem(kk, abs(X2Hm));  
axis([0 N 0 1.1*N/2]);
xlabel('n');
ylabel('|X2_Hm(n)|');
title('Betragsspektrum bei Hamming-Fensterung');
% #####  EOF  #####
