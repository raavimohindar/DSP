% ##################################################################################
% ##  Funktion:  lnotchdesign.m;                                                  ##
% ##  Dimensionierung eines digitalen Notch-Filters 2. Ordnung                    ##
% ##################################################################################
%
%  function [a,b] = lnotchdesign(Omega0,beta)
%
%  Die Funktion fuellt eine Sequenz X mit l-1 Nullen zwischen jedem Wert von X auf.  
%
%  Omega0 : normierte Frequenz, die unterdrueckt werden soll  
%           -pi .. pi
%    beta : Position der Polstellen
%
%       a : Nennerkoeffizienten des Filters
%       b : Zaehlerkoeffizienten des Filters

function [a,b]=notchdesign(Omega0,beta)

% Koeffizienten "per Hand" ausgerechnet
b=[1; -2*cos(Omega0); 1]           % [b0; b1; b2]
a=[1; -2*beta*cos(Omega0); beta^2] % [a0; a1; a2]


%% andere Moeglichkeit:
%% Koefizienten mit "poly" aus den Pol- und Nullstellen ausrechnen
% nullstellen=[exp(j*Omega0); exp(-j*Omega0)];
% polstellen=beta*[exp(j*Omega0); exp(-j*Omega0)];
% b=poly(nullstellen).'
% a=poly(polstellen).'
% ##### EOF #####
