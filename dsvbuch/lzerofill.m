% ##################################################################################
% ##  Funktion:  lzerofill.m; Sequenz mit Nullen fuellen                          ##
% ##################################################################################
%
%  function y = lzerofill(x,l)
%
%  Die Funktion fuellt eine Sequenz X mit l-1 Nullen zwischen jedem Wert von X auf.  
%       x : Eingangssignalvektor
%       l : l-1 Nullen zwischen jedem Abtastwert
%       y : Ausgangssignalvektor ==> Laenge(y) = l*Laenge(x)
%           NOTE: Falls X eine Matrix ist, wird zerofill auf
%                 jede Spalte angewendet.

function y = lzerofill(x,l)

[M,N] = size(x);
if M==1                  % <--- fuer Vektoren
  y = zeros(1, N*l);
  y(1,1:l:N*l) = x;
else                     % <--- Fuer Matrizen
  y = zeros(M*l, N);
  y(1:l:M*l,:) = x;
end
% ##### EOF #####
