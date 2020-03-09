% ##################################################################################
% ##  Funktion  lafplot.m                                                         ##
% ##################################################################################
% AFPLOT  Stellt die  Fourier-Transformierte eines "ANALOGEN" Signals dar.
%    Aufruf:  lafplot( xa, dt )
%       xa :  "ANALOGES" Signal
%       dt :  Abtastinterval fuer die Simulation von xa(t)

function  lafplot( xa, dt )

l  = length(xa);
Nfft = round( 2 .^ nextpow2(5*l) );
Xa = fft(xa, Nfft);
range = 0:(Nfft/4);
ff = range/Nfft/dt;

plot( ff/1000, abs( Xa(1+range) ) );
title('Zeitkontinuierliche Fourier-Transformation (Betrag)');
xlabel('Frequenz (kHz)'); grid
% #####  EOF  #####
