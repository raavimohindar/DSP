close all;
clear all;

clear;

M = 7;
N = 4;

A = 1:4;
window = ones(1, 4);

y_c = conv(A, window)

Redundant = 4*M;

A3 =       fft(A,      Redundant);  % freq domain interpolation

W3 =       fft(window, Redundant);  % freq domain interpolation

y_t = abs(ifft(A3.*W3, Redundant))';   % y_t = y_c


Recover = abs(ifft(A3))(1:length(A))