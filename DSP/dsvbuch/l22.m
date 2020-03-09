% ##############################################################################
% ##  Loesung:  Alternative Berechnung der IFFT                               ##
% ##############################################################################

N  = 64;
x  = 1 - cos(2*pi/N*(0:N-1));
x0 = [x zeros(1,N)];

X0 = fft(x0);                % FFT
X1 = imag(X0) + j*real(X0);  % Re() und Im() vertauschen
x1 = fft(X1);                % Nochmalige FFT
x2 = imag(x1) + j*real(x1);  % Re() und Im() vertauschen

% # grafische Ausgabe # %
figure; 
bar(0:2*N-.5,x0); 
title('x0(k)'); 
xlabel('k'); 
axis([-.5 2*N-1 0 2.1]);

figure; 
bar(0:2*N-.5,x2); 
title('x2(k)'); 
xlabel('k'); 
axis([-.5 2*N-1 0 269]);
% #####  EOF  #####