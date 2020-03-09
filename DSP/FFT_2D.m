N = 8;            % length of columns-rows 
x = randn(N,N);   % row data

X = fft(x,N) ;    % 1D-fft along columns of x[n1,n2]
X = fft(X.',N).' ;% 1D-fft along rows of intermediate X[k1,k2]

