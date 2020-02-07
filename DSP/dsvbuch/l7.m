% ##############################################################################
% ##  Loesung:  Faltungsmatrix                                                ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lconvmtx.m                                    ##
% ##############################################################################

% #####  Teilaufgabe b:  Faltungsmatrix testen #####
h = [1 2 3 4 5].';           % Impulsantwort des Systems
x = sin(2*pi*1/10*[0:19].'); % Testsignal

yhx = conv(h,x);             % direkt ausgefuehrte Faltung

Hh = lconvmtx(h,length(x));  % Faltung mit Hilfe der Faltungsmatrix
yHhx = Hh*x;
differenz = yhx-yHhx         % Vergleich durch Diferenzbildung

% #####  Teilaufgabe c:  Vertauschung System <> Signal #####
disp('1.Variante: Faltungsmatrix mit h gebildet');

Hh = lconvmtx(h,length(x));
Hhsize = size(Hh)           % 24 x 20 Matrix
Hhsizeprod = prod(Hhsize)   % Matrix hat 480 Eintraege
convHhx = Hh*x;

disp('2.Variante: Faltungsmatrix mit x gebildet');
Hx = lconvmtx(x,length(h));
Hxsize = size(Hx)           % 24 x 5 Matrix
Hxsizeprod = prod(size(Hx)) % Matrix hat 120 Eintraege

yHxx = Hx*h;
% #####  EOF  #####
