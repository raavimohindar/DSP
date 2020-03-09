% ##################################################################################
% ##  Funktion: lcov.m;   Kovarianz-Methode                                       ##
% ##################################################################################
%
% function [ARcoeff] = lcov(x,n);
%
% Spektralschaetzung auf der Grundlage der Kovarianzmethode
% Input-Argumente:
%   x      : Datenfolge
%   n      : Ordnung des AR(n)-Modells
% Output-Argumente:
%   ARcoeff: Koeffizienten (Zeilenvektor)

function [ARcoeff]=lcov(x,n);

x=x(:);
X = toeplitz(x(n:-1:1),x(n:length(x)-1));
A1 = X*X';

xr = x(n+1:length(x));

A2 = X*xr;

a2 = A1^(-1)*A2;
ARcoeff = [1 ;-a2]';
% #####  EOF  #####
