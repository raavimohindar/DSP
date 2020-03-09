function [I]=FourierR(w,f,t)

I = conj(FourierH(w,conj(f),t))/(2*pi);
