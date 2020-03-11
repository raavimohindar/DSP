function [I]=FourierR(t,f,w)

I = conj(FourierH(t,conj(f),w))/(2*pi);
