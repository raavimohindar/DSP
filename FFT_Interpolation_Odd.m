N = 11;
M = 64;

n=0:N-1;
x =  (n > N/4 & n < 3*(N-1)/4);


figure(2)

subplot(211)
stem(n,x, 'filled')
xlabel 'n',
ylabel 'x[n]'
axis([0 N-1 0 2])

X = N * fft(x, N);

Y = (M/N) * [X(1:(N-1)/2+1) zeros(1,M-length(X)) X((N-1)/2+2:end)];

y = 1/(N) * ifft(Y, M);

t = linspace(0, N, M);

xt =  sinc(t-3) + sinc(t-4) + sinc(t-5) + sinc(t-6) + sinc(t-7);

subplot(212)

plot(0:length(y)-1,y, 'o', t*(M/N), xt, '--')

legend('y[n]','x(t)')
xlabel 'n',
ylabel 'y[n]'
axis([0 M-1 -0.5 2])
title 'FFT-basedinterpolationof x[n]'

hold on
stem(n*(M/N), x, 'filled')
hold off