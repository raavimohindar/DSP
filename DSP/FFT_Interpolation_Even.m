N = 8;
M = 128;

n=0:N-1;
x = 0.5 + (n > N/4 & n < 3*N/4);

figure(1)

subplot(211)
stem(n,x, 'filled')
xlabel 'n',
ylabel 'x[n]'
axis([0 N 0 2])

X = N * fft(x, N);

middle= X(N/2+1)/2;

Y = (M/N) * [X(1:N/2) middle zeros(1, M-length(X)-1) middle X(N/2+2:end)];

y = 1/(N) * ifft(Y, M);


t = linspace(0, N, M);

xt = 0.5 + sinc(t-3)+ sinc(t-4)+ sinc(t-5);


subplot(212)

plot(0:length(y)-1,y, 'o', t*(M/N), xt, '--')

legend('y[n]','x(t)')
xlabel 'n',
ylabel 'y[n]'
axis([0 M 0 2])
title 'FFT-basedinterpolationof x[n]'


hold on
stem(n*(M/N), x, 'filled')
hold off