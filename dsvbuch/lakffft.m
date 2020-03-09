% ##################################################################################
% ##  Funktion: lakffft      AKF-Schaetzung nach IDFT{|DFT{x}|^2}                 ##
% ##################################################################################
%
%  function rxx = lakffft(M,x)
%
%  Nicht erwartungstreue AKF-Schaetzung nach IDFT{|DFT{x}|^2}.
%  Der Parameter M entspricht dem Maximalwert fuer lambda.
%  Der Vektor x mit den Signalwerten darf eine beliebige Dimension 
%  annehmen und kann als Spalten- oder Zeilenvektor uebergeben werden.  
%  Die Ausgabe erfolgt als Spaltenvektor der Dimension M sowie nur fuer
%  positive lambda-Werte:  rxx = [rxx(0), ..., rxx(M-1)].
%  Fuer negative lambda ist eine konj. gerade Ergaenzung vorzunehmen.

function rxx = lakffft(M,x)

x = x(:);                        % Spaltenvektoren erzeugen 
N = length(x);
NFFT = pow2(nextpow2(N+M));       
X = fft(x,NFFT);
Sxx = abs(X.^2);
rxx = ifft(Sxx)./N;              
rxx = rxx(1:M);
% #####  EOF  #####
