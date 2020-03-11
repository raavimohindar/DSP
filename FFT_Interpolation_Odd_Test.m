N = 7;
M = 128;

n=0:N-1;
x =  (n > N/4 & n < 3*(N-1)/4);

x = [0 0 2 1 2 0 0];

figure(2)

subplot(211)
stem(n,x, 'filled')
xlabel 'n',
ylabel 'x[n]'
axis([0 N-1 0 2])

X = fft(x);
Y = [X(1:(N-1)/2+1) zeros(1,M-length(X)) X((N-1)/2+2:end)];
y = ifft(Y);

t = linspace(0, N, M);
xt =  2*sinc(t-2) + sinc(t-3) + 2*sinc(t-4);

subplot(212)

plot(0:length(y)-1, (M/N)*y, 'o')
hold on;

plot(t*(M/N),            xt, '--')
hold on;

stem(n*(M/N), x, 'filled')
hold off

legend('y[n]','x(t)')
xlabel 'n',
ylabel 'y[n]'
axis([0 M-1 -1 3])
title 'FFT-basedinterpolationof x[n]'