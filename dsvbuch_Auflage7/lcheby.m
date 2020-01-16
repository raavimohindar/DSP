% ##################################################################################
% ##  Funktion: lcheby.m; Berechnung der kausalen Chebychev-Fensterfunktion       ##
% ##################################################################################
%
%  function [f_dt,F_dt,a_min_dB] = lcheby(N,Omega_s,delta_Omega)
%
%  Berechnung der kausalen Chebychev-Fensterfunktion mittels Ruecktrafo
%  aus dem Spektralbereich. Diese Routine liefert im Gegensatz zur
%  Matlab-Funktion "chebwin" auch fuer gerade N das richtige Ergebnis.
%  Inputs:  N          :  Fensterlaenge im Zeitbereich
%           Omega_s    :  Sperrbereichs-Grenzfrequenz
%           delta_Omega:  Stuetzstellenabstand im Frequenzbereich
%  Outputs: f_dt       :  Kausale Fensterfunktion (reell)
%           F_dt       :  Spektralfunktion des Fensters (komplex)
%           a_min_dB   :  Erreichte Sperrdaempfung in dB.
%  Bsp.:    N=34;  lcheby(N,0.1*pi,2*pi/N/8)

function [f_dt,F_dt,a_min_dB] = lcheby(N,Omega_s,delta_Omega)

Omega    = 0:delta_Omega:2*pi-delta_Omega;
F_dt     = [cosh((N-1)*acosh(cos(Omega/2)/cos(Omega_s/2)))];
F_dt     = F_dt .*exp(-j*(N-1)*Omega/2);   % damit f_dt kausal wird
f_dt     = real(ifft(F_dt));         % Imaginaerteile (=1e-14) abschneiden

fn_dt    = f_dt/max(f_dt);           % reell, max{fn_dt}=1
Fn_dt    = F_dt/max(abs(F_dt));      % kompl, max{|Fn_dt|}=1 = 0dB
aFn_dt_dB= 20*log10(abs(Fn_dt));
a_min_dB = 20*log10(cosh((N-1)*acosh(1/cos(Omega_s/2))));

figure; fT  = Omega/(2*pi);   f_sT = Omega_s/(2*pi); y_axis = [-a_min_dB-35 10];
plot(fT, aFn_dt_dB);  hold on;  ylabel('|F(exp(j*Om.))/F(exp(j*0))| in dB');
title(sprintf('|Norm. DT-Spektralfunktion|: N=%d, Om_s/2pi=%.2f,dOm/2pi=1/%d',...
              N, f_sT, round(2*pi/delta_Omega)));  xlabel('Omega/2pi = f T');
textstring = sprintf('a_{min} = %.1f dB', a_min_dB);
text(0.22, -0.8*(a_min_dB-5), textstring);  axis([0 1 y_axis]);
plot([f_sT f_sT],y_axis,':'); 
text(f_sT+0.01,-0.1*(a_min_dB-5),'\Omega_{s}/2\pi=f_{s} T');
figure; bar(0:length(fn_dt)-1, fn_dt);  hold on;  plot([N-1 N-1],[0 1.1],':');
title('Normierte Koeffizienten des Dolph-Tschebyscheff-Fensters');
ylabel('f(k)');  xlabel('k');  axis([-0.5 2*N-0.5 0 1.1]);
% #####  EOF  #####
