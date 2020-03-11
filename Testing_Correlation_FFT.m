clear;

N = 4;
M = 2*N;

a = 1:4;
b = 3:6;

r = ones(1, N);           
W = fft(r, N);

B1 = fft(b, M); 

A1 = fft(a);
A2 = (A1).*W;

A3 = ifft(A2, N);                         % do not calculate

A4 = fft(A3,                          M); % A4 and A5 are the same

A5 = A4.*conj(B1);


x1 = xcorr(A3,b)
x2 = fftshift((ifft(A5, M)))

middle = A2(N/2+1)/2;

A22 = [A2(1:N/2) middle zeros(1, 2*N-length(A2)-1) middle A2(N/2+2:end)];

A66 = (A22.*conj(B1));

x22 = ifft(A66)