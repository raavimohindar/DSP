x=ones(1,64);
y=hamming(64);
rxx=xcorr(x,'coeff');
ryy=xcorr(y,'coeff');
k=[-(length(rxx)-1)/2:(length(rxx)-1)/2];

figure
plot(k,rxx,'-'); hold on; plot(k,ryy,'--');
legend('Rechteck','Hamming');
title('Faltung unterschiedlicher Fensterfunktionen ');
xlabel('\kappa'); ylabel('Amplitude');
axis([-63 63 0 1]); grid;
% #####  EOF  #####
