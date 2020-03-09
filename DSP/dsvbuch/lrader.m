% ##################################################################################
% ## Funktion: lrader.m ; AKF-Schaetzung mit Raderverfahren                       ##
% ##################################################################################
%
%  function rxx  = lrader(M,x) 
%
%  Nicht erwartungstreue AKF-Schaetzung nach dem Rader-Verfahren.
%  Der Parameter M muss eine Zweierpotenz sein und entspricht dem 
%  (Maximalwert+1) fuer lambda. Der Vektor x mit den Signalwerten  
%  darf eine beliebige Dimension annehmen und kann als Spalten- oder
%  Zeilenvektor uebergeben werden. Die Ausgabe erfolgt als Spalten-
%  vektor der Dimension M sowie nur fuer positive lambda-Werte:
%  rxx = [rxx(0), ..., rxx(M-1)].
%  Fuer negative lambda ist eine konj. gerade Ergaenzung vorzunehmen.

function rxx  = lrader(M,x)
x = x(:);                            % Spaltenvektoren erzeugen
N = length(x);
u = zeros(2*M,1);
u(1:M) = x(1:M);
U = fft(u);
K = floor(N/M);
v = zeros(2*M,1);
Sxx = zeros(2*M,1);
pm = (-1).^(0:(2*M-1)).';

for ii = 1:(K-1)                     % Iteration und Akkumulation
  v(1:M) = x((ii*M+1):((ii+1)*M));
  V = fft(v);
  Sxx = Sxx + (conj(U) .*(U + (pm .*V)));
  U = V;
end;
if K < N/M
  b = N - K*M;
  v = zeros(2*M,1);
  v(1:b) = x((K*M+1):N);
  V = fft(v);
  Sxx = Sxx + (conj(U) .*(U + (pm .*V)));
end;
Sxx = Sxx + abs(V.^2);
rxx = ifft(Sxx)/N;
rxx = rxx(1:M);
% #####  EOF  #####
