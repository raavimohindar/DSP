% ##############################################################################
% ##  Loesung:  DFT: Abbruchfehler, Unterabtastung                            ##
% ##############################################################################

kk08  = 0:7;
kk64  = 0:63;
kk100 = 0:8/100:8; 

x1_08 = sin(kk08*pi/8);    x1_64 = sin(kk64*pi/8);
x2_08 = sin(kk08*pi/2);    x2_64 = sin(kk64*pi/2);
x3_08 = sin(kk08*pi*3/2);  x3_64 = sin(kk64*pi*3/2);

% # grafische Ausgabe # %
figure; 
plot(kk100,sin(kk100*pi/8),':'); 
hold on;
stem(kk08,x1_08); 
axis([0 8 -1.2 1.2]); 
title('x1(k)=sin(k*pi/8), k=0...7');

figure;
stem(kk08,abs(fft(x1_08))); 
axis([0 7 -1 6]); 
title('abs(X1(n)),n=0...7');

figure;
stem(kk64,x1_64);
axis([0 64 -1.2 1.2]);
title('x1(k)=sin(k*pi/8),k=0...63');

figure;
stem(kk64,abs(fft(x1_64)));
axis([0 64 -1 40]);
title('abs(X1(n)),n=0...63');

input('....Zum Fortfahren: RETURN druecken');

figure; 
plot(kk100,sin(kk100*pi/2),':'); 
hold on;
stem(kk08,x2_08); 
axis([0 8 -1.2 1.2]); 
title('x2(k)=sin(k*pi/2), k=0...7');

figure;
stem(kk08,abs(fft(x2_08))); 
axis([0 7 -1 6]); 
title('abs(X2(n)),n=0...7');

figure;
stem(kk64,x2_64);
axis([0 64 -1.2 1.2]);
title('x2(k)=sin(k*pi/2),k=0...63');

figure;
stem(kk64,abs(fft(x2_64)));
axis([0 64 -1 40]);
title('abs(X2(n))),n=0...63');

input('....Zum Fortfahren: RETURN druecken');

figure;
plot(kk100,sin(kk100*pi*3/2),':'); 
hold on;
stem(kk08,x3_08); 
axis([0 8 -1.2 1.2]); 
title('x3(k)=sin(k*pi*3/2), k=0...7');

figure;
stem(kk08,abs(fft(x3_08))); 
axis([0 8 -1 6]); 
title('abs(X3(n)), n=0...7'); 
axis([0 7 -1 6]); 

figure;
stem(kk64,x3_64);
axis([0 64 -1.2 1.2]);
title('x3(k)=sin(k*pi*3/2),k=0...63');

figure;
stem(kk64,abs(fft(x3_64)));
axis([0 64 -1 40]);
title('abs(X3(n)),n=0...63');
% #####  EOF  #####
