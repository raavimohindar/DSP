% ##################################################################################
% ##  Funktion: lper.m;  Berechnung des Periodogramms                             ##
% ##################################################################################
%
% function Sxx = lper(x[,NFFT])
%
% Schaetzung der spektralen Leistungsdichte mittels Periodogramm
%   x        Datenfolge (Zeilen- oder Spaltenvektor)
%  [NFFT]    FFT-Laenge (optional)

function Sxx = lper(x,NFFT)

N = length(x);
if nargin<2, NFFT=pow2(nextpow2(N)); end;
X = fft(x,NFFT);
Sxx = (abs(X).^2)./N;
% #####  EOF  #####
