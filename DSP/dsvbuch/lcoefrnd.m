% ##################################################################################
% ##  Funktion  [aq,nfa]=lcoefrnd(a,w)                                            ##
% ##################################################################################
% Quantisierung eines Koeffizientenvektors A auf eine gewuenschte Wortlaenge W.

function [aq,nfa]=lcoefrnd(a,w)

f  = log(max(abs(a)))/log(2);     % Normierung von A
n  = 2^ceil(f);                   % durch n (Potenz von 2), so dass,
an = a/n;                         % 1 >= an >= -1.
aq = lfxquant(an,w);              % Quantisierung von a, so dass,
% 1 > aq >= -1;
nfa = n;                          % Normierungsfaktor
% ##### EOF #####
