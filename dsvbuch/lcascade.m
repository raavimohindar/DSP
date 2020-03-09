% ##################################################################################
% ##  Funktion  [B,A]=lcascade(b,a)                                               ##
% ##################################################################################
% Kaskadierung eines durch seine Uebertragungsfunktion gegebenes System in eine
% Kaskadenstruktur aus Systemen zweiter Ordnung. Die Zeilen von B und A beinhalten
% die Koeffizienten des Nenners bzw. des Zaehlers der zugehoerigen Systeme 
% zweiter Orndung.

function [B,A]=lcascade(b,a)

[z,p,k] = tf2zp(b,a);
sos = zp2sos(z,p,k);
B = sos(:,1:3);
A = sos(:,4:6);
% ##### EOF #####
