% ##################################################################################
% ##  Funktion: lband.m; Erzeugung eines reellen Bandpass-Signals                 ##
% ##################################################################################
%
%  function b = lband(N,fm_norm,b_norm);
%
%  N Datenwerte eines reellen Bandpass-Signals mit der normierten
%  Mittenfrequenz  fm_norm=fm/fa  und der normierten Bandbreite 
%  b_norm=b/fa  werden erzeugt.

function b = lband(N,fm_norm,b_norm);

b = zeros(1,N);
for nu = -5:5
  b = b + (1+nu/10)*cos(2*pi*(fm_norm + b_norm*nu/10)*(1:N));
end
b = b.'/11;
% #####  EOF  #####
