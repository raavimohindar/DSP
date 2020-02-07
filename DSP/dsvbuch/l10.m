% ##############################################################################
% ##  Loesung: Gleichverteilter zeitdiskreter stochastischer Prozess          ##
% ##############################################################################
N=10000;

% #####  Teilaufgabe a: Rauschfolge  #####
n = rand(N,1);

% #####  Teilaufgabe b: Histogramm  #####
n = rand(N,1);
[H,x] = hist(n,30);
H = H/N;      % Damit H eine Schaetzung der Wahrscheinlichkeitsdichte
              % ist, muss die Flaeche eins sein

% # grafische Ausgabe # %              
figure; 
bar(x,H);
grid; 
xlabel('x'); 
ylabel('f_X(x)'); 
title(['Gleichvert. Mittelw.=',num2str(mean(n)),' Var.=',num2str(std(n).^2)]);

% #####  Teilaufgabe c:  Mittelwert und Varianz  #####
n = rand(N,1);
m = mean(n);
s = var(n);

% #####  Teilaufgabe d:  Musterfunktion  #####
for k=1:5
    n = rand(N,1);
    [H,x]=hist(n,30);
    H = H/N;
    
    % # grafische Ausgabe # %
    figure; 
    bar(x,H); 
    grid; 
    xlabel('x'); 
    ylabel('f_X(x)');
    title(['Gleichvert. Mittelw.=',num2str(mean(n)),' Var.=',num2str(std(n).^2)]);
end;
% #####  EOF  #####