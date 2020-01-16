% ##################################################################################
% ##  Funktion  X=lfxquant(s,bit)                                                 ##
% ##################################################################################
% Funktion quantisiert das Signal S auf eine Wortlaenge von BIT bits auf das
% Intervall [-1,1). Dabei wird auf den naechst hoeheren Wert innerhalb des 
% Intervalls (Saettigung) aufgerundet.    

function X=lfxquant(s,bit)

if nargin ~= 2;
  error('Aufruf: lfxquant( S, BIT ).');
end;
if bit <= 0 | abs(rem(bit,1)) > eps;
  error('Wortlaenge muss ein positiver Integer sein');
end;
Plus1 = 2^(bit-1);
X = s * Plus1;
X = round(X);                     
X = min(Plus1 - 1,X);  % Saettigung
X = max(-Plus1,X);
X = X / Plus1;
% ##### EOF #####
