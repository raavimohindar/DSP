% ##################################################################################
% ##  Funktion: lburg_algo.m;   reiner Burg-Algorithmus                           ##
% ##################################################################################
%
% function [ARcoeff,g] = lburg_algo(y,N,q,MA,AR);
%
% Spektralschaetzung auf der Grundlage des Burg-Algorithmus'
% Input-Argumente:
%   y      : Datenfolge
%   N      : Laenge des Datenblockes
%   q      : Grad des Praediktorfehlerfilters
%   AR,MA  : Koeffizienten des ARMA-Modellfilters
% Output-Argumente:
%   ARcoeff: Koeffizienten des Burg-AR-Modells (Zeilenvektor)
%   g      : PARCOR-Koeffizienten

function [ARcoeff,g] = lburg(y,N,q,MA,AR)

y=y(:).' ;      %Erzwinge Zeilenvektor


% Initialisierung
e = y;          % Vorwaerts-Praediktorfehler
b = y;          % Rueckwaerts-Praediktorfehler

% Burg-Algorithmus
for ii = 1:q
  g(ii) = 2*e(2:N+1-ii)*b(1:N-ii)'/(e(2:N+1-ii)*e(2:N+1-ii)'+...
    b(1:N-ii)*b(1:N-ii)');
  e2 = e(2:N+1-ii) - g(ii)*b(1:N-ii);
  b  = b(1:N-ii)-conj(g(ii))*e(2:N+1-ii);
  e  = e2;
end;

ARcoeff = [1 -g(1)];  % Levinson-Durbin-Algorithmus
for i = 2:q
  ARcoeff = [ARcoeff 0]-fliplr(conj([ARcoeff 0]))*g(i);
end
% #####  EOF  #####
