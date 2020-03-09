function [I]=FourierH(t,f,w)

N = length(f);
dt = t(2)-t(1);

E = exp(-j*w*t.');

x = w*dt;

I = (dt*2*(1-cos(x))./(x.^2)).*(E*f);
I = I - dt*(1+j*x-exp(+j*x))./(x.^2)*f(1).*exp(-j*w*t(1));
I = I - dt*(1-j*x-exp(-j*x))./(x.^2)*f(N).*exp(-j*w*t(N));
