% ##################################################################################
% ##  Funktion: lsum.m;  AKF-Schaetzung mit Summenformel                          ##
% ##################################################################################
%
%  function rxx = lsum(M,x)
%
%  Nicht erwartungstreue AKF-Schaetzung durch Vektormultiplikation
%  Der Parameter M entspricht dem (Maximalwert-1) fuer lambda. 
%  Der Vektor x mit den Signalwerten darf eine beliebige Dimension 
%  annehmen und kann als Spalten- oder Zeilenvektor uebergeben werden. 
%  Die Ausgabe erfolgt als Spaltenvektor der Dimension M sowie nur fuer 
%  positive lambda-Werte:  rxx = [rxx(0), ..., rxx(M-1)].
%  Fuer negative lambda ist eine konj. gerade Ergaenzung vorzunehmen.

function rxx = lsum(M,x)

x = x(:);                        % Spaltenvektoren erzeugen
N = length(x);
r0 = x'*x;
r = zeros(M-1,1);
for ii = 1:M-1
  r(ii) = [zeros(1,ii) x'] * [x; zeros(ii,1)];
end
rxx=[r0; r]./N;                 % Nicht erwartungstreue AKF-Schaetzung
% rxx=[r0; r]./(N:-1:N-(M-1));  % Erwartungstreue AKF-Schaetzung
% #####  EOF  #####
