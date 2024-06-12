% ej0610_datosenf
% sistema de lazo cerrado:
T1 = tf(1,[1,1])
T2 = tf(1,[3,1])
figure(1)
bode(T1)
hold on;
bode(T2)
hold off

[y1,t1]=step(T1,12);
[y2,t2]=step(T2,12);
figure(2)
plot(t1,y1,t2,y2)

% Sistema de segundo orden
% g=1/(s*(0.5*s+1)*(s+1))
G = tf(1,conv([1,0],conv([0.5,1],[1,1])))
T = feedback(G,1) % lazo cerrado
pLC = roots(T.Denominator{1})

% Margen de fase y margen de ganancia
figure
margin(G)
figure
bode(T)

figure
step(T)
