% ##################################################################################
% ##  Funktion: lblack.m; Berechnung des Blackman-Tuckey-Leistungsdichtespektrums ##
% ##  --------------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lrader.m                                          ##
% ##################################################################################
%
% function Sxx = lblack(x,M,windowtype[,NFFT]);
%
% Schaetzung der spektralen Leistungsdichte nach Blackman-Tukey (1958)
%   x           Datenfolge (Zeilen- oder Spaltenvektor)
%   M           Anzahl der verwendeten Autokorrelationswerte
%               (sollte Zweierpotenz sein):  rxx(-(M-1)), ..., rxx(M-1)
%   windowtype  Fensterfunktion (String, z.B. 'hamming'),
%  [NFFT]       FFT-Laenge (optional)

function Sxx = lblack(x,M,windowtype,NFFT)

rxx = lrader(M,x);                  % rxx = [rxx(0); ...; rxx(M-1)]
rxx = [flipud(conj(rxx(2:M))); rxx];  % Konj. gerade Ergaenzung
% => Laenge 2M-1
eval(['fenster= ', windowtype,'(2*M-1);']); % Fensterfunktion der Laenge
if nargin<4, NFFT=nextpow2(length(x)); end; % 2M-1 berechnen
Sxx = abs(fft(rxx.*(fenster),NFFT));
% #####  EOF  #####
