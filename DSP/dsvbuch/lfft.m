% ##################################################################################
% ##  Funktion: lfft.m;  Fouriertransformation einer reellen Folge                ##
% ##################################################################################
%
%  function X1 = lfft(x1)
%
%  Transformation einer reellen Folge x1(k) der Laenge 2N durch eine
%  N-Punkte FFT 
%  N.B.:  x1 muss ein Zeilenvektor sein.

function X1 = lfft(x1)

lx = length(x1);
if rem(lx,2)==1                   % Ungerade Anzahl von Datenwerten
  disp('WARNING:  Eine gerade Anzahl von Datenwerten ist notwendig:')
  disp('          das letzte Datum wird nicht verwendet.')
  x1(lx) = [];
  lx = lx-1;
end
N = lx/2;                         % Laenge von reellem x1:  2N
kk = 1:N;
y  = x1(2*kk-1);                  % Gl. (7.1.11a)
z  = x1(2*kk);                    % Gl. (7.1.11b)
x  = y + j*z;                     % Gl. (7.1.12) 
% Laenge von komplexem x:  N
X  = fft(x);                      % Laenge von X:  N
X  = [X X(1)];                    % Laenge von X:  N+1
Y  = (X + conj(fliplr(X)))/2;     % Gl. (7.1.7)
Z =  (X - conj(fliplr(X)))/2/j;   % Gl. (7.1.8)
X1 = Y + exp(-j*pi*(0:N)/N).*Z;   % Gl. (7.1.17)
X1 = [X1 fliplr(conj(X1(2:N)))];  % Laenge von X1:  2N
% #####  EOF  #####
