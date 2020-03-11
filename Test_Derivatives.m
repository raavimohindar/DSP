close all;
clear all;

format shortG

N = 15;

x = [0:2*pi/16:2*pi];

f       = sin(x)         
f_d     = cos(x)          % d/dx
f_dd    = -1.0*sin(x);    % d^2/dx^2

y       = f_d.*f;

stem(x, f);
hold on;
plot(x, y);




