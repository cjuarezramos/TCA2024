% función de transferencia
sys1 = zpk([-1],[-7,-35,-1],1);
figure
step(sys1)
figure
pzmap(sys1)
sgrid

% fracciones parciales
syms s
sys2 = (s+2)/((s+1)*(s+20)*(s+10))
P = partfrac(sys2)
C = children(P)
C = [C{:}]
[N,D] = numden(C)

