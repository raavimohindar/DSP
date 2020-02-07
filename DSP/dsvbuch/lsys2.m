% ##################################################################################
% ##  Funktion:  lsys2.m; System 2. Ordnung - Realisierung                        ##
% ##################################################################################
%
%  function y = lsys2(x)
%
%  Die Funktion realisiert ein System 2. Ordnung
%       x : Eingangssignalvektor
%       y : Ausgangssignalvektor ==> Laenge(y) = Laenge(x)

function y = lsys2(x)

x=x(:);           % Spaltenvektor erzwingen
y=zeros(2,1);     % System ist vor Erregung im Ruhezustand
x=[zeros(2,1); x];% => alle Vergangenheitswerte sind 0

for k=3:length(x)
  y(k) = y(k-1) -0.5*y(k-2) +x(k) +1.5*x(k-1) +x(k-2);
end;

% Die ersten beiden Werte in y sind Vergangenheitswerte. => loeschen
y(1:2)=[]; 
% ##### EOF #####
