function [I]=FourierH(w,f,t)

N = length(f);

dw = w(2)-w(1);

E = exp(-j*t*w.');

x = t*dw;

I = (dw*2*(1-cos(x))./(x.^2)).*(E*f);

I = I - dw*(1+j*x-exp(+j*x))./(x.^2)*f(1).*exp(-j*w(1)*t);

I = I - dw*(1-j*x-exp(-j*x))./(x.^2)*f(N).*exp(-j*w(N)*t);
