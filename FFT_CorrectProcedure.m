N = 8;
M = 256;

n=0:N-1;
x = 0.5 + (n > N/4 & n < 3*N/4);

clf,subplot(211)
stem(n,x, 'filled')
xlabel 'n',
ylabel 'x[n]'
axis([0 N 0 2])

X = N * fft(x, N);

middle= X(N/2+1)/2;

Y = M * [X(1:N/2) middle zeros(1,(M-1)*N-1) middle X(N/2+2:end)];

y = 1/(N) * ifft(Y, N*M);


t = linspace(0, N, N*2*M);
xt = 0.5 + sinc(t-3)+ sinc(t-4)+ sinc(t-5);

subplot(212)

plot(0:length(y)-1,y, 'o', t*M, xt, '--')

legend('y[n]','x(t)')
xlabel 'n',
ylabel 'y[n]'
axis([0 N*M 0 2])
title 'FFT-basedinterpolationof x[n]'


hold on
stem(n*M, x, 'filled')
hold off