% ##############################################################################
% ##  Loesung:  DFT reeller Datenfolgen                                       ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lfft.m                                        ##
% ##############################################################################

N = 2^10;
x = randn(1,N);
X1 = fft(x);
X2 = lfft(x);
differenz = mean(abs(X1-X2).^2)
% #####  EOF  #####