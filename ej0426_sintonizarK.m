% ejercicio discusion
K = 0.13;
Kh = 0.10;
num = 20*K;
den = [1,5,20*K*Kh+4,20*K];
T = tf(num,den)
step(T)


% Lugar de las raices
numa=[20*Kh,20]
dena=[1,5,4,0]
sys= tf(numa,dena)
rlocus(sys)