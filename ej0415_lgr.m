% lugar de las raices
% Ejemplo
% G(s)= K /(s(s+1)(s+2))
% H(s) = 1;

G = tf(1,[1,3,2,0])
rlocus(G)

K = 1.06;

T = tf(K,[1,3,2,K])
step(T)

roots(T.Denominator{1})
