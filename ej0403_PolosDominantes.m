% función de transferencia
sys1 = zpk([-.48],[-1,-2,-.5],1);
step(sys1)
figure
pzmap(sys1)
sgrid

% fracciones parciales
syms s
sys2 = 1/((s+1)*(s+2)*(s+0.5))
P = partfrac(sys2)
C = children(P)
C = [C{:}]
[N,D] = numden(C)

