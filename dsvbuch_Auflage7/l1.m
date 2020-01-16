% ##############################################################################
% ##  Loesung:  Funktionsgenerator                                            ##
% ##############################################################################

close all;      % alle Figures schliessen
clear all;      % alle Variablen löschen

fa=8000;        % Festsetzen der Abtastrate


% #####  Teilaufgabe a:  Sinussignal  #####
% # Berechnung des Signalvektors # %
k=0:59;             % Erstellen eines Vektors der Laenge 60 mit den Eintraegen 
                    % 0 bis 59
f0=400;             % Signalfrequenz
Omega0=2*pi*f0/fa;  % Auf Abtastrate normierte Frequenz
xsin=sin(Omega0*k); % Sinussignalvektor

% # Grafische Ausgabe # %
figure;                 % Neue Figure öffnen
stem(k,xsin);           % Diskretes 'plotten' des Signals xsin; k ist der Vektor
                        % mit den Werten auf der x-Achse
xlabel('k');            % Achsenbeschriftung an der x-Achse
ylabel('x_{sin}(k)');   % Achsenbeschriftung an der y-Achse


% #####  Teilaufgabe b:  Sinussignal, veraenderte Periode  #####
% # Berechnung des Signalvektors # %
f0=960;                 % Signalfrequenz
Omega0=2*pi*f0/fa;      % Normierte Frequenz
xsin=sin(Omega0*k);     % Sinussignalvektor 

% # Grafische Ausgabe # %
figure;         
stem(k,xsin);   
xlabel('k');
ylabel('x_{sin}(k)');
                
                
% #####  Teilaufgabe c:  Saegezahnsignal  #####
xsaw=mod(f0/fa*k,1);    % Saegezahnsignalvektor

% # Grafische Ausgabe # %
figure; 
stem(k,xsaw); 
xlabel('k'); 
ylabel('x_{saw}(k)');

% #####  Teilaufgabe d:  entnormierte Signale, Tonerzeugung  #####
f0=1000;                % Signalfrequenz
d=2;                    % Abspieldauer in Sekunden
w=d*fa;                 % Anzahl der Abtastwerte
k=0:w;                  % Koeffizientenvektor des Zeitindexes
xsin=sin(2*pi*f0/fa*k); % Sinussignalvektor
xsaw=mod(f0/fa*k,1);    % Sägezahnsignalvektor

% # Wiedergabe der Signale # % 
disp('Sie hoeren: 2s Sinussignal');     sound(xsin,fa);
disp('Sie hoeren: 2s Saegezahnsignal'); sound(xsaw,fa);
% #####  EOF  #####