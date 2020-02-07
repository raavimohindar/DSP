% ##################################################################################
% ##  Funktion: lyw.m;   Yule-Walker-Methode/Autokorrelationsm.                   ##
% ##################################################################################
%
% function [ARcoeff,g,var]=lyw(x,n,lev)
%
% Spektralschaetzung auf der Grundlage der Yule-Walker-Methode/Autokorrelationsm.
% Input-Argumente:
%   x      : Datenfolge
%   n      : Ordnung des AR(n)-Modells
%   lev    : Levinson-Durbin oder einfahce Inversion
% Output-Argumente:
%   ARcoeff: Koeffizienten (Zeilenvektor)
%         g: PARCOR-Koeffizienten (nur bei Lev.-Durb.)
%       var: Vorwaertspraediktorfehlerleistung jeder Stufe (nur bei Lev.-Durb.)

function [ARcoeff,g,var]=lyw(x,n,lev)

rxx_hat_all=xcorr(x,'biased');
index=(length(rxx_hat_all)+1)/2;
rxx_hat=rxx_hat_all(index:index+n);

% Inversion mit inv-Befehl

switch lev;
case 0; 
  Rxx_hat  = toeplitz(rxx_hat(1:n).'); 
  ARcoeff = -inv(Rxx_hat)*rxx_hat(2:n+1);
  ARcoeff = [1 ARcoeff.'];
  var=[];
  g=[];
  
  %Levinson-Durbin-Rekursion
  
case 1;
  var=rxx_hat(1);
  g(1)=rxx_hat(2)/rxx_hat(1);
  var=[var (1-abs(g(1)).^2)*var];
  ARcoeff = [1 -g(1)];
  
  for i = 2:n
    g(i)=(ARcoeff*rxx_hat(i+1:-1:2).')./var(i);
    var=[var (1-abs(g(i)).^2)*var(i)];
    ARcoeff = [ARcoeff 0]-fliplr(conj([ARcoeff 0]))*g(i);
  end;
end;
% #####  EOF  #####
