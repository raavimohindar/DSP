% ##############################################################################
% ##  Loesung:  Effizienz des Raderverfahrens                                 ##
% ##  ----------------------------------------------------------------------  ##
% ##  Benoetigte(s) m-File(s):  lrader.m,  lsum.m, lakffft.m                  ##
% ##############################################################################
% Anhand der verwendeten Rechenoperationen (flops) sowie der Rechen-
% zeit wird ein Vergleich der Rechengeschwindigkeit einer AKF-
% Schaetzung nach Rader mit einer direkten Berechnung (Summenformel)
% durchgefuehrt. Die Ergebnisse werden mit diesem m-File aufgetragen.

N = 2^13; % Exponent fuer schnelle Rechner erhoehen
x = randn(1,N)+j*randn(1,N);
loop = 1:6;

if (sscanf(version,'%f',1)<6)
    flopsavailable=1;
else
    % Messungen der flops sind bei neueren Matlab Versionen nicht mehr verfuegbar
    flopsavailable=0;
end;

for l = loop
    if(flopsavailable) 
        flops(0); 
    end
    
    zeit = cputime;
    rxx1 = lrader(2^l,x);
    time_rader(l)  = cputime-zeit;
    
    if(flopsavailable) 
        flops_rader(l) = flops; 
    end

    if(flopsavailable)
        flops(0); 
    end
    
    zeit = cputime;
    rxx2 = lsum(2^l,x);
    time_sum(l)  = cputime-zeit;
    
    if(flopsavailable) 
        flops_sum(l) = flops; 
    end

    if(flopsavailable)
        flops(0); 
    end
    
    zeit = cputime;
    rxx3 = lakffft(2^l,x);
    time_fft(l)  = cputime-zeit;
    
    if(flopsavailable) 
        flops_fft(l) = flops; 
    end
end

disp('Mean square error (MSE) der AKF-Sch. bzgl. Summenformel:');
disp(sprintf('  mse_rader:  %g', mean(abs(rxx1-rxx2).^2)));
disp(sprintf('  mse_fft  :  %g', mean(abs(rxx3-rxx2).^2)));

MM = (2*ones(1,length(loop))).^loop;  
time_max   = max(time_rader);
kflops_max = 300;

% # grafische Ausgabe #%
figure; 
plot(MM, time_sum); 
hold on; 
plot(MM, time_rader,'--');
plot(MM, time_fft,':'); 
axis([0 2^max(loop) 0 1.1*time_max]); 
xlabel('M');
ylabel('CPU-Zeit in Sek.');
title('Zur AKF-Schaetzung benoetigte Rechenzeit');
pos=0.9*time_max; 
text(38,pos,'---');  
text(45,pos,'Summe');
pos=0.64*time_max; 
text(38,pos,'- -'); 
text(45,pos,'Rader');
pos=0.46*time_max;
text(38,pos,'. . .'); 
text(45,pos,'FFT');

if(flopsavailable)
    figure; 
    plot(MM, flops_sum/1000); 
    hold on; 
    plot(MM, flops_rader/1000,'--');
    plot(MM, flops_fft/1000,':'); 
    axis([0 2^max(loop) 0 1.1*300]);
    title('Erforderlicher Rechenaufwand in kflops'); 
    ylabel('kflops'); 
    xlabel('M');
    pos=0.22*kflops_max; 
    text(38,pos, '- -'); 
    text(45,pos,'Rader');
    pos=0.95*kflops_max; 
    text(38,pos, '---');  
    text(45,pos,'Summe');
    pos=0.67*kflops_max; 
    text(38,pos,'. . . '); 
    text(45,pos,'FFT');
end
% #####  EOF  #####