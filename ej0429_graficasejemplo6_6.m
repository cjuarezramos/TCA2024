% comparando controladores
% Planta
Gp = tf(10,conv([1,0],[1,1]))
Gc1 = 1.23*tf([1,1.9373],[1,4.6458])
Gc2 = 0.9*tf([1,1],[1,3])
T0 = Gp/(1+Gp);
T1 = Gp*Gc1/(1+Gp*Gc1)
T2 = Gp*Gc2/(1+Gp*Gc2)
[y0,t0]=step(T0,10)
[y1,t1]=step(T1,10);
[y2,t2]=step(T2,10);

plot(t0,y0,t1,y1,t2,y2,'LineWidth',2)