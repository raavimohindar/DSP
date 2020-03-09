% ##################################################################################
% ##  Funktion: lwelch.m;   Welch- bzw. Bartlettverfahren                         ##
% ##################################################################################
%
% function Sxx = lwelch(x,K,windowtype[,NFFT[,overlap]])
%
% Schaetzung der spektralen Leistungsdichte nach dem Welch-Ansatz
%   x             Datenfolge (Zeilenvektor)
%   K             Anzahl der zu mittelnden Periodogramme = #Teilfolgen
%   windowtype    Fensterfunktion (z.B. 'hamming'=> Welch-Verfahren,
%                                       'boxcar' => Bartlett-Verfahren).
%  [NFFT]         FFT-Laenge (optional)
%  [overlap]      zusaetzliche Mittelung mit den Periodogrammen der 
%                 um fix(L/2) verschobenen Teilfolgen (falls das  
%                 optionale Argument vorhanden ist)
% Beispiel:  Sxx = lwelch(x,4,'boxcar',1024);

function Sxx = lwelch(x,K,windowtype,NFFT,overlap)

L = floor(length(x)/K);
if nargin<4, NFFT=nextpow2(L); end;
% Fensterfunktion der Laenge
eval(['fenster =',windowtype,'(L);']);  % L berechnen (Spaltenvektor)
AL  = fenster.'*fenster;                % Normierungskonstante
Sxx = zeros(1,NFFT);
kk  = (1:L);

for i = 0:K-1                           % Addition der Periodogramme
  yi = fenster.' .* x(kk+i*L);          % der nicht-ueberlappenden 
  Yi = fft(yi,NFFT);                    % Teilfolgen von x
  Sxx = Sxx + abs(Yi).^2;
end

if nargin > 4                           % zusaetzliche Addition der  
  kk  = (1:L) + fix(L/2);               % Periodogramme der ueber-
  for i = 0:K-2                         % lappenden Teilfolgen von x
    yi = fenster' .* x(kk+i*L);
    Yi = fft(yi,NFFT);
    Sxx = Sxx + abs(Yi).^2;
  end
  Sxx = Sxx/AL/(2*K-1);                 % Normierung auf AL und 
else                                    % Anzahl der Mittelungen (=2K-1)
  Sxx = Sxx/AL/K;                       % Normierung auf AL und
end                                     % Anzahl der Mittelungen (=K) 
% #####  EOF  #####
