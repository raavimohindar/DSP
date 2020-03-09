% ##############################################################################
% ##  Loesung:  Spezielle Folgen                                              ##
% ##############################################################################

% #####  Teilaufgabe a:  Impulsfolge  #####
k_a = -5:10;    % initialisieren des Koeffizientenvektors k mit Werten von 
                % -5 .. 10;
x = zeros(1,16);% x wird als ZEILEN-Vektor mit 16 Nullen initialisiert;
x(5+1+4) = 1;   % Der Diracimpuls '1' soll beim zeitlichen Index k=4 erscheinen;
                % Der zeitliche Index k=-5 entspricht dem Matlab-Index '1',
                % daher muss man für k=4 den Matlabe-Index 10 wählen;
                 
x = 1.2 * x;    % Multiplikation der Folge mit dem Faktor 1.2 ;

% # grafiche Ausgabe # %
figure; 
stem(k_a,x);
set(gca,'XTick',[-4:2:10]); 
title('x(k)=1.2 \delta(k-4)'); 
xlabel('Abtastwerte k'); 
ylabel('Amplitude');

% #####  Teilaufgabe b:  Gauss- und Laplacefolgen  #####
% Koeffizientenvektoren
k_b1 = -20:20;
k_b2 = -20:20;
k_b3 = -30:30;
k_b4 = -600:600;

% Alpha-Faktor für Gaußfolge
alpha = 0.01;

% Beta-Faktoren für Laplacefolgen
beta_2 = 0.2;
beta_3 = 0.1;
beta_4 = 0.005;

% Berechnung der Folgen
x1 = exp(-alpha *k_b1.^2);
x2 = exp(-beta_2*abs(k_b2));
x3 = exp(-beta_3*abs(k_b3)) .* cos(2*pi/4*k_b3);
x4 = exp(-beta_4*abs(k_b4)) .* cos(2*pi/80*k_b4);

% # grafische Ausgabe # %
% Gaußfolge
figure;
plot(k_b1,x1);
hold on; 
stem(k_b1,x1,'k'); 
hold off;
title('Gaussfolge x_1(k)'); 
xlabel('k'); 
ylabel('Amplitude');

% Laplacefolge
figure;
plot(k_b2,x2);
hold on;
stem(k_b2,x2,'k'); 
hold off;
title('Laplacefolge x_2(k)'); 
xlabel('k'); 
ylabel('Amplitude');

% modifizierte Laplacefolge beta = 0.1
figure;
plot(k_b3,x3);
hold on;
stem(k_b3,x3,'k');  
hold off;
grid on; 
title('Modulierte Laplacefolge x_3(k)'); 
xlabel('k'); 
ylabel('Amplitude');

% modifizierte Laplacefolge beta = 0.005
figure;
plot(k_b4,x4,'k');
grid on;
title('Modulierte Laplacefolge  x_4(k)'); 
xlabel('k'); 
ylabel('Amplitude');
% #####  EOF  #####
