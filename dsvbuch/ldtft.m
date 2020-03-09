% ##################################################################################
% ##  Funktion  [H, W] = ldtft(h, N)                                              ##
% ##################################################################################
% DTFT   Berechnet die DTFT an N aequidistanten Frequenzstuetzstellen.
%   Aufruf:   [H, W] = ldtft(h, N)
%       h : Eingabevektor der Laenge L
%       N : Anzahl der Frequenzen im Intervall [-pi,pi); (N >= L)
%       H : DTFT Werte (komplexwertig)
%       W : Vektor der Stuetzstellen, an denen die DTFT berechnet wurde

function [H, W] = ldtft(h, N)

N = fix(N);
L = length(h);  
h = h(:);       % nur Vektoren
if( N < L )
  error('DTFT: Anzahl Datenwerte muss kleiner sein als Anzahl Stuetzstellen')
end;
W = (2*pi/N) * [ 0:(N-1) ]';
mid = ceil(N/2) + 1;
W(mid:N) = W(mid:N) - 2*pi;   % <--- Verschiebung [pi,2pi) to [-pi,0)
W = fftshift(W);
H = fftshift( fft( h, N ) );  % <--- Verschiebung der negativen Frequenzen
% ##### EOF #####
