% ##############################################################################
% ##  Loesung:  DFT: Interpolation                                            ##
% ##############################################################################

N  = 64;
x  = 1-cos(2*pi/N*(0:N-1));    
X  = fft(x);

x0 = [x zeros(1,N)];           
X0 = fft(x0);

% # grafische Ausgabe # %
figure; 
stem(0:N-1,abs(X));
axis([0 N-1 0 max(X)]);
title('abs(X(n))');
xlabel('n');

figure; 
stem(0:2*N-1,abs(X0)); 
axis([0 2*N-1 0 max(X)]);
title('abs(X0(n))');
xlabel('n'); 
% #####  EOF  #####
